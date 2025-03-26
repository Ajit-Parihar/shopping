// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import $ from "jquery";
import "jquery-ui/ui/widgets/datepicker";

document.addEventListener("turbo:load", function () {
    setTimeout(() => {
      $(".datepicker").datepicker();
    }, 100); // Turbo slow load issue fix
  });
  

document.addEventListener("turbo:load", function () {
    console.log("Turbo-Load: JavaScript is working!");
    
    // Example: Reattach event listeners after Turbo navigation
    document.querySelectorAll(".my-button").forEach(button => {
      button.addEventListener("click", function () {
        alert("Button Clicked!");
      });
    });
  });
  