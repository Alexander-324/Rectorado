$(document).ready(function () {
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
  let ope = "";
  let verificado = false;

  function comboAreas() {
    $.ajax({
      type: "POST",
      url: "../servicios/areas/cargar_areas.php",
      dataType: "json",
      success: function (json) {
        $.each(json, function (i, obj) {
          $("#area").append(
            $("<option>").text(obj.area).attr("value", obj.id_area)
          );
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
          $("#dependencia").append(
            $("<option>")
              .text(obj.dependencia)
              .attr("value", obj.id_dependencia)
          );
        });
      },
    });
  }

  comboDependencias();

  function comboObjetos() {
    $.ajax({
      type: "POST",
      url: "../servicios/objetos/cargar_objetos.php",
      dataType: "json",
      success: function (json) {
        $.each(json, function (i, obj) {
          $("#objetos").append(
            $("<option>").text(obj.objeto).attr("value", obj.id_objeto)
          );
        });
      },
    });
  }

  comboObjetos();

  fechaActual($("#fecha"));

  // function buscarObjeto() {
  //   let codigo = $("#cod_obj").val();
  //   $.ajax({
  //     url: "../servicios/expedientes/buscar_objeto.php",
  //     method: "POST",
  //     data: { codigo: codigo },
  //     dataType: "json",
  //     success: function (json) {
  //       if (json.encontrado == true) {
  //         $("#objetos").val(json.id_objeto);
  //       } else {
  //         $("#objetos").val("");
  //         console.log(json.error);
  //       }
  //     },
  //   });
  // }

  // $("#cod_obj").on("input", function () {
  //   buscarObjeto();
  // });

  function cargado() {
    let nro_expediente = $("#nro").val().trim();
    let fecha = $("#fecha").val().trim();
    let area = $("#area").val();
    let objeto = $("#objetos").val();
    let dependencia = $("#dependencia").val();
    let observacion = $("#observacion").val().toUpperCase().trim();

    if (nro_expediente.length == 0) {
      toastr.warning("Ingrese el número del expediente.!!!");
      $("#nro").focus();
      return false;
    } else if (fecha.length == 0) {
      toastr.warning("Ingrese la fecha de recepción.!!!");
      $("#fecha").focus();
      return false;
    } else if (area.length == 0) {
      toastr.warning("Seleccione el remitente.!!!");
      return false;
    } else if (objeto.length == 0) {
      toastr.warning("Seleccione el objeto del expediente.!!!");
      $("#objeto").focus();
      return false;
    } else if (dependencia.length == 0) {
      toastr.warning("Seleccione la dependencia.!!!");
      return false;
    } else {
      return true;
    }
  }

  function guardarExpediente() {
    let nro_expediente = $("#nro").val().trim();
    let fecha = $("#fecha").val().trim();
    let area = $("#area").val();
    let objeto = $("#objetos").val();
    let dependencia = $("#dependencia").val();
    let observacion = $("#observacion").val().toUpperCase().trim();
    if (verificado == true) {
      $.ajax({
        url: "../servicios/expedientes/guardar_expediente.php",
        method: "POST",
        data: {
          nro_expediente: nro_expediente,
          fecha_recepcion: fecha,
          id_area: area,
          id_objeto: objeto,
          id_dependencia: dependencia,
          observacion: observacion,
          id_funcionario: id_funcionario,
          estado: "enviado a rectorado",
        },
        dataType: "json",
        success: function (json) {
          if (json.guardado == true) {
            successMessage(json.mensaje);
            verificado = false;
            $("#form_expedientes")[0].reset();
            $("#nro").focus();
          } else {
            warningMessage(json.mensaje);
          }
        },
      });
    }
  }

  $("#btn_guardar").click(function () {
    if (cargado() == true) {
      $("#modalConfirmar").modal("show");
    }
  });

  $("#btn_conf").click(function () {
    let ci = $("#ci").val();
    $.ajax({
      url: "../servicios/expedientes/obtener_funcionario.php",
      method: "POST",
      data: { ci: ci },
      dataType: "json",
      success: function (json) {
        if (ci.length == 0) {
          toastr.warning("Ingrese su C.I.!!!");
          $("#ci").focus();
        } else {
          if (json.encontrado == true) {
            verificado = true;
            $("#recepcionado").val(json.funcionario);
            id_funcionario = json.id_funcionario;
            $("#modalConfirmar").modal("hide");
            guardarExpediente();
          }
        }
      },
    });
  });
});
