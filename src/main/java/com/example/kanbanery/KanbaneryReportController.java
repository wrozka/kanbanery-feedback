package com.example.kanbanery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import pl.project13.janbanery.core.Janbanery;
import pl.project13.janbanery.exceptions.kanbanery.InvalidEntityKanbaneryException;
import pl.project13.janbanery.resources.Task;
import pl.project13.janbanery.resources.User;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import java.io.IOException;

import static org.springframework.util.StringUtils.hasText;

/**
 * Used for posting tickets to our kanbanery board.
 */
@Controller
@RequestMapping("/kanbanery/report")
public class KanbaneryReportController extends RTConnectController
{

   private static final char newLine = '\n';

   Logger log = LoggerFactory;

   @Autowired
   Janbanery janbanery;

   private User me;

   @PostConstruct
   public User getMyKanbaneryUser() 
   {
      if(me == null) 
      {
         me = janbanery.users().current();
      }

      return me;
   }

   @RequestMapping(method = RequestMethod.GET)
   public ModelAndView getReportPage()
   {
      return new ModelAndView("kanbanery/report");
   }

   @RequestMapping(method = RequestMethod.POST)
   public ModelAndView sendReport(@FormParam("title") String title, @FormParam("os") String os,
                                  @FormParam("url") String url, @FormParam("browser") String browser,
                                  @FormParam("description") String description, @FormParam("steps") String steps)
   {
      try
      {
         createTaskOnKanbanery(title, url, os, browser, description, steps);
      }
      catch (InvalidEntityKanbaneryException e)
      {
         log.error("Unable to create bugreport on Kanbanery.", e);

         ModelAndView mav = new ModelAndView("kanbanery/error");
         mav.addObject("reason", e.getMessage());
         return mav;
      }
      catch (IOException e) // todo this is changed in Janbanery 1.4, will update soon
      {
         log.error("Unable to create bugreport on Kanbanery.", e);

         ModelAndView mav = new ModelAndView("kanbanery/error");
         mav.addObject("reason", e.getMessage());
         return mav;
      }

      return new ModelAndView("kanbanery/thanks");
   }

   private void createTaskOnKanbanery(String title, String url, String os, String browser, String description, String steps)
         throws IOException
   {
      StringBuilder sb = new StringBuilder();

      if (hasText(os))
      {
         sb.append("OS:").append(newLine)
           .append(os).append(newLine)
           .append(newLine);
      }

      if (hasText(browser))
      {
         sb.append("Browser:").append(newLine)
           .append(browser).append(newLine)
           .append(newLine);
      }

      if (hasText(url))
      {
         sb.append("Url:").append(newLine)
           .append(url).append(newLine)
           .append(newLine);
      }

      if (hasText(description))
      {
         sb.append("Description:").append(newLine)
           .append(description).append(newLine)
           .append(newLine);
      }

      if (hasText(steps))
      {
         sb.append("Steps:").append(newLine)
           .append(steps).append(newLine)
           .append(newLine);
      }

      Task bug = new Task.Builder(title, "bug").description(sb.toString())
                                               .build();

      janbanery.tasks().create(bug)
               .assign().to(me);
   }

}

