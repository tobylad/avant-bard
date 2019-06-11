$(document).ready(function() {
  if ($("#scrabble-results").length) {
    generateListTitles();
    combineWordsByLength();
  }
});

var createListTitle = function(lengthString) {
  return "<p class='word-length'>" + lengthString + "-letter words:</p>";
}

var generateListTitles = function() {
  $(".word-list").each(function() {
    var list = $(this);
    var wordLength = list.find("li").first().text().length.toString();
    list.parent().prepend(createListTitle(wordLength));
  });

}
 
var combineWordsByLength = function() {
  var listWordLengths = [];
  $(".word-length").each(function() {
    listWordLengths.push(($(this).text().replace("-letter words:", "")));
  });

  var maxLength = Math.max.apply(null, listWordLengths);

  console.log(maxLength);

};