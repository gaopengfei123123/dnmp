<?php
echo 'say hello in index.php --from docker';

file_put_contents('index.log', '测试2333, time:' . date('y-m-d H:i:s'));