var regex = "[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])",
    curp = document.getElementById("edad");

curp.addEventListener("input",function() {
    if (numPhone.value == "" || numPhone.value[0] != "+"){
        numPhone.value = "+";
        numPhone.innerText = "+"
        boolPhone = false;
    } else {
        numPhone.value = numPhone.value.replace(regex,"");
        boolPhone = true;
    }
});
