<?php

$url = $_GET['u'];

$urls = array();

for($i = 0; $i < 10; $i++)
{
  $urls[] = "${url}?p=" . rand();
}

$mh = curl_multi_init();



?>
