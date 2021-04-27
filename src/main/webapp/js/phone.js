
let boolPassword = false;
// Passwords are shown with the eyes
for (var i = 0; i < document.querySelectorAll('#password').length; i++) {

    const password = document.querySelectorAll('#password')[i];

    document.querySelectorAll('#togglePassword')[i].addEventListener('click', function () {
        // toggle the type attribute
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        // toggle the eye slash icon
        this.classList.toggle('fa-eye-slash');
    });
}

// The password strength is validated
document.querySelectorAll('#password')[1].addEventListener('input', function() {
    var password = document.querySelectorAll('#password')[1],
        result = document.getElementById("resultadoCORRECTA"),
        complement = "Débil",
        uppercase = false,
        lowercase = false,
        number = false,
        rareCharacter = false;
    // The chain is checked
    if (password.value.length >= 8) {
        for (var i = 0; i < password.value.length; i++) {
            if (password.value.charCodeAt(i) >= 65 && password.value.charCodeAt(i) <= 90) {
                uppercase = true;
            }
            else if (password.value.charCodeAt(i) >= 97 && password.value.charCodeAt(i) <= 122) {
                lowercase = true;
            }
            else if (password.value.charCodeAt(i) >= 48 && password.value.charCodeAt(i) <= 57) {
                number = true;
            }
            else {
                rareCharacter = true;
            }
        }
    }

    if(password.value != "") {
        if (uppercase == true && lowercase == true && rareCharacter == true && number == true) {
            result.classList.add("ok");
            complement = "Válida";
            result.innerText = "Contraseña " + complement;
            boolPassword = true;
        }
        else {
            result.classList.remove("ok");
            result.innerText =  "Contraseña " + complement;
            boolPassword = false;
        }
    }
    else {
        result.innerText =  "";
        boolPassword = false;
    }
});

// Passwords similarity is valid
document.querySelectorAll('#password')[2].addEventListener('input', function() {
    var first = document.querySelectorAll('#password')[1],
        second = document.querySelectorAll('#password')[2],
        result = document.getElementById("resultadoPASSWORD"),
        complement = "Diferentes";

    if (first.value == second.value) {
        complement = "Son Iguales";
        result.classList.add("ok");
    } else {
        result.classList.remove("ok");
    }

    if(first.value != "" && second.value != "") {
        result.innerText = "Contraseñas " + complement;
        boolPassword = true;
    }
    else {
        result.innerText = "";
        boolPassword = false;
    }

});