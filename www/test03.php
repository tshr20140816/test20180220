<?php
$pid = getmypid();
$count = $_GET['c'];
$url = $_GET['u'];

error_log("${pid} START ${count}");

$count++;

$target_url = getenv('URL');

$res = file_get_contents($target_url . $count);
error_log("${pid} LENGTH " . strlen($res));

if ($count > 100)
{
  error_log("${pid} FINISH ${count}");
  return;
}

$mh = curl_multi_init();

$ch = curl_init($url . '?c=' . $count . '&u=' . $url);
curl_multi_add_handle($mh, $ch);

error_log("${pid} CHECK POINT 0100");

do
{
  $stat = curl_multi_exec($mh, $running);
} while ($stat === CURLM_CALL_MULTI_PERFORM);

error_log("${pid} CHECK POINT 0200");

do switch (curl_multi_select($mh, 10))
{
  case -1:
    //error_log(' ***** ERROR -1 *****');
    usleep(10);
    do
    {
      $stat = curl_multi_exec($mh, $running);
    } while ($stat === CURLM_CALL_MULTI_PERFORM);
    continue 2;
  case 0:
    error_log("${pid} ***** ERROR TIME OUT *****");
    continue 2;
  default:
    //error_log('CHECK POINT 0300');
    do
    {
      //error_log('CHECK POINT 0400');
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

curl_multi_close($mh);

error_log("${pid} FINISH ${count}");

?>
