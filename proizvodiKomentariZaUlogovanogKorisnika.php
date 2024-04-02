<?php
session_start();
require_once("_require.php");
$db=new Baza();
if(!$db->connect())exit();
?>
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lineweb</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet" />
    <script src="js/lightbox-plus-jquery.js"></script>
</head>
<body>
<div id="wrapper">
    <?php include_once("_menu.php");?>
    <div class="content">
        <div id="main">
        
        <?php
          
            if(isset($_GET['id']))
            {
                $id=$_GET['id'];
                if(filter_var($id, FILTER_VALIDATE_INT))
                {
                    $upit="SELECT * FROM vwproizvodi WHERE obrisan=0 AND id=".$_GET['id'];
                    $rez=$db->query($upit);
                    if($db->error())
                    {
                        echo "Greska prilikom izvrsavanja upita!!!!<br>";
                        echo $db->error()." (".$db->errno().")";
                        exit();
                    }
                    
                    while($red=$db->fetch_object($rez))
                    {
                        echo "<div style='border: 1px solid black; width:100%;margin:2px;padding:2px'>";
                        echo "<a href='index.php?kategorija=".$red->kategorija."'>".$red->naziv."</a><br>";
                        echo "<h3><a href='proizvodi.php?id=".$red->id."'>".$red->naslov."</a></h3>";
                        $slika="slike/noimage.jpg";
                        if(file_exists('slike/'.$red->id.".jpg"))$slika='slike/'.$red->id.".jpg";
                        echo "<center><img src='{$slika}' width='300px'>";
                        echo "<div style=''>";
                    $upit="SELECT * FROM proizvodislike WHERE idProizvoda={$red->id}";
                        $sveslike=$db->query($upit);
                        while($redslike=$db->fetch_object($sveslike))
                            //echo "<div style='display:inline-block;padding:5px'><img src='slike/{$redslike->imeSlike}' height='50px'></div>";
                            echo "<div style='display:inline-block;padding:5px'><a href='slike/{$redslike->imeSlike}' data-lightbox='proizvod' data-title='$red->naslov'><img src='slike/{$redslike->imeSlike}' height='50px'></a></div>";
                        echo "</div>";
                        echo "<p>".$red->tekst."<p>";
                        echo "<p><b><a href='index.php?autor=".$red->autor."'>".$red->ime ." ".$red->prezime."</a></b> <i>".$red->vreme."</i><br></p>";
                        echo "</div></center>";
                        $pogledan=$red->pogledan;
                    }
                    $upit="UPDATE proizvodi SET pogledan=pogledan+1 WHERE id=".$_GET['id'];
                    $db->query($upit);
                    if(login())
                    {
                        if($_SESSION['status']=='Administrator')
                        {
                            echo "Pogledan puta: ".$pogledan;
                        }
                    }
                    //unset($db);
                }
                else
                    echo "Neodgovarajuci id proizvoda!!!!";
            }
          ?>
          <br><br>
          <?php
          if(Login())
          {

         
          ?>
            <form action="proizvodi.php?id=<?= $id?>" method="post">
                <input type="text" name="ime" placeholder="Unesite ime" required><br><br>
                <textarea name="komentar" id="komentar" cols="30" rows="10" placeholder="Unesite komentar" required></textarea><br><br>
                <button>Snimite komentar</button>
            </form>
            <br><br>
            <?php
             }
            ?>
            <?php
            //Snimanje komentara
            if(isset($_GET['id']) and isset($_POST['ime']) and isset($_POST['komentar']))
            {
                $id=$_GET['id'];
                $ime=$_POST['ime'];
                $komentar=$_POST['komentar'];
                if($id!="" and $ime!="" and $komentar!="")
                {
                    $upit="INSERT INTO komentari (idProizvoda, ime, komentar) VALUES ({$id}, '{$ime}', '{$komentar}')";
                    $db->query($upit);
                    if($db->error())
                        echo Poruka::greska("Neuspelo snimanje u bazu!!!<br>".$db->error());
                    else
                        echo Poruka::uspeh("Uspesno snimljen komentar u bazu");
                } 
                else
                    echo Poruka::info("Svi podaci su obavezni!!!");
            }
            ?>
            <?php
            //Prikaz komentara
            $upit="SELECT * FROM komentari WHERE idProizvoda={$id} ORDER by vreme DESC";
            $rez=$db->query($upit);
            if($db->num_rows($rez)==0)
                echo Poruka::info("Nema ni jedan komentar!!!! Budite prvi!!!!");
            while($red=$db->fetch_object($rez))
            {
                echo "<div>";
                echo "<div><b>{$red->ime}</b> - <i>{$red->vreme}</i></div>";
                echo "<div>{$red->komentar}</div>";
                echo "<div>Likes: {$red->volim} | Dislikes: {$red->nevolim}</div>";
                echo "</div><br>";
            }
            ?>
            
        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>