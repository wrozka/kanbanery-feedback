<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Unable to create a bug report</title>

  <jsp:include page="_style.jsp"/>

  <script type="text/javascript">
    function resize() {
      self.resizeTo(650, 550);
    }

// todo does not work as expected
//    function tryAgain() {
//      history.back();
//    }

    function closeWindow() {
      self.close();
    }
  </script>

</head>
<body onload="resize();">
<div id="main">
  <h1>
    My Example Project
  </h1>

  <form method="post" id="form" action="">
    <fieldset>
      <h2 class="error">Ups, we couldn't create a bug report...</h2>


      <h3>Reason:</h3>

      <div>
        ${reason}
      </div>

      <h3>Sorry...</h3>

      <div>
        Sorry, but we couldn't create a new Task on the Kanbanery board...<br/>
        Here's a few of things that you could check:
        <ul>
          <li>Did the project/workspace or your privileges change?</li>
          <li>Is the tools user added to the project?</li>
          <li>Is your firewall permitting access to https://kanbanery.com/?</li>
          <li>Is Kanbanery down?</li>
        </ul>
      </div>

      <%--<input class="submit" type="submit" value="Try again" onclick="tryAgain()">--%>
      <input class="submit" type="submit" value="Close window" onclick="closeWindow()">
    </fieldset>
  </form>
</div>
</body>
</html>
 
