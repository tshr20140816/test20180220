<?php

$time = time();

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
  
  $ch = curl_init($url);
  $chs[] = $ch;
  curl_multi_add_handle($mh, $ch);
}

error_log('CHECK POINT 0100');

do
{
  $stat = curl_multi_exec($mh, $running);
} while ($stat === CURLM_CALL_MULTI_PERFORM);

if ( ! $running || $stat !== CURLM_OK)
{
  error_log(' ***** ERROR *****');
  return;
}

error_log('CHECK POINT 0200');

do switch (curl_multi_select($mh, 5))
{
  case -1:
    error_log(' ***** ERROR -1 *****');
    usleep(10);
    do
    {
      $stat = curl_multi_exec($mh, $running);
    } while ($stat === CURLM_CALL_MULTI_PERFORM);
    continue 2;
  case 0:
    error_log(' ***** ERROR TIME OUT *****');
    continue 2;
  default:
    error_log('CHECK POINT 0300');
    do
    {
      error_log('CHECK POINT 0400');
      $stat = curl_multi_exec($mh, $running);
    } while ($stat === CURLM_CALL_MULTI_PERFORM);
    
    do if ($raised = curl_multi_info_read($mh, $remains))
    {
      error_log('CHECK POINT 0500');
      $info = curl_getinfo($raised['handle']);
      $response = curl_multi_getcontent($raised['handle']);
      curl_multi_remove_handle($mh, $raised['handle']);
      curl_close($raised['handle']);
    } while ($remains);
} while ($running);

error_log('CHECK POINT 0600');

curl_multi_close($mh);

error_log('CHECK POINT 0700 ' . (time() - $time));
?>
