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

        <h2>Pitanja</h2>
        <?php
        $upit="SELECT * FROM kontakt WHERE idKorisnika={$_SESSION['id']}";
        $rez=$db->query($upit);
        if($db->num_rows($rez)>0)
        {
            while($red=$db->fetch_object($rez))
            {
                echo "<div>";
                echo "<p>Pitanje</p>";
                echo "<i>{$red->vremePitanja}</i>";
                echo "<div><b>{$red->pitanje}</b></div>";
                if($red->odgovor=="") echo "<div>Nije odgovoreno</div>";
                else{
                    echo "<p>Odgovor</p>";
                    echo "<i>{$red->vremeOdgovora}</i>";
                    echo "<div><b>{$red->odgovor}</b></div>";
                }
                echo "</div><hr>";
            }
        }
        else
            $poruka=Poruka::info("Niste postavili ni jedno pitanje!!!!");
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