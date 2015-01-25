<?php

    require_once 'common.php';
    $db = dbLink();

    $query = "SELECT `title`,`link`
              FROM `sponsors`
              ORDER BY `title`";
    $result = $db->query($query);
    $rows = array();
    $row = array();
    while($row = $result->fetch_assoc()) {
        $row['title'] = $row['title'];
        $row['link'] = $row['link'];
        $rows[] = $row;
    }
    echo json_encode($rows, JSON_PRETTY_PRINT);

?>