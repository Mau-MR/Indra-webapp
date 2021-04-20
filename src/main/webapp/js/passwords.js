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
    var second = input.value,
        resultado = document.getElementById("resultadoPASSWORD"),
        first = document.getElementById("password1"),
        valido = "No Válida";
    
    if (first.value == second.value) { 
    	valido = "Válida";
        resultado.classList.add("ok");
        document.getElementById("login").disabled = false;
    } else {
    	resultado.classList.remove("ok");
        document.getElementById("login").disabled = true;
    }
    
    resultado.innerText = "Contraseña " + valido + first.value + second.value;
    // resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
}

function validar_clave(password2)
{
    if(password2.length >= 8)
    {		
        var mayuscula = false;
        var minuscula = false;
        var numero = false;
        var caracter_raro = false;
        var inner = document.getElementById("message");
        
        for(var i = 0;i<password2.length;i++)
        {
            if(password2.charCodeAt(i) >= 65 && password2.charCodeAt(i) <= 90)
            {
                mayuscula = true;
            }
            else if(password2.charCodeAt(i) >= 97 && password2.charCodeAt(i) <= 122)
            {
                minuscula = true;
            }
            else if(password2.charCodeAt(i) >= 48 && password2.charCodeAt(i) <= 57)
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
            inner.innerText = "Contraseña Válida";
            return true;
        }
    }
    inner.innerText = "Introduzca Mayusculas, números y caracteres especiales";
    return false;
}


