<?php

require_once 'common.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $request = json_decode(file_get_contents("php://input"));
    if(empty($request->password)) {
        error(401, "Authentication error: No password");
    }
    if (password_verify($request->password, CFG_ADMIN_HASH)) {
        $_SESSION['loggedIn'] = true;
    } else {
        error(401, "Authentication error");
    }
} else {
    error(405);
}

?>