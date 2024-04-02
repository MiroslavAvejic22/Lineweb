let o=document.querySelector("#odgovor");
function proveriFormu(){
    let email=document.querySelector("#email");
    let lozinka=document.querySelector("#lozinka");
    if(email.value==""){
        o.innerHTML="Niste uneli email!!!!";
        email.focus();
        return false;
    }
    if(lozinka.value==""){
        o.innerHTML="Niste uneli lozinku!!!!";
        lozinka.focus();
        return false;
    }
    return true;
}