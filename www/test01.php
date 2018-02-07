<?php

$res = file_get_contents('http://ipaddress.is/8.8.8.8');

$pos_start = strpos($res, '<b>IP Whois Information');

$pos_end = strpos(substr($res, $pos_start), '</tbody>');

error_log(substr($res, $pos_start, $pos_end - $pos_start));

?>
