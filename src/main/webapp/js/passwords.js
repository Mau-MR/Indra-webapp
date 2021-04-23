const togglePassword = document.querySelectorAll('#togglePassword')[0];
const togglePassword2= document.querySelectorAll('#togglePassword')[1];
const togglePassword3 = document.querySelectorAll('#togglePassword')[2];

const password = document.getElementById('password');
const password2 = document.getElementById("password1");
const password3 = document.getElementById('password2');


togglePassword.addEventListener('click', function () {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');

});

togglePassword2.addEventListener('click', function () {
    // toggle the type attribute
    const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
    password2.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');

});

togglePassword3.addEventListener('click', function () {
    // toggle the type attribute
    const type = password3.getAttribute('type') === 'password' ? 'text' : 'password';
    password3.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');

});


function validarPASSWORD(input) {
    var second = input,
        resultado = document.getElementById("resultadoPASSWORD"),
        first = document.getElementById("password1"),
        valido = "No Son Iguales";

    if (first.value == second.value) {
        valido = "Son Iguales";
        resultado.classList.add("ok");
        document.getElementById("login").disabled = false;
    } else {
        resultado.classList.remove("ok");
        document.getElementById("login").disabled = true;
    }

    resultado.innerText = "Contraseñas " + valido;
}

function validar_clave(input)
{
    var resultado = document.getElementById("resultadoCORRECTA");
    var valida = "Suficientemente Fuerte";

    var mayuscula = false;
    var minuscula = false;
    var numero = false;
    var caracter_raro = false;

    if(mayuscula == false || minuscula == false || caracter_raro == false || numero == false)
    {
        resultado.classList.remove("ok");
        document.getElementById("login").disabled = true;
        resultado.innerText = "Contraseña " + valida;
    }

    if(input.value.length >= 8)
    {
        for(var i = 0;i<input.value.length;i++)
        {
            if(input.value.charCodeAt(i) >= 65 && input.value.charCodeAt(i) <= 90)
            {
                mayuscula = true;
            }
            else if(input.value.charCodeAt(i) >= 97 && input.value.charCodeAt(i) <= 122)
            {
                minuscula = true;
            }
            else if(input.value.charCodeAt(i) >= 48 && input.value.charCodeAt(i) <= 57)
            {
                numero = true;
            }
            else
            {
                caracter_raro = true;
            }
        }
        if(mayuscula == true && minuscula == true && caracter_raro == true && numero == true)
        {
            resultado.classList.add("ok");
            document.getElementById("login").disabled = false;
            valida = "Válida"
            resultado.innerText = "Contraseña " + valida;
        }
    }


}