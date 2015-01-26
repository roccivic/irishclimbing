<?php

require_once 'config.php';

date_default_timezone_set("Europe/Dublin");

error_reporting(CFG_ERROR_LEVEL);

// CORS headers
if (CFG_CORS) {
    $http_origin = empty($_SERVER['HTTP_ORIGIN']) ? '' : $_SERVER['HTTP_ORIGIN'];
    if (
        $http_origin == "http://www.irishclimbingintervarsities.net"
        ||
        $http_origin == "http://irishclimbingintervarsities.net"
    ) {
        header("Access-Control-Allow-Origin: $http_origin");
    } else {
        header("Access-Control-Allow-Origin: http://localhost:9000");
    }
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
}

// JSON header
header('Content-type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    die();
}

function dbLink() {
    $mysqli = new mysqli(CFG_DB_HOST, CFG_DB_USER, CFG_DB_PASS, CFG_DB_DBNAME);
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }
    return $mysqli;
}

function error($code, $message= '') {
    $errors = array(
        400 => 'Bad Request',
        401 => 'Not Authorized',
        404 => 'Not Found',
        405 => 'Request Method Not Supported',
        500 => 'Internal Server Error'
    );
    if (empty($errors[$code])) {
        $code = 500;
    }
    $error = $errors[$code];
    $errorString = $code . ' ' . $error;
    header('HTTP/1.0 ' . $errorString);
    die(
        json_encode(
            array(
                'error_string' => $errorString,
                'message' => $message
            )
        )
    );
}

function authUser($request) {
    if(empty($request->password)) {
        error(401, "Authentication Error");
    }
    if (password_verify($request->password, CFG_ADMIN_HASH)) {
        return true;
    }
    error(401, "Authentication Error");
}

?>