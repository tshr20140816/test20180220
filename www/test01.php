<?php

$res = file_get_contents('http://ipaddress.is/8.8.8.8');

$pos = strpos($res, '<b>IP Whois Information');

error_log(substr($pos, $res));

?>
