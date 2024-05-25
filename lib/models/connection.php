<!-- ?php
// $server = "localhost";
// $user = "id18841920_db_transport";
// $password = "RqhV|V6()ry~%C~l";
// $nama_database = "id18841920_transport_app";
// $db = mysqli_connect($server,$user,$password,$nama_database);

// if(!$db){
//     die("gagal Terhubung ". mysqli_connect_error());
// }

?> -->

<?php
$server = "localhost";
$user = "root";
$password = "";
$nama_database = "transport_app";
$db = mysqli_connect($server,$user,$password,$nama_database);

if(!$db){
    die("gagal Terhubung ". mysqli_connect_error());
}

?>
