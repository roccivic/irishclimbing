<?php

require_once 'common.php';
$db = dbLink();

if ($_SERVER['REQUEST_METHOD'] == 'GET') { // LIST SPONSORS
    $query = "SELECT `id`,`title`,`link`
              FROM `sponsors`
              ORDER BY `title`";
    $result = $db->query($query);
    $rows = array();
    $row = array();
    while($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
    echo json_encode($rows);
} else if ($_SERVER['REQUEST_METHOD'] == 'POST') { // INSERT SPONSOR
    $request = json_decode(file_get_contents("php://input"));
    // authentication
    authUser($request);
    // input validation
    if (empty($request->title)) {
        error(400, "Please enter the title for the link");
    } else if (strlen($request->title) > 255) {
        error(400, "Title for the link too long");
    }
    if (empty($request->link)) {
        error(400, "Please enter the URL for the link");
    } else if (strlen($request->link) > 255) {
        error(400, "URL for the link too long");
    }
    // database operation
    $query = "INSERT INTO sponsors (`title`,`link`)
              VALUES (?, ?)";
    if ($stmt = $db->prepare($query)) {
        $stmt->bind_param(
            'ss',
            $request->title,
            $request->link
        );
        if (! $stmt->execute()) {
            error(500);
        }
        $stmt->close();
    } else {
        error(500);
    }
    echo json_encode(true);
} else if ($_SERVER['REQUEST_METHOD'] == 'DELETE') { // DELETE SPONSOR
    $request = json_decode(file_get_contents("php://input"));
    if (empty($request)) {
        error(400, "Empty request payload");
    }
    // authentication
    authUser($request);
    // input validation
    if (empty($request->id)) {
        error(400, "Please enter the id of the sponsor to delete");
    }
    // database operation
    $query = "DELETE FROM sponsors WHERE id = ?";
    if ($stmt = $db->prepare($query)) {
        $stmt->bind_param('i', $request->id);
        if (! $stmt->execute()) {
            error(500);
        }
        $stmt->close();
    } else {
        error(500);
    }
    echo json_encode(true);
} else {
    // INVALID REQUEST METHOD
    error(405);
}

?>