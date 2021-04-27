$(document).ready(()=>{
    $("input[type=checkbox]").on("change", function(){
        let curp = $(this).attr("id")
        let minsait = $(".welcome").find("p").attr("id");
            if($(this).is(':checked')) {
            $.ajax({
                url: 'administrador',
                method: 'POST',
                data: {
                    curp: curp,
                    action: true,
                    minsait: minsait
                },
                success: function(data){
                    if (data != null) {
                        $("." + curp).html("Sí");
                        Swal.fire({
                            icon: "success",
                            title: "Se habilitó la cuenta con exito",
                            timer: "2000",
                            timerProgressBar: true,
                        })
                    }
                },
                error: function(xhr, textStatus){
                    if (textStatus != null) {
                        Swal.fire({
                            icon: "error",
                            title: "No se pudo habilitar la cuenta",
                            timer: "2000",
                            timerProgressBar: true
                        })
                    }
                }
            })
        }
        else {
            $.ajax({
                url: 'administrador',
                method: 'POST',
                data: {
                    curp: curp,
                    action: false,
                    minsait: minsait
                },
                success: function (data) {
                    if (data != null) {
                        $("." + curp).html("No");
                        Swal.fire({
                            icon: "success",
                            title: "Se deshabilitó la cuenta con exito",
                            timer: "2000",
                            timerProgressBar: true
                        })
                    }
                },
                error: function(xhr, textStatus) {
                    alert(textStatus)
                    if (textStatus != null) {
                        Swal.fire({
                            icon: "error",
                            title: "No se pudo habilitar la cuenta",
                            timer: "2000",
                            timerProgressBar: true
                        })
                    }
                }
            })
        }

    })
})
