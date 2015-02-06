<?php

require_once 'common.php';
$db = dbLink();

if ($_SERVER['REQUEST_METHOD'] == 'GET') { // EXPORT
    // authentication
    authUser();
    // database operation
    $query = "SELECT `id`,`college`,`name`,`email`,`category`,`grade`,`confirmation`,`timestamp`
              FROM `competitors`
              ORDER BY `timestamp` DESC;";
    $result = $db->query($query);
    $rows = array();
    $row = array();

    $headers = array(
        'id',
        'college',
        'name',
        'email',
        'category',
        'grade',
        'confirmation',
        'timestamp'
    );
    $fd = fopen('php://temp/maxmemory:1048576', 'w');
    if($fd === FALSE) {
        die('Failed to open temporary file');
    }
    fputcsv($fd, $headers);
    while($row = $result->fetch_assoc()) {
        fputcsv($fd, $row);
    }
    rewind($fd);
    header('Content-type: text/csv');
    header('Content-Disposition: attachment; filename="export.csv"');
    echo stream_get_contents($fd);
    fclose($fd);
} else {
    error(405);
}

?>