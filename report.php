<?php
//user api key for passwordless bugs
define("KEY", "api key");
//your workspace name
define("WORKSPACE", "workspace name");
//your project ID
define("PROJECT_ID", "project id");

$url = "https://" . WORKSPACE . ".kanbanery.com/api/v1/projects/" . PROJECT_ID . "/tasks.json";

$data = "task[task_type_name]=bug&task[title]=" . $_POST["title"] . "&task[description]=" . $_POST["body"];

$options = array();
if ($_POST["useapi"] == "true") {
  $options = array("headers" => array('X-Kanbanery-ApiToken' => KEY));
} else {
  $options = array("httpauth" => $_POST["email"] . ":" . $_POST["password"],
                   "httpauthtype" => HTTP_AUTH_BASIC);
}
                
$request = new httpRequest($url, HTTP_METH_POST, $options);
$request->setRawPostData ($data);
$result = $request->send();
header("HTTP/1.0 " . $request->getResponseCode());
echo $request->getResponseBody();
?>

