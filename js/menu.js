const WEEK = [
  "DOMINGO",
  "LUNES",
  "MARTES",
  "MIERCOLES",
  "JUEVES",
  "VIERNES",
  "SÁBADO",
];

function updateTime() {
  var now = new Date();

  document.getElementById("time").innerText =
    WEEK[now.getDay()] +
    " " +
    zeroPadding(now.getDate(), 2) +
    " - " +
    zeroPadding(now.getHours(), 2) +
    ":" +
    zeroPadding(now.getMinutes(), 2) +
    ":" +
    zeroPadding(now.getSeconds(), 2);
}

updateTime();
setInterval(updateTime, 1000);

function zeroPadding(num, digit) {
  return String(num).padStart(digit, "0");
}
