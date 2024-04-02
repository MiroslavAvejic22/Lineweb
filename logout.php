<?php
    session_start();
    require_once("_require.php");
    Statistika::upisiLog("logs/logovanja.log", "{$_SESSION['ime']} uspesna odjava");
    session_unset();
    session_destroy();
    setcookie("id", "", time()-1,"/");
    setcookie("ime", "", time()-1,"/");
    setcookie("status", "", time()-1,"/");
    header("location:index.php");
?>