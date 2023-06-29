document.addEventListener("DOMContentLoaded", function() {
  var accountTypeSelect = document.getElementById("account-type");
  var detailsContainer = document.getElementsByClassName("details");
  var showDetailsButton = document.getElementById("show-details-btn");
  var registrationForm = document.getElementById("registration-form");

  accountTypeSelect.addEventListener("change", function() {
    var selectedOption = this.value;
    hideAllDetails();
    if (selectedOption) {
      var detailsElement = document.getElementById(selectedOption + "-details");
      if (detailsElement) {
        detailsElement.style.display = "block";
      }
    }
  });

  showDetailsButton.addEventListener("click", function() {
    var accountType = accountTypeSelect.value;
    if (accountType) {
      hideAllDetails();
      var detailsElement = document.getElementById(accountType + "-details");
      if (detailsElement) {
        detailsElement.style.display = "block";
      }
    }
  });

  registrationForm.addEventListener("submit", function(event) {
    event.preventDefault();
  });

  function hideAllDetails() {
    for (var i = 0; i < detailsContainer.length; i++) {
      detailsContainer[i].style.display = "none";
    }
  }
});
