<?php

error_log("${pid} START ${param}");

$param = $_GET['p'];
$pid = getmypid();

sleep(5);

error_log("${pid} FINISH ${param}");

?>
