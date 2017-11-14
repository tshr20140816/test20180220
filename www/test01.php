<?php

$param = $_GET['p'];
$pid = getmypid();

sleep(5);

error_log("${pid} ${param}");

?>
