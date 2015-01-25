<?php

require_once 'common.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $postdata = file_get_contents("php://input");
    $request = json_decode($postdata);
    $db = dbLink();

    if (empty($request->college)) {
        error(400, "Please enter the name of your college");
    } else if (strlen($request->college) > 255) {
        error(400, "College name too long");
    }
    if (empty($request->name)) {
        error(400, "Please enter your full name");
    } else if (strlen($request->name) > 255) {
        error(400, "Competitor name too long");
    }
    if (empty($request->email)) {
        error(400, "Please enter your email address");
    } else if (strlen($request->email) > 255) {
        error(400, "Email address too long");
    } else if (strpos($request->email, '@') === false) {
        error(400, "Email address must contain the '@' character");
    }
    if (empty($request->category)) {
        error(400, "Please select a category");
    } else if (strlen($request->category) > 255) {
        error(400, "Category too long");
    }
    if (empty($request->grade)) {
        error(400, "Please select a grade");
    } else if (strlen($request->grade) > 255) {
        error(400, "Grade too long");
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
} else {
    error(405);
}

?>