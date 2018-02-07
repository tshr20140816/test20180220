<?php

$res = file_get_contents('http://ipaddress.is/8.8.8.8');

$pos = strpos($res, '<b>IP Whois Information');

$res = substr($res, $pos);

$pos = strpos($res, '</tbody>');

$res = substr($res, 0, $pos);

$res = preg_replace('/<.+?>/', "\n", $res);

error_log($res);

?>
