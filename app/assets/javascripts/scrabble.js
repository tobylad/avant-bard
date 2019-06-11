$(document).ready(function() {
  if ($("#scrabble-results").length) {
    generateListTitles();
    combineWordsByLength();
  }


});

let createListTitle = function(lengthString) {
  return "<p class='word-length'>" + lengthString + "-letter words:</p>";
}

let generateListTitles = function() {
  $(".word-list").each(function() {
    let list = $(this);
    let wordLength = list.find("li").first().text().length.toString();
    list.parent().prepend(createListTitle(wordLength));
  });

}
 
let combineWordsByLength = function() {
  let listWordLengths = [];
  $(".word-length").each(function() {
    listWordLengths.push(($(this).text().replace("-letter words:", "")));
  });

  let maxLength = Math.max.apply(null, listWordLengths);

  console.log(maxLength);

};