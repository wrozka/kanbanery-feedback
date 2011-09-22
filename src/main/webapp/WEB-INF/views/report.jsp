<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Bug report</title>

  <!-- include all javascript files here -->

  <jsp:include page="_style.jsp"/>

  <script type="text/javascript">
    $(document).ready(function() {
      var messages = {
        401 : "Authentication problem",
        422 : "Kanbanery side validation problem",
        404 : "Project or workspace not found"
      }

      var form = $("#form");
      var submit = $("input[type=submit]");
      var header = $("h1");
      var mandatory = ["title"];

      var enable = function(elem) {
        elem.removeAttr("disabled");
      };

      var disable = function(elem) {
        elem.attr("disabled", "disabled");
      };

      var mandatoryArray = function() {
        return form.serializeArray().filter(function(elem) {
          return mandatory.indexOf(elem.name) != -1;
        });
      };

      var descriptionArray = function() {
        return form.serializeArray().filter(function(elem) {
          return mandatory.indexOf(elem.name) == -1;
        });
      };

      $.validator.addMethod("descriptionLengthAllowed", function(value, element) {
        length = 0;
        descriptionArray().forEach(function(elem) {
          length += elem.value.length
        });
        return length <= 65535;
      }, "Lenght of bug body should be lower than 65535");


      form.validate({
        submitHandler: function(form_dom) {
          form_dom.submit();
        }
      });
      descriptionArray().forEach(function(elem) {
        $("[name=" + elem.name + "]").rules("add", { descriptionLengthAllowed : true })
      });
    });
  </script>
</head>
<body>
<div id="main">
  <h1>
    My Example Project
  </h1>

  <form method="post" id="form" action="">
    <fieldset>
      <legend>Create a bug report</legend>
      <p>
        <label for="title">Title</label>
        <input id="title" name="title" maxlength="256" class="required error" size="40">
      </p>

      <p>
        <label for="os">Operating System</label>
        <select id="os" name="os" class="required error">
          <option value=""></option>
          <option value="linux">Linux</option>
          <option value="windows">Windows</option>
          <option value="mac">Mac OS X</option>
          <option value="other">Other</option>
        </select>
      </p>
      <p>
        <label for="browser">Browser</label>
        <select id="browser" name="browser" class="required error">
          <option value=""></option>
          <option value="firefox">Firefox</option>
          <option value="safai">Safari</option>
          <option value="opera">Opera</option>
          <option value="ie">Internet Explorer</option>
          <option value="other">Other</option>
        </select>
      </p>

      <p>
        <label for="description">Description</label>
        <textarea id="description" name="description" class="required error" cols="40" rows="8"></textarea>
      </p>

      <p>
        <label for="steps">Steps to reproduce</label>
        <textarea id="steps" name="steps" class="required error" cols="40" rows="10"></textarea>
      </p>

      <p>
        <input class="submit" type="submit" value="Report">
      </p>
    </fieldset>
  </form>
</div>
</body>
</html> 
