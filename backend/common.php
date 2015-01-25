<?php

date_default_timezone_set("Europe/Dublin");

error_reporting(E_ALL);

header('Content-type: application/json');

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    die();
}

function dbLink() {
    $mysqli = new mysqli("localhost", "root", "123456", "irishclimbing");
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

function auth($password) {
    if (password_verify($password, "123456"))
    {
        return true;
    }
    error(401);
}

?>