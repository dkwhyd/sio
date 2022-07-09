<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


if (isset($_POST['submit'])) {
    $password = $_POST['password'];
    echo "password is : $password <br>";
    $options = [
        'cost' => 10
    ];
    $hash = password_hash($password, PASSWORD_BCRYPT, $options);
    echo "$hash<br>";
    echo "memverifikasi password.... <br>";

    if (password_verify($password, $hash)) {
        echo 'password is valid';
    } else {
        echo "password invalid";
    }
    echo "<br>";
    echo "length hash is : " . strlen($hash);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hashing</title>
</head>

<body>

    <form action="hash.php" method="post">
        <input type="text" name="password">
        <input type="submit" name="submit" value="hashing">
    </form>
    <div>password been hash : <?php echo $hash ?></div>
</body>

</html>