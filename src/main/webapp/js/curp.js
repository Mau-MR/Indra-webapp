// Function to validate a CURP

let boolCURP = false;

function curpValid(curp) {
    var regex = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
        valid = curp.match(regex);

    if (!valid)  // Does it match the general format?
        return false;

    // Validate that the check digit matches
    function checkDigit(curp17) {
        // Reference https://consultas.curp.gob.mx/CurpSP/
        var dictionary  = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
            lngSum      = 0.0,
            lngDigit    = 0.0;
        for(var i=0; i<17; i++)
            lngSum += dictionary.indexOf(curp17.charAt(i)) * (18 - i);
        lngDigit = 10 - lngSum % 10;
        if (lngDigit == 10) return 0;
        return lngDigit;
    }

    if (valid[2] != checkDigit(valid[1]))
        return false;
    return true; // Valid
}


// For the event when the input changes
// Capitalize the CURP to validate it
function validarCURP(input) {
    var curp = input.value.toUpperCase(),
        result = document.getElementById("resultadoCURP"),
        complement = "No Válida";

    if (curpValid(curp)) { //  Here it is verified
        complement = "Válida";
        result.classList.add("ok");

    } else {
        result.classList.remove("ok");

    }
    if(input.value != "") {
        result.innerText = "CURP " + complement; // the content is inserted in html
    } else {
        result.innerText = "";
    }


}