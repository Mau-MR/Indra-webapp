let close = document.querySelectorAll(".close-p")[0],
    open = document.querySelectorAll(".cta")[0],
    modal = document.querySelectorAll(".modal-p")[0],
    modalC = document.querySelectorAll(".modal-container-p")[0];

open.addEventListener("click", function(e) {
    e.preventDefault(); // Remove the # 
    modalC.style.opacity = "1";
    modalC.style.visibility = "visible";
    modal.classList.toggle("modal-close-p");
});

close.addEventListener("click", function() {
    modal.classList.toggle("modal-close-p");
    
    setTimeout(function(){
        modalC.style.opacity = "0";
        modalC.style.visibility = "hidden"; 
    },500);
});

/*
window.addEventListener("click", function(e){
    console.log(e.target);
    if(e.target == modalC){
        modal.classList.toggle("modal-close-p");
    
        setTimeout(function(){
            modalC.style.opacity = "0";
            modalC.style.visibility = "hidden"; 
        },500);
    };
});
*/