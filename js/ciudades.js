let operacion = "";
let id_ciudad = 0;

$("#btn_nuevo").click(function () {
  $("#modalCiudades").modal("show");
  $(".modal-title").text("Nueva Ciudad");
  operacion = "Nuevo";
});

let ciudades;

function cargarCiudades() {
  ciudades = $("#tabla_ciudades").DataTable({
    language: {
      decimal: "",
      emptyTable: "No hay datos disponibles en la tabla",
      info: "Mostrando _START_ a _END_ de _TOTAL_ entradas",
      infoEmpty: "Mostrando 0 a 0 de 0 entradas",
      infoFiltered: "(filtradas de _MAX_ entradas totales)",
      infoPostFix: "",
      thousands: ",",
      lengthMenu: "Mostrar _MENU_ entradas",
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
        targets: [1],
        className: "dt-body-center",
      },
    ],
    ajax: {
      url: "../servicios/ciudades/cargar_ciudades.php",
      dataSrc: "",
    },
    columns: [
      { data: "ciudad" },
      {
        data: null,
        defaultContent:
          "<div class='container-fluid d-flex'> <a class='btn btn-primary neon-btn editar'><i class='fa fa-pen-to-square'></i> </a>" +
          "<a class='btn btn-danger neon-btn eliminar ms-2'><i class='fa fa-trash'></i> </a> </div>",
      },
    ],
    createdRow: function (row, data) {
      $("a.editar", row).attr("id", data.id_ciudad);
      $("a.eliminar", row).attr("id", data.id_ciudad);
    },
  });
}

cargarCiudades();

function guardarCiudad() {
  let ciudad = $("#ciudad").val().toUpperCase();
  $.ajax({
    url: "../servicios/ciudades/guardar_ciudad.php",
    method: "POST",
    data: { ciudad: ciudad },
    dataType: "json",
    success: function (json) {
      if (json.guardado === true) {
        successMessage("Registro Insertado.");
        ciudades.ajax.reload();
        $("#modalCiudades").modal("hide");
      } else if (json.existe === true) {
        warningMessage("La ciudad ya existe. Ingrese otra ciudad");
        $("#ciudad").focus();
      } else {
        errorMessage(json.mensaje);
      }
    },
  });
}

$(document).on("click", ".editar", function () {
  id_ciudad = $(this).attr("id");
  $("#modalCiudades").modal("show");
  $(".modal-title").text("Modificar Ciudad");
  $("#btn_guardar").text("Actualizar");
  operacion = "Editar";
  $.ajax({
    url: "../servicios/ciudades/obtener_ciudad.php",
    method: "POST",
    data: { id_ciudad: id_ciudad },
    dataType: "json",
    success: function (json) {
      if (json.encontrado === true) {
        $("#ciudad").val(json.ciudad);
      }
    },
  });
});

function modificarCiudad() {
  let ciudad = $("#ciudad").val().toUpperCase();
  $.ajax({
    url: "../servicios/ciudades/modificar_ciudad.php",
    method: "POST",
    data: {
      ciudad: ciudad,
      id_ciudad: id_ciudad,
    },
    dataType: "json",
    success: function (json) {
      if(json.modificado === true) {
        successMessage(json.mensaje);
      }
    },
  });
}

$("#btn_guardar").click(function () {
  if (operacion === "Nuevo") {
    guardarEdicion();
  } else if (operacion === "Editar") {
    modificarCiudad();
  }
});
