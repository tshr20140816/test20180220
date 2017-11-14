<?php

$url = $_GET['u'];

$urls = array();

for($i = 0; $i < 10; $i++)
{
  $urls[] = "${url}?p=" . rand();
}

$mh = curl_multi_init();

foreach($urls as $url)
{
  error_log($url);
  
  $conn = curl_init($url);
  curl_multi_add_handle($mh, $conn);
}

$active = null;
  
do
{
  $mrc = curl_multi_exec($mh, $active);
} while ($mrc == CURLM_CALL_MULTI_PERFORM);

while ($active and $mrc == CURLM_OK)
{
  if (curl_multi_select($mh) != -1)
  {
    do
    {
      $mrc = curl_multi_exec($mh, $active);
    } while ($mrc == CURLM_CALL_MULTI_PERFORM);
  }
}

if ($mrc != CURLM_OK)
{
  error_log(' ***** ERROR *****');
}

curl_multi_close($mh);

?>
