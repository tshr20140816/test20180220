<?php
$pid = pcntl_fork();
if ($pid == -1) {
     die('fork できません');
} else if ($pid) {
     // 親プロセスの場合
    echo "parent process \n";
    pcntl_wait($status); // ゾンビプロセスから守る
} else {
    // 子プロセスの場合
    echo "child process \n";
}
?>
