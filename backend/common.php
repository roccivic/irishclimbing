<?php

usleep(500000);

define("DUMP_SOURCE", "0.2");

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

function error($code) {
    $errors = array(
        400 => 'Bad Request',
        404 => 'Not Found',
        500 => 'Internal Server Error'
    );
    if (empty($errors[$code])) {
        $code = 500;
    }
    $error = $errors[$code];
    $errorString = $code . ' ' . $error;
    header('HTTP/1.0 ' . $errorString);
    die(json_encode($errorString));
}

?>