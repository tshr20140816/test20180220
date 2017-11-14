<?php
$pid = getmypid();
$count = $_GET['c'];
$url = $_GET['u'];

error_log("${pid} START ${param}");

sleep(5);

$count++;

if ($count < 10)
{
  file_get_contents($url . '?c=' . $count . '&u=' . $url);
}

error_log("${pid} FINISH ${param}");

?>
