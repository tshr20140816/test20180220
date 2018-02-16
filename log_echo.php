<?php

$type = $argv[1]; // 'A' or 'E'
$prefix = $argv[2];
$stdin = fopen('php://stdin', 'r');
ob_implicit_flush(true);

while ($line = fgets($stdin)) {
  echo $line;
}
?>
