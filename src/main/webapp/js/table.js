// Main
$(document).ready(function () {
    $('#example').DataTable({
        dom: 'Bfrtip',
        select:         true,
        scrollY:        '50vh',
        scrollX:        '50vh',
        scrollCollapse: true,
        paging:         false,
        ordering:       false,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        },
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal({
                    header: function (row) {
                        var data = row.data();
                        return 'Detalles de ' + data[0] + ' ' + data[1];
                        buttons: [
                            { extend: 'copy', text: 'Copiar' },
                            { extend: 'pdf', text: 'Exportar en PDF', title: 'Lista de candidatos para Minsait',
                                customize: function(doc) {
                                    doc.defaultStyle.alignment = 'center';
                                    doc.styles.tableHeader.alignment = 'center';
                                }
                            }
                        ]
                    }
                }),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                    tableClass: 'table'
                })
            }
        },
        buttons: [
            { extend: 'copy', text: 'Copiar' },
            { extend: 'pdf', text: 'Exportar en PDF', title: 'Lista de candidatos para Minsait',
                customize: function(doc) {
                    doc.defaultStyle.alignment = 'center';
                    doc.styles.tableHeader.alignment = 'center';
                }
            },
            { extend: 'csv', text: 'Exportar en CSV'},
            { extend: 'excel', text: 'Exportar en Excel'},
            {
                extend: 'print',
                text: 'Imprimir todo (no solo seleccionados)',
                title: 'Lista de candidatos para Minsait',
                exportOptions: {
                    modifier: {
                        selected: null
                    }
                }
            }
        ]
    });
});
/*$(document).ready(function () {
  $('#example').DataTable({
    dom: 'Bfrtip',
    select: true,
    scrollY: '50vh',
    scrollX: '50vh',
    customize: function (doc) {
      doc.defaultStyle.word = 'break-all';
      doc.styles.tableHeader.alignment = 'center';
    },
    scrollCollapse: true,
    paging: false,
    "language": {
      "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
    },
    buttons: [
      { extend: 'copy', text: 'Copiar' },
      {
        extend: 'pdf', text: 'Exportar en PDF', title: 'Lista de candidatos para Minsait',
        customize: function (doc) {
          doc.defaultStyle.alignment = 'center';
          doc.styles.tableHeader.alignment = 'center';
        }
      },
      {
        extend: 'csv', text: 'Exportar en CSV',
        charset: 'UTF-8',
        //fieldSeparator: ';',
        bom: true,
        filename: 'Csv Minsait Candidatos',
        title: 'Csv Minsait Candidatos'
      },
      {
        extend: 'excel', text: 'Exportar en Excel',
        charset: 'UTF-8',
        //fieldSeparator: ';',
        bom: true,
        filename: 'Excel Minsait Candidatos',
        title: 'Excel Minsai tCandidatos'
      },
      {
        extend: 'print',
        text: 'Imprimir todo (no solo seleccionados)',
        title: 'Lista de candidatos para Minsait',
        exportOptions: {
          modifier: {
            selected: null
          }
        }
      }
    ]
  });
});

// Modal
$(document).ready(function () {
  $("#example1").DataTable({
    dom: "Bfrtip",
    buttons: [
      { extend: "copy", text: "Copiar" },
      {
        extend: "pdf",
        text: "Exportar en PDF",
        title: "Lista de candidatos para Minsait",
        customize: function (doc) {
          doc.defaultStyle.alignment = "center";
          doc.styles.tableHeader.alignment = "center";
        },
      },
    ],
    scrollY: "50vh",
    scrollX: "50vh",
    scrollCollapse: true,
    paging: false,
    ordering: false,
    language: {
      url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json",
    },
  });
});
*/