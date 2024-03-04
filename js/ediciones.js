let operacion = "";
let id_edicion = 0;

$("#btn_nuevo").click(function() {
    $("#modalEdiciones").modal("show");
    $(".modal-title").text("Nueva Edición");
    operacion = "Nuevo";
});

let ediciones;

function cargarEdiciones () {
    ediciones = $("#tabla_ediciones").DataTable({
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
            url: "../servicios/ediciones/cargar_ediciones.php",
            dataSrc: "",
          },
          columns: [
            { data: "edicion" },
            {
              data: null,
              defaultContent:
                "<a class='btn btn-primary neon-btn editar'><i class='fa fa-pen-to-square'></i> </a>" +
                "<a class='btn btn-danger neon-btn eliminar ms-2'><i class='fa fa-trash'></i> </a>",
            },
          ],
          createdRow: function (row, data) {
            $("a.editar", row).attr("id", data.id_ediciones);
            $("a.eliminar", row).attr("id", data.id_ediciones);
          },
    })
}

cargarEdiciones();

function guardarEdicion() {
    let edicion = $("#edicion").val().toUpperCase();
    $.ajax({
        url: "../servicios/ediciones/guardar_edicion.php",
        method: "POST",
        data: {edicion: edicion},
        dataType: "json",
        success: function(json) {
            if(json.guardado === true) {
                successMessage("Registro Insertado.");
                ediciones.ajax.reload();
                $("#modalEdiciones").modal("hide");
            } else if(json.existe === true)  {
                warningMessage("La edición ya existe. Ingrese otra edición");
                $("#edicion").focus();
            } else {
                errorMessage(json.mensaje);
            }
        }
    })
}

$(document).on("click", ".editar", function() {
    id_edicion = $(this).attr("id");
    $("#modalEdiciones").modal("show");
    $(".modal-title").text("Modificar Edición");
    $("#btn_guardar").text("Actualizar");
    operacion = "Editar";
    $.ajax({
        url: "../servicios/ediciones/obtener_edicion.php",
        method: "POST",
        data: {id_edicion: id_edicion},
        dataType: "json",
        success: function(json) {
            if(json.encontrado === true) {
                $("#edicion").val(json.edicion);
            }
        }
    })
})

function editarEdicion() {
  
}

$("#btn_guardar").click(function() {
    if(operacion === "Nuevo") {
        guardarEdicion();
    } else if(operacion === "Editar") {

    }
})
