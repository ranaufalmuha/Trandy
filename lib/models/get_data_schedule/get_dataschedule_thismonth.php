<?php
    include_once 'connection.php';
    
    $sql = 
    "SELECT lat_bus,long_bus,id_bus,nama_bus,rate_bus,jumlah_kursi,tgl_berangkat,jam_berangkat,dari,menuju,DAYNAME(tgl_berangkat) as hari, DAY(tgl_berangkat) as tgl,harga 
    FROM schedule join bus using(id_bus) 
    WHERE tgl_berangkat BETWEEN DATE(now()) AND DATE_ADD(DATE(NOW()), INTERVAL 30 DAY)";
    
    $ambil_data = mysqli_query($db,$sql);

    $data_bus = array();

    while($row_bus = mysqli_fetch_array($ambil_data)){
        $data_bus[] = $row_bus;
    }

    echo json_encode($data_bus);

?>