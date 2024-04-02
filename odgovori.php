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
if(isset($_POST['idPitanja']) and isset($_POST['odgovor']))
{
    $idPitanja=$_POST['idPitanja'];
    $odgovor=$_POST['odgovor'];
    if($idPitanja!="0" and $odgovor!="")
    {
        $upit="UPDATE kontakt SET odgovor='{$odgovor}' WHERE id={$idPitanja}";
        $db->query($upit);
        if($db->error())
        {
            $poruka=Poruka::greska("Neuspelo izvrsavanje upita<br>".$db->error());
        }
        else
        {
            $upit="SELECT * FROM kontakt WHERE id={$idPitanja}";
            $rez=$db->query($upit);
            $red=$db->fetch_object($rez);
            // The message
            $message = "Odgovor na Vase pitanje '{$red->pitanje}' je: {$odgovor}";

            // In case any of our lines are larger than 70 characters, we should use wordwrap()
            $message = wordwrap($message, 70, "\r\n");

            // Send
            if(@mail("{$red->email}", 'Odgovor na pitanje', $message))
            {
                $poruka=Poruka::uspeh("uspesno slanje odgovora korisniku<br>".$message);
            }
            else
                $poruka=Poruka::greska("Neuspelo slanje mejla!!!<br>".$message);
        }
    }
    else
        $poruka=Poruka::greska("Svi podaci su obavezni!!!");
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

        <h2>Odgovorite na pitanja</h2>
        <form action="odgovori.php" method="post">
            <select name="idPitanja" id="idPitanja">
                <option value="0">--Izaberite pitanje--</option>
                <?php
                $upit="SELECT * FROM kontakt where isnull (odgovor)";
                $rez=$db->query($upit);
                while($red=$db->fetch_object($rez))
                    echo "<option value='{$red->id}'>{$red->pitanje}</option>";
                ?>
            </select><br><br>
            <textarea name="odgovor" id="odgovor" cols="30" rows="10" required placeholder="Unesite odgovor"></textarea><br><br>
            <button>Odgovorite na pitanje</button>
        </form>
        <hr>
        
        <div><?= $poruka?></div>   

        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>