$(document).ready(function() {
  hideShowForm();
});

function hideShowForm() {
  $(".form-expand,.plus").on("click", function() {
    $(this).closest(".word-form-box").find("form").toggleClass("hide");
  });
}