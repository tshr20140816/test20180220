<?php

$pid = getmypid();
$param = $_GET['p'];

error_log("${pid} START ${param}");

sleep(5);

error_log("${pid} FINISH ${param}");

?>
