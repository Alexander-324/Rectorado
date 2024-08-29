function comboDependencias() {
  $.ajax({
    type: "POST",
    url: "../servicios/dependencias/cargar_dependencias.php",
    dataType: "json",
    success: function (json) {
      $.each(json, function (i, obj) {
        $("#dependencia_expedientes").append(
          $("<option>").text(obj.dependencia).attr("value", obj.id_dependencia)
        );
      });
    },
  });
}

$("#btn_salir").click(() => {
  location.href = "menu.php";
});

comboDependencias();

let id_expediente = 0;
let tablaExpedientes;
let dependencia;
let admin = false;

// Verificamos que si el rol del usuario es ADMINISTRADOR se muestre el select para filtrar por dependencias
if (localStorage.rol != "ADMINISTRADOR") {
  $("#div_select").hide();
  admin = false;
  dependencia = localStorage.dependencia;
} else {
  admin = true;
}

function cargarExpedientes() {
    if ($.fn.dataTable.isDataTable("#tabla_expedientes")) {
    $("#tabla_expedientes").DataTable().clear().destroy();
  }

  if(admin == true) {
    dependencia = $("#dependencia_expedientes").val();
  }

  tablaExpedientes = $("#tabla_expedientes").DataTable({
    // Traduccion del DataTables
    language: {
      decimal: "",
      emptyTable: "No hay datos disponibles en la tabla",
      info: "Mostrando _START_ dato/s de _END_ a _TOTAL_ datos",
      infoEmpty: "Mostrando 0 a 0 de 0 datos",
      infoFiltered: "(filtrados de _MAX_ datos totales)",
      infoPostFix: "",
      thousands: ",",
      lengthMenu: "Mostrar _MENU_ datos",
      loadingRecords: "Cargando...",
      processing: "Procesando...",
      search: "Buscar:",
      zeroRecords: "No se encontraron registros coincidentes",
      paginate: {
        first: "Primero",
        last: "Último",
        next: "Siguiente",
        previous: "Anterior",
      },
      aria: {
        sortAscending: ": activar para ordenar la columna ascendente",
        sortDescending: ": activar para ordenar la columna descendente",
      },
    },
    columnDefs: [
      {
        targets: [8],
        className: "dt-body-center",
      },
      {
        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8],
        className: "font",
      },
    ],
    ajax: {
      url: "../servicios/expedientes/expediente_revisar.php",
      method: "POST",
      data: { id_dependencia: dependencia },
      dataType: "json",
      dataSrc: "",
    },
    columns: [
      { data: "nro_expediente" },
      { data: "fecha" },
      { data: "anhio" },
      { data: "remitente" },
      { data: "objeto" },
      { data: "dependencia" },
      { data: "funcionario" },
      { data: "observacion" },
      {
        data: null,
        defaultContent:
          "<div class='container d-flex'><a class='btn btn-outline-primary editar me-2'><i class='fa fa-pen-to-square'></i> </a>" +
          "<a class='btn btn-outline-success agregar'><i class='fa fa-plus'></i> </a>" +
          "<a class='btn btn-outline-warning terminar ms-2'><i class='fa fa-check'></i> </a></div>",
      },
    ],
    createdRow: function (row, data) {
      // Asignar el valor de id de la tabla como el ID de los botones
      $("a.editar", row).attr("id", data.id_expediente);
      $("a.agregar", row).attr("id", data.id_expediente);
      $("a.terminar", row).attr("id", data.id_expediente);
    },
  });
}

cargarExpedientes();

$("#dependencia_expedientes").change(function() {
  cargarExpedientes();
});

// Modificar Documento
$(document).on("click", ".editar", function () {
  $("#modalEditarExp").modal("show"); 
  id_expediente = $(this).attr("id");
});


