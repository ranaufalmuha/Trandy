<?php
    include_once 'connection.php';
    
    $sql = "SELECT *,DAY(tgl_berangkat) FROM schedule";
    $ambil_data = mysqli_query($db,$sql);

    $data_barang = array();

    while($row_barang = mysqli_fetch_array($ambil_data)){
        $data_barang[] = $row_barang;
    }

    echo json_encode($data_barang);

?>