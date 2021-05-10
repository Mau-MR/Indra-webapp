$(document).ready(function () {
    $("#example").DataTable({
        dom: "Bfrtip",
        select: true,
        scrollY: "60vh",
        scrollX: "50vw",
        scrollCollapse: true,
        paging: false,
        ordering: false,
        language: {
            url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json",
        },
        responsive: {
            details: {
                renderer: function (api, rowIdx, columns) {
                    var data = $.map(columns, function (col, i) {
                        return col.hidden ?
                            '<tr data-dt-row="' + col.rowIndex + '" data-dt-column="' + col.columnIndex + '">' +
                            '<td>' + col.title + ':' + '</td>' +
                            '<td>' + col.data + '</td>' +
                            '</tr>' :
                            '';
                    }).join('');

                    return data ?
                        $('<table/>').append(data) :
                        false;
                }
            }
        },
        buttons: [
            { extend: 'copy', text: 'Copiar' },
            {
                extend: 'pdfHtml5',
                text: 'Exportar en PDF',
                title: 'Lista de candidatos para Minsait',
                customize: function (doc) {
                    doc.defaultStyle.alignment = 'center';
                    doc.styles.tableHeader.alignment = 'center';
                    doc.styles.tableBodyEven.alignment = 'center';
                    doc.styles.tableBodyOdd.alignment = 'center';
                },
                orientation: 'landscape',
                pageSize: 'LEGAL',
            },
            {
                extend: 'csv',
                text: 'Exportar en CSV',
                charset: 'UTF-8',
                fieldSeparator: ';',
                bom: true,
                filename: 'Lista de Candidatos Minsait',
            },
            {
                extend: 'excel',
                text: 'Exportar en Excel',
                charset: 'UTF-8',
                fieldSeparator: ';',
                bom: true,
                filename: 'Lista de Candidatos Minsait',
            },
            {
                extend: 'print',
                text: 'Imprimir todo (no solo seleccionados)',
                title: 'Lista de candidatos para Minsait',
                exportOptions: {
                    modifier: {
                        selected: null,
                    }
                }
            }
        ]
    });
});
