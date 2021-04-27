
let boolEmail = false;

document.getElementById('email').addEventListener('input', function() {
    campo = event.target;
    var result = document.getElementById("resultadoEMAIL"),
        complement = "No Válido";

    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    // A text is shown as an example, then it will be an icon
    if (emailRegex.test(campo.value)) {
        complement = "Válido";
        result.classList.add("ok");
        boolEmail = true;
    } else {
        result.classList.remove("ok");
        boolEmail = false;
    }
    if(campo.value != "") {
        result.innerText = "Email " + complement;
    }
    else {
        result.innerText = "";
    }
});
