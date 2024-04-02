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
if(isset($_POST['btnSnimi']))
{
    $idProizvoda=$_POST['idProizvoda'];
    if($idProizvoda!='0')
    {
        $upit="UPDATE proizvodi SET obrisan = 1 WHERE id = $idProizvoda";
        $db->query($upit);
        if($db->error())
        {
            $poruka=Poruka::greska("Greska prilikom izvrsavanja upita<br>".$db->error());
            Statistika::upisiLog("logs/proizvodi.log", "{$_SESSION['ime']}, Uspesno obrisan proizvod $idProizvoda.");
        }
            
        else
        {
            $poruka=Poruka::uspeh("Uspesno obrisan proizvod");
            Statistika::upisiLog("logs/proizvodi.log", "{$_SESSION['ime']}, Uspesno obrisan proizvod $idProizvoda.");
            //if(file_exists("slike/".$idProizvoda.".jpg")) unlink("avatar/".$idProizvoda.".jpg");
        }
            
    }
    else
        $poruka=Poruka::greska("Niste izabrali proizvod za brisanje!!!");
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

        <h2>Brisanje proizvoda</h2>
        <form action="deleteproduct.php" method="post">
            <select name="idProizvoda" id="idProizvoda">
                <option value="0">--Izaberite proizvod za brisanje--</option>
                <?php
                $upit="SELECT * FROM proizvodi WHERE obrisan=0 AND autor={$_SESSION['id']} ORDER BY id desc";
                $rez=$db->query($upit);
                while($red=$db->fetch_object($rez))
                    echo "<option value='{$red->id}'>{$red->id}: {$red->naslov}</option>";
                ?>
            </select><br><br>
            <button name="btnSnimi">Obrisite proizvod</button>
        </form>
        <hr>
        <?php
        
              
              
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