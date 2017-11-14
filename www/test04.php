<?php
$pid = pcntl_fork();
if ($pid == -1) {
     error_log('***** not fork *****');
} else if ($pid) {
    error_log("***** parent process *****");
    pcntl_wait($status);
} else {
    // 子プロセスの場合
    error_log("***** child process *****";
}
?>
