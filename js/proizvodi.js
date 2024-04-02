let ime=document.querySelector("#ime");
let komentar=document.querySelector("#komentar");
let odgovor=document.querySelector("#odgovor");
function prikaziFormu(){
    let c=document.querySelector("#potvrda");
    let forma=document.querySelector("#forma");
    if(c.checked) {
        forma.style.display="";
        ime.value="";
        komentar.value="";
        odgovor.innerHTML="";
    }
    else forma.style.display="none";
}

function proveriFormu(){
    
    if(ime.value==""){
        odgovor.innerHTML="Niste uneli ime";
        ime.focus();
        return false;
    }
    if(komentar.value==""){
        odgovor.innerHTML="Niste uneli komentar";
        komentar.focus();
        return false;
    }
    odgovor.innerHTML="";
    return true;
}