let galerija=document.querySelector("#galerija");
galerija.style.cssText="width:500px;height:300px;background-color:lightgray";

let glavna = document.createElement("img");
let tekucaSlika=0;
glavna.src=slike[0];
let timer=setInterval(promeniSliku, 2000);
glavna.height="200";
galerija.appendChild(glavna);
galerija.appendChild(document.createElement("br"));
for(i=0;i<slike.length;i++)
{
    slikica=document.createElement("img");
    slikica.src=slike[i];
    slikica.height="50";
    slikica.style.margin="5px";
    slikica.style.cursor="pointer";
    slikica.setAttribute("data-rbr", i);
    slikica.onmouseenter=function(){
        this.height=this.height+5;
    }
    slikica.onmouseleave=function(){
        this.height=this.height-5;
    }
    slikica.onclick=function(){
        clearInterval(timer);
        glavna.src=this.src;
        tekucaSlika=this.getAttribute("data-rbr");
        timer=setInterval(promeniSliku, 2000);
    }
    galerija.appendChild(slikica);
    
}
let stop=document.createElement("button");
    stop.innerHTML="Zaustavi timer";
    stop.onclick=function(){
        clearInterval(timer);
    }
    galerija.appendChild(stop);
    let start=document.createElement("button");
    start.innerHTML="Pokreni timer";
    start.onclick=function(){
        clearInterval(timer);
        timer=setInterval(promeniSliku, 2000);
    }
    galerija.appendChild(start);
function promeniSliku(){
    tekucaSlika++;
    if(tekucaSlika==slike.length)tekucaSlika=0;
    glavna.src=slike[tekucaSlika];
}