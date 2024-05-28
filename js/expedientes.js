$(document).ready(function() {
    let ci = 0
    $("#btn_guardar").click(function () {
      Swal.fire({
        title: "Confirmar Envio del documento",
        input: "text",
        inputPlaceholder: "Ingrese su C.I",
        showCancelButton: true,
        confirmButtonText: "Enviar",
        cancelButtonText: "Cancelar",
        showLoaderOnConfirm: true,
        preConfirm: (input) => {
          // Aquí puedes hacer algo con el ci ingresado
          ci = Number(input);
        },
      }).then((result) => {

        if(ci == 6658363) {
            $("#recepcionado").val("Alexander Rivas");
        }

      });
    });

    function comboAreas() {
      $.ajax({
        type: "POST",
        url: "../servicios/areas/cargar_areas.php",
        dataType: "json",
        success: function (json) {
          $.each(json, function (i, obj) {
            $("#area").append($("<option>").text(obj.area).attr("value", obj.id_area));
          });
        },
      });
    }
    
    comboAreas();

    function comboDependencias() {
      $.ajax({
        type: "POST",
        url: "../servicios/dependencias/cargar_dependencias.php",
        dataType: "json",
        success: function (json) {
          $.each(json, function (i, obj) {
            $("#dependencia").append($("<option>").text(obj.dependencia).attr("value", obj.id_dependencia));
          });
        },
      });
    }
    
    comboDependencias();

    fechaActual($("#fecha"));

  });
  
