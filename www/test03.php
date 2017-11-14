<?php
$pid = getmypid();
$count = $_GET['c'];
$url = $_GET['u'];

error_log("${pid} START ${param}");

sleep(5);

$count++;

if ($count > 10)
{
  error_log("${pid} FINISH ${param}");
}

// file_get_contents($url . '?c=' . $count . '&u=' . $url);

$mh = curl_multi_init();

$ch = curl_init($url . '?c=' . $count . '&u=' . $url);
curl_multi_add_handle($mh, $ch);

do
{
  $stat = curl_multi_exec($mh, $running);
} while ($stat === CURLM_CALL_MULTI_PERFORM);

do switch (curl_multi_select($mh, 2))
{
  case -1:
    usleep(10);
    do
    {
      $stat = curl_multi_exec($mh, $running);
    } while ($stat === CURLM_CALL_MULTI_PERFORM);
    continue 2;
  case 0:
    continue 2;
  default:
    do
    {
      $stat = curl_multi_exec($mh, $running);
    } while ($stat === CURLM_CALL_MULTI_PERFORM);
} while (1 === 0);

curl_multi_close($mh);

error_log("${pid} FINISH ${param}");

?>
