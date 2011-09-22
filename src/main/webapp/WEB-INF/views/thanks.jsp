<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Created a bug report</title>

  <jsp:include page="_style.jsp"/>

  <script type="text/javascript">
    var countdown;
    var countdown_number;

    function resize() {
      self.resizeTo(650, 400);
    }

    function closeWindow() {
      self.close();
    }

    function countdownInit() {
      countdown_number = 6;
      countdownTrigger();
    }

    function countdownTrigger() {
      if (countdown_number > 0) {
        countdown_number--;
        document.getElementById('countdown_text').innerHTML = countdown_number;

        countdown = setTimeout('countdownTrigger()', 1000);
      } else {
        closeWindow();
      }
    }

    function countdownClear() {
      clearTimeout(countdown);
    }
  </script>

</head>
<body onload="countdownInit(); resize();">
<div id="main">
  <h1>
    My Example Project
  </h1>

  <form method="post" id="form" action="">
    <fieldset>
      <h2>Thanks for the report!</h2>

      <p>
        It should appear in the kanbanery board of this project immediatly.<br/>

        <span style="font-size: x-small;">
          (This window will close automatically in <span id="countdown_text">5</span> seconds...)
        </span>
      </p>
      <input class="submit" type="submit" value="Close window" onclick="closeWindow()">
    </fieldset>
  </form>
</div>
</body>
</html>
 
