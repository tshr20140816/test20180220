<?php

$url = $_GET['u'];

$urls = array();

for($i = 0; $i < 10; $i++)
{
  $urls[] = "${url}?p=" . rand();
}

$mh = curl_multi_init();

$conns = array();

foreach($urls as $url)
{
  error_log($url);
  
  $conn = curl_init($url);
  $conns[] = $conn;
  curl_multi_add_handle($mh, $conn);
}

error_log('CHECK POINT 0100');

$active = null;

do
{
  $mrc = curl_multi_exec($mh, $active);
} while ($mrc == CURLM_CALL_MULTI_PERFORM);

error_log('CHECK POINT 0200');

while ($active and $mrc == CURLM_OK)
{
  error_log('CHECK POINT 0210');
  if (curl_multi_select($mh) != -1)
  {
    error_log('CHECK POINT 0220');
    do
    {
      error_log('CHECK POINT 0230');
      $mrc = curl_multi_exec($mh, $active);
    } while ($mrc == CURLM_CALL_MULTI_PERFORM);
  }
}

error_log('CHECK POINT 0300');

if ($mrc != CURLM_OK)
{
  error_log(' ***** ERROR *****');
}

error_log('CHECK POINT 0400');

foreach($conns as $conn)
{
  curl_multi_getcontent($conn);
  curl_multi_remove_handle($mh, $conn);
  curl_close($conn);
}

error_log('CHECK POINT 0500');

curl_multi_close($mh);

error_log('CHECK POINT 0600');
?>
