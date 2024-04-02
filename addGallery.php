<?php
session_start();
require_once("_require.php");
if(!Login()){
    echo "Morate biti prijavljeni!!!!";
    exit();
}
$db=new Baza();
if(!$db->connect())exit();
$poruka="";
if($_SESSION['status']!="Administrator")
{
    echo Poruka::info("Samo Administrator moze videti ovu stranicu!!!!");
    echo "<a href='index.php'>Pocetna</a>";
    exit();
}
?>
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lineweb</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <?php include_once("_menu.php");?>
    <div class="content">
        <div id="main">

        <h2>Dodavanje galerije</h2>
        <input type="text" id="ime" placeholder="Unesite ime galerije"><br><br>
        <input type="text" id="komentar" placeholder="Unesite komentar"><br><br>
        <button id="btnSnimi">Snimi galeriju</button>
        <div></div>
        <hr>
        <select name="selGalerija" id="selGalerija">
        </select>
        
        <div id="odgovor"></div>   

        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>
<script>
$(function(){
    //alert("Galerije");
    popuniGalerije();
    $("#btnSnimi").click(function(){
        $.post("ajax/ajax_addGallery.php?opcija=snimiGaleriju", {ime:$("#ime").val(), komentar:$("#komentar").val()}, function(response){
            $("#odgovor").html(response);
        })
    })
    
})
function popuniGalerije(){
    $.get("ajax/ajax_addGallery.php?opcija=popuniGalerije", function(response){
        //alert(response);
        let opcije=JSON.parse(response);
        $("#selGalerija").append("<option value='0'>--Izaberite galeriju--</option>")
        for(i=0;i<opcije.length; i++)
            $("#selGalerija").append("<option value='"+opcije[i].id+"'>"+opcije[i].ime+"</option>")
    })
}
</script>