$(document).ready(function() {

  toastr.options = {
    closeButton: false,
    debug: false,
    newestOnTop: false,
    progressBar: false,
    positionClass: "toast-top-center",
    preventDuplicates: true,
    onclick: null,
    showDuration: "300",
    hideDuration: "1000",
    timeOut: "2000",
    extendedTimeOut: "1000",
    showEasing: "swing",
    hideEasing: "linear",
    showMethod: "fadeIn",
    hideMethod: "fadeOut",
  };

  let ci = 0;
  let id_funcionario = 0;
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

    function guardar_expediente() {
      let nro_expediente = $("#nro").val().trim();
      let fecha = $("#fecha").val().trim();
      let area = $("#area").val();
      let objeto = $("#objeto").val().toUpperCase().trim();
      let dependencia = $("#dependencia").val();
      let observacion = $("#observacion").val().toUpperCase().trim();
      
      if(nro_expediente.length == 0) {
        toastr.warning("Ingrese el número del expediente.!!!");
        $("#nro").focus();
      } else if(fecha.length == 0) {
        toastr.warning("Ingrese la fecha de recepción.!!!");
        $("#fecha").focus();
      } else if(area.length == 0) {
        toastr.warning("Seleccione el remitente.!!!");
      } else if(objeto.length == 0) {
        toastr.warning("Ingrese el objeto del expediente.!!!");
        $("#objeto").focus();
      } else if(dependencia.length == 0) {
        toastr.warning("Seleccione la dependencia.!!!");
      } else {
        $.ajax({
          url: "../servicios/expedientes/guardar_expediente.php",
          method: "POST",
          data: 
          {
            nro_expediente: nro_expediente,
            fecha: fecha,
            id_area: area,
            objeto: objeto,
            id_dependencia: dependencia,
            observacion: observacion,
            id_funcionario: id_funcionario,
            estado: "pendiente"
          },
          dataType: "json",
          success: function(json) {
            json.guardado == true,
            successMessage(json.mensaje);
          }
        })
      }

    }

  });
  
