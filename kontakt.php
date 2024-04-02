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
</head>
<body>
<div id="wrapper">
    <?php include_once("_menu.php");?>
    <div class="content">
        <div id="main">
        <h1>Kontaktirajte nas</h1>
        <form action="kontakt.php" method="post">
        <?php
            if(!Login()) echo '<input type="text" name="email" placeholder="Unesite email" required><br><br>';
        ?>
            
            <textarea name="pitanje" id="pitanje" cols="30" rows="10" placeholder="Unesite pitanje" required></textarea><br><br>
            <button>Posaljite poruku</button>
        </form>
        <?php
        if(isset($_POST['pitanje']))
        {
            if(Login())$email=$_SESSION['email'];
            else $email=$_POST['email'];
            $pitanje=$_POST['pitanje'];
            if($email!="" and $pitanje!="")
            {
                if(Login())$upit="INSERT INTO kontakt (idKorisnika, email, pitanje) VALUES ({$_SESSION['id']},'{$email}', '{$pitanje}')";
                else $upit="INSERT INTO kontakt (email, pitanje) VALUES ('{$email}', '{$pitanje}')";
                $db->query($upit);
                if($db->error())
                    echo Poruka::greska("Greska prilikom snimanja pitanja<br>".$db->error());
                else
                    echo Poruka::uspeh("Uspesno poslato pitanje!!!");
            }
            else
                echo Poruka::greska("Svi podaci su obavezni!!!");
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