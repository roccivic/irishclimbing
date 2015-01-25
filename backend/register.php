<?php

    require_once 'common.php';

    $postdata = file_get_contents("php://input");
    $request = json_decode($postdata);
    $db = dbLink();

    if (empty($request->college)) {
        error(400);
    } else if (empty($request->name)) {
        error(400);
    } else if (empty($request->email)) {
        error(400);
    } else if (empty($request->category)) {
        error(400);
    } else if (empty($request->grade)) {
        error(400);
    }

    $confirmation = substr(md5(mt_rand()), 0, 5);

    $query = "INSERT INTO `irishclimbing`.`competitors`
    (`college`,`name`,`email`,`category`,`grade`,`confirmation`)
    VALUES (?,?,?,?,?,?)";
    if ($stmt = $db->prepare($query)) {
        $stmt->bind_param(
            'ssssss',
            $request->college,
            $request->name,
            $request->email,
            $request->category,
            $request->grade,
            $confirmation
        );
        if (! $stmt->execute()) {
            error(500);
        }
        $stmt->close();
    } else {
        error(500);
    }

    echo json_encode($confirmation, JSON_PRETTY_PRINT);

?>