<style type="text/css">
  body {
    font: 13px/1.5 Helvetica, Arial, sans-serif;
  }

  legend {
    font-weight: bold;
    font-size: 16px;
  }

  fieldset {
    border: 0;
    border-bottom: 1px solid #ddd;
    background: #f5f5f5;
    background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.8, rgb(245, 245, 245)), color-stop(1, rgb(255, 255, 255)));
    background-image: -moz-linear-gradient(center bottom, rgb(245, 245, 245) 80%, rgb(255, 255, 255) 100%);
    background-image: -webkit-linear-gradient(center bottom, rgb(245, 245, 245) 80%, rgb(255, 255, 255) 100%);

    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    border-radius: 10px;

    margin-bottom: 20px;
  }

  label {
    width: 110px;
    text-align: right;
    margin-right: 15px;
    display: block;
    float: left;
  }

  label.error {
    float: none;
    display: inline;
    margin-left: 10px;
    font-size: 11px;
    color: #f00;
  }

  input[type=checkbox] {
    margin-left: 100px;
    margin-right: 15px;
  }

  input[type=submit] {
    background: #347386 url(/images/landing/bg-button.png) 0 0 repeat-x;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(60, 136, 157)), color-stop(1, rgb(52, 115, 134)));
    background-image: -webkit-linear-gradient(center top, rgb(60, 136, 157) 0%, rgb(52, 115, 134) 100%);
    background-image: -moz-linear-gradient(center top, rgb(60, 136, 157) 0%, rgb(52, 115, 134) 100%);

    /* Causes problems on Webkit/Win and Webkit/Linux. Temporarily disabled.
-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.25), 0 1px 0 rgba(0,0,0,.5);
-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.25), 0 1px 0 rgba(0,0,0,.5);
box-shadow:inset 0 1px 0 rgba(255,255,255,.25), 0 1px 0 rgba(0,0,0,.5);*/

    /* Temporary shadow without inset */
    -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, .5), 0 -1px 0 #87c1d1;
    -webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, .5), 0 -1px 0 #87c1d1;
    box-shadow: 0 1px 0 rgba(0, 0, 0, .5), 0 -1px 0 #87c1d1;

    cursor: pointer;

    border: 0;
    -moz-border-radius: 1.25em;
    -webkit-border-radius: 1.25em;
    border-radius: 1.25em;

    color: #fff;
    -moz-text-shadow: 0 1px 0 rgba(0, 0, 0, .5);
    -webkit-text-shadow: 0, 1px 0 rgba(0, 0, 0, .5);
    text-shadow: 0 1px 0 rgba(0, 0, 0, .5);

    padding: 0.5em 1em;
    margin-left: 120px;
  }

  input[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(52, 115, 134)), color-stop(1, rgb(60, 136, 157)));
    background-image: -webkit-linear-gradient(center top, rgb(52, 115, 134) 0, rgb(60, 136, 157) 100%);
    background-image: -moz-linear-gradient(center top, rgb(52, 115, 134) 0, rgb(60, 136, 157) 100%);

    /* Webkit issue
     * -moz-box-shadow:inset 0 1px 0 rgba(0,0,0,.5), 0 1px 0 rgba(255,255,255,.25);
    -webkit-box-shadow:inset 0 1px 0 rgba(0,0,0,.5), 0 1px 0 rgba(255,255,255,.25);
    box-shadow:inset 0 1px 0 rgba(255,0,255,.25), 0 1px 0 rgba(255,255,255,.25);
    */

    /* Temporary shadow without inset */
    -moz-box-shadow: 0 1px 0 #50a4bc, 0 -1px 0 rgba(0, 0, 0, .5);
    -webkit-box-shadow: 0 1px 0 #50a4bc, 0 -1px 0 rgba(0, 0, 0, .5);
    box-shadow: 0 1px 0 #50a4bc, 0 -1px 0 rgba(0, 0, 0, .5);
  }

  h2.error {
    color: #ff0000;
  }
</style> 
