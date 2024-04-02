<?php
session_start();
require_once("_require.php");
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
        <h1>Prijava</h1>
        <form action="login.php" method="post" onsubmit="return proveriFormu()">
            <input type="text" name="email" id="email" placeholder="Unesite email"><br><br>
            <input type="password" name="lozinka" id="lozinka" placeholder="Unesite lozinku" ><br><br>
            <input type="checkbox" name="zapamti" > Zapamti me na ovom racunaru <br>   <br>
            <button>Prijavite se</button>
        </form>
        <?php
            if(isset($_POST['email']) and isset($_POST['lozinka']))
            {
                $email=$_POST['email'];
                $lozinka=$_POST['lozinka'];
                if($email!="" and $lozinka!="")
                {
                    if(validanString($email) and validanString($lozinka))
                    {
                        $upit="SELECT * FROM korisnici WHERE email='{$email}'";
                        $rez=$db->query($upit);
                        if($db->num_rows($rez)==1)
                        {
                            $red=$db->fetch_object($rez);
                            if($red->aktivan==1)
                            {
                                if($red->lozinka==$lozinka)
                                {
                                    //$poruka=Poruka::uspeh("{$red->ime} {$red->prezime}, $red->status");
                                    $_SESSION['id']=$red->id;
                                    $_SESSION['ime']=$red->ime. " ". $red->prezime;
                                    $_SESSION['status']=$red->status;
                                    $_SESSION['email']=$red->email;
                                    Statistika::upisiLog("logs/logovanja.log", "{$_SESSION['ime']} uspesna prijava.");
                                    if(isset($_POST['zapamti']))
                                    {
                                        setcookie("id", $_SESSION['id'], time()+86400,"/");
                                        setcookie("ime", $_SESSION['ime'], time()+86400,"/");
                                        setcookie("status", $_SESSION['status'], time()+86400,"/");
                                    }
                                    header("location:index.php");
                                }
                                else
                                {
                                     $poruka=Poruka::greska("Pogresna lozinka za korisnika '{$email}'!!!");
                                     Statistika::upisiLog("logs/logovanja.log", "{$email} pogresna lozinka $lozinka.");
                                } 
                            }
                            else
                            {
                                $poruka=Poruka::info("Korisnik '{$email}' postoji, ali nije aktivan!!!");
                                Statistika::upisiLog("logs/logovanja.log", "{$email} neaktivan korisnik.");
                            }
                       }
                        else 
                        {
                            $poruka=Poruka::greska("Korisnik '{$email}' ne postoji!!!");
                            Statistika::upisiLog("logs/logovanja.log", "{$email} korisnik ne postoji.");
                        } 
                    }
                    else
                    {
                        $poruka=Poruka::greska("Email ili lozinka sadrze nedozvoljene karaktere!!!!");
                        Statistika::upisiLog("logs/logovanja.log", "Nedozvoljeni karakteri '$email', '$lozinka' sa IP adrese {$_SERVER['REMOTE_ADDR']}.");
                    }
                        
                }
                else
                    $poruka=Poruka::greska("Svi podaci su obavezni!!!");
            }
            else
                $poruka=Poruka::info("Dobro dosli na stranicu za logovanje!!!");
             
        ?>
                
          <p id="odgovor"><?= $poruka?></p>
          </div>

        <?php //include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>
<script src="js/login.js"></script>