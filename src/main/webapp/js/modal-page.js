function modalDisplay(id, score_inteligencia, score_trabajo) {
    // Mostramos el modal
    modal = document.getElementById("modal-p_" + id)
    modalC = document.getElementById("modal-container-p_" + id);
    modalC.style.opacity = "1";
    modalC.style.visibility = "visible";
    modal.classList.toggle("modal-close-p");

    // Creamos las gráficas
    if (score_inteligencia > 0 && score_trabajo > 0) {
        createCharts(score_inteligencia, score_trabajo, id);

    }
};

function closeModal() {
    // Desaparecemos el modal
    modal.classList.toggle("modal-close-p");

    setTimeout(function(){
        modalC.style.opacity = "0";
        modalC.style.visibility = "hidden";
    },500);
};
