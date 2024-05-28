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
      }
    },
  });
}

userLogeado();

// =============== Funcionalidad de Modal Editar Datos || Foto ================ \\

let operacion = "";

$("#btn_datos").click(function () {
  operacion = "Datos";
  $("#modalPerfil").modal("hide");
  $("#modalEditar").modal("show");
  $("#title_editar").text("Editar Datos");
  $("#div_datos").html(`
  <div class="mt-2">
  <label for="ci_num">C.I</label>
  <input type="text" name="ci_num" id="ci_num" class="form-control">
  </div>
  <div class="mt-2">
    <label for="f_nombre">Nombre</label>
    <input type="text" name="f_nombre" id="f_nombre" class="form-control">
  </div>
<div class="mt-2">
  <label for="f_apellido">Apellido</label>
  <input type="text" name="f_apellido" id="f_apellido" class="form-control">
</div>
<div class="mt-2">
  <label for="f_ciudad">Ciudad</label>
  <select name="f_ciudad" id="f_ciudad" class="form-select">
  </select>
</div>
<div class="mt-2">
  <label for="f_direccion">Dirección</label>
  <input type="text" name="f_direccion" id="f_direccion" class="form-control">
  </div>`);
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
