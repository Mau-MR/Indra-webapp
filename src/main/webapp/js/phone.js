var regex = /[^+\d]/g;
var numTel = document.getElementById("phone");

numTel.addEventListener("keyup", function(){
    if (numTel.value == ""){
       numTel.value = "+";
    }
    numTel.value = numTel.value.replace(regex,"");
})