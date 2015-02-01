<?php

require_once 'common.php';
$db = dbLink();

if ($_SERVER['REQUEST_METHOD'] == 'GET') { // LIST SPONSORS
    $query = "SELECT `id`,`title`,`link`
              FROM `sponsors`
              ORDER BY `title`;";
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
    authUser();
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
              VALUES (?, ?);";
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
}else if ($_SERVER['REQUEST_METHOD'] == 'PATCH') { // UPDATE SPONSOR
    $request = json_decode(file_get_contents("php://input"));
    // authentication
    authUser();
    $path = explode('/', $_SERVER['PATH_INFO']);
    $id  = $path[1];
    // input validation
    if (empty($id)) {
        error(400, "Invalid sponsor id");
    }
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
    $query = "UPDATE sponsors SET title=?, link=? WHERE id=?;";
    if ($stmt = $db->prepare($query)) {
        $stmt->bind_param(
            'ssi',
            $request->title,
            $request->link,
            $id
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
    if (empty($_SERVER['PATH_INFO'])) {
        error(400, "Empty request payload");
    }
    // authentication
    authUser();
    $path = explode('/', $_SERVER['PATH_INFO']);
    $id  = $path[1];
    // input validation
    if (empty($id)) {
        error(400, "Invalid sponsor id");
    }
    // database operation
    $query = "DELETE FROM sponsors WHERE id = ?;";
    if ($stmt = $db->prepare($query)) {
        $stmt->bind_param('i', $id);
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