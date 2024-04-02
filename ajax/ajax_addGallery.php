<?php
    require_once("../klase/classBaza.php");
    $db=new Baza();
    $db->connect();
    $opcija=$_GET['opcija'];
    if($opcija=='snimiGaleriju'){
        $ime=$_POST['ime'];
        $komentar=$_POST['komentar'];
        $sql="INSERT INTO galerije (ime, komentar) VALUES ('{$ime}', '{$komentar}')";
        $db->query($sql);
        if($db->error())echo $db->error();
        else echo "Snimljeni podaci";
    }

    if($opcija=='popuniGalerije'){
        
        $sql="SELECT * FROM galerije";
        $rez=$db->query($sql);
        $odg=$db->fetch_all($rez);
        echo JSON_encode($odg, 256);
    }
?>