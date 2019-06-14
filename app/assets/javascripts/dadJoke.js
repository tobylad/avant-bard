$(document).ready(function() {
  generateRandomBoxColor();
});

var hexCodes = [
  "#bcf",
  "#c379f0",
  "#aae2d7",
  "#d9cb3a",
  "#50d849",
  "#da9fc4",
  "#fff",
  "#e77985",
  "#fc9460"
];

function randomIndex(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function generateRandomBoxColor() {
  $(".dad-joke").css("background-color", hexCodes[randomIndex(9)]);
}