<?php

require_once 'common.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // authentication
    authUser();
} else {
    error(405);
}

?>