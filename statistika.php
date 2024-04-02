<?php
session_start();
require_once("_require.php");
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
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <?php include_once("_menu.php");?>
    <div class="content">
        <div id="main">

        <h2>Statistika</h2>
        <form action="statistika.php" method="post">
            <select name="datoteka" id="datoteka">
                <option value="0">--Izaberite log datoteku--</option>
                <option value="logovanja.log">Logovanja</option>
                <option value="korisnici.log">Korisnici</option>
                <option value="proizvodi.log">Proizvodi</option>
            </select><br><br>
            <button name="btnSnimi">Prikazi log</button>
        </form>
        <hr>
        <?php
        if(isset($_POST['datoteka']) and $_POST['datoteka']!='0')
        {
            $datoteka=$_POST['datoteka'];
            if(file_exists("logs/$datoteka"))
            {
                $poruka=file_get_contents("logs/$datoteka");
                $poruka=nl2br($poruka);
            }
            else
                $poruka= "Nema ni jedna aktivnost!!!";
        }
              
              
        ?>
        <div><?= $poruka?></div>   

        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>