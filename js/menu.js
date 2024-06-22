const WEEK = [
  "DOMINGO",
  "LUNES",
  "MARTES",
  "MIERCOLES",
  "JUEVES",
  "VIERNES",
  "SÁBADO",
];

// function updateTime() {
//   var now = new Date();

//   document.getElementById("time").innerText =
//     WEEK[now.getDay()] +
//     " " +
//     zeroPadding(now.getDate(), 2) +
//     " - " +
//     zeroPadding(now.getHours(), 2) +
//     ":" +
//     zeroPadding(now.getMinutes(), 2) +
//     ":" +
//     zeroPadding(now.getSeconds(), 2);
// }

// updateTime();
// setInterval(updateTime, 1000);

// function zeroPadding(num, digit) {
//   return String(num).padStart(digit, "0");
// }

$("#user_perfil").click(() => {
  $("#modalPerfil").modal("show");
});
$("#btn_salir").click(function () {
  location.href = "../index.html";
});

// Funcion que obtiene y muestra los datos del usuario logeado

function userLogeado() {
  $.ajax({
    url: "../servicios/user_logeado.php",
    method: "POST",
    data: { usuario: localStorage.user },
    dataType: "json",
    success: function (json) {
      if (json.logeado == true) {
        $("#p_nombre").text(json.nombre);
        $("#p_ci").text(json.ci);
        $("#p_rol").text(json.rol);
        $("#p_dependencia").text(json.dependencia);
        $("#p_ciudad").text(json.ciudad);
        $("#p_direccion").text(json.direccion);
        $("#p_usuario").text(localStorage.user);
        $("#p_userPerfil").attr("src", "../img/usuarios/" + json.foto);
        localStorage.id_funcionario = json.id_funcionario;
      }
    },
  });
}

userLogeado();

// =============== Funcionalidad de Modal Editar Datos || Foto ================ \\

let op = "";

function cargarComboCiudades() {
  let combo_ciudades = $("#f_ciudad");
  if (combo_ciudades.children().length > 0) {
    combo_ciudades.empty();
  }
  $.ajax({
    type: "POST",
    url: "../servicios/ciudades/cargar_ciudades.php",
    dataType: "json",
    success: function (json) {
      $.each(json, function (i, obj) {
        $("#f_ciudad").append(
          $("<option>").text(obj.ciudad).attr("value", obj.id_ciudad)
        );
      });
    },
  });
}

$("#btn_datos").click(function () {
  op = "Datos";
  $("#modalPerfil").modal("hide");
  $("#modalEditar").modal("show");
  $("#title_editar").text("Editar Datos");
  cargarComboCiudades();
  $.ajax({
    url: "../servicios/funcionarios/obtener_funcionario.php",
    method: "POST",
    data: { id_funcionario: localStorage.id_funcionario },
    dataType: "json",
    success: function (json) {
      if (json.encontrado == true) {
        $("#ci_num").val(json.ci);
        $("#f_nombre").val(json.nombre);
        $("#f_apellido").val(json.apellido);
        $("#f_ciudad").val(json.id_ciudad);
        $("#f_direccion").val(json.direccion);
      }
    },
  });
});

function editar_datos() {
  let ciNum = $("#ci_num").val();
  let nom = $("f_nombre").val();
  let ape = $("f_apellido").val();
  let id_ciu = $("#f_ciudad").val();
  let dir = $("#f_direccion").val();
  
}
