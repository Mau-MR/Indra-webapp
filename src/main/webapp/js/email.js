document.getElementById('email').addEventListener('input', function() {
    campo = event.target;
    var resultado = document.getElementById("resultadoEMAIL"),
    valido = "No Válido";
        
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    //Se muestra un texto a modo de ejemplo, luego va a ser un icono
    if (emailRegex.test(campo.value)) {
        valido = "Válido";
        resultado.classList.add("ok");
        document.getElementById("login").disabled = false;
    } else {
        resultado.classList.remove("ok");
        document.getElementById("login").disabled = true;
    }
    resultado.innerText = "Email " + valido;
});