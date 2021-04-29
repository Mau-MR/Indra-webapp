function createCharts(score_inteligencia, score_trabajo, id) {
    // ----- Inteligencia Emocional -----
    const data_inteligencia = {
        labels: [
            'Score Obtenido',
            'Score Faltante'
        ],
        datasets: [{
            label: 'Dataset - Inteligencia',
            data: [score_inteligencia, 42 - score_inteligencia],
            backgroundColor: [
                'rgb(0, 173, 181)',
                'rgb(170, 216, 211)'
            ],
            hoverOffset: 4

        }]
    };
    const config_inteligencia = {
        type: 'doughnut',
        data: data_inteligencia,
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Inteligencia Emocional'
                }
            }

        }
    };

    var inteligencia = new Chart(
        document.getElementById("inteligencia_canva_" + id),
        config_inteligencia
    );

    // ----- TRABAJO BAJO PRESIÓN -----
    const data_trabajo = {
        labels: [
            'Score Obtenido',
            'Score Faltante'
        ],
        datasets: [{
            label: 'Trabajo',
            data: [score_trabajo, 40 - score_trabajo],
            backgroundColor: [
                'rgb(41, 128, 185)',
                'rgb(93, 173, 226)'
            ],
            hoverOffset: 4

        }]
    };
    const config_trabajo = {
        type: 'doughnut',
        data: data_trabajo,
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Trabajo bajo presión'
                }
            }
        }
    };
    var trabajo = new Chart(
        document.getElementById("trabajo_canva_" + id),
        config_trabajo
    );


    // ----- COMPARACIÓN -----
    const data_comparacion = {
        labels: [
            'Inteligencia Emocional',
            'Trabajo Bajo Presión'
        ],
        datasets: [{
            label: 'Comparación entre Softskills',
            data: [(score_inteligencia * 100) / 42, (score_trabajo * 100) / 40],
            backgroundColor: [
                'rgb(170, 216, 211)',
                'rgb(93, 173, 226)'
            ],
            borderColor: [
                'rgb(0, 173, 181)',
                'rgb(41, 128, 185)'
            ],
            borderWidth: 2
        }]
    }

    const config_comparacion = {
        type: 'bar',
        data: data_comparacion,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
    };

    var comparacion = new Chart(
        document.getElementById("comparacion_canva_" + id),
        config_comparacion
    );
};