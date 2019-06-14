$(document).ready(function() {
  generateRandomBoxColor();
});

var hexCodes = [
  "bcf",
  "c379f0",
  "aae2d7",
  "d9cb3a",
  "50d849",
  "b38d86",
  "777",
  "da9fc4",
  "#fff",
  "d42639"
];

function randomIndex(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function generateRandomBoxColor() {
  $(".dad-joke").css("background-color", "#" + hexCodes[randomIndex(10)]);
}