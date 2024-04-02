      <div id="header">
        <img src="images/logo.png" alt="logo">
        <ul>
            <li><a href="index.php">Pocetna</a></li>
            <li><a href="#">work</a></li>
            <li>
            <div class="dropdown">
              <button class="dropbtn">Dropdown</button>
              <div class="dropdown-content">
                <!--<a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>-->
                <?php
                $upit="SELECT * FROM kategorije";
                $rez=$db->query($upit);
                while($red=$db->fetch_object($rez))
                  echo "<a href='index.php?kategorija={$red->id}'>{$red->naziv}</a>";
                ?>
              </div>
            </div>
          </li>
          <li><a href="#">news</a></li>
          <li><a href="kontakt.php">Kontakt</a></li>
          <?php
          if(login())
            echo "<li><a href='logout.php'>{$_SESSION['ime']} ({$_SESSION['status']})</a></li>";
          else
            echo "<li><a href='login.php'>Prijava</a></li>";
          ?>
          
        </ul>
</div>
<div id="pano">
        <img src="images/front.jpg" alt="front">
</div>  