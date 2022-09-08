// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener('turbo:load', function() {
  var coll = document.getElementsByClassName("dropdown");
  var i;
  if (coll.length > 0) {
    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.display === "block") {
          content.style.display = "none";
        } else {
          content.style.display = "block";
        }
      });
    }
  }

  // Sy did not enjoy doing this, this is purely to get this shit running, normally he would do this better
  var likeBtns = Array.from(document.getElementsByClassName('fa-regular'));
  if (likeBtns.length > 0) {
    likeBtns.forEach((btn) => {
      console.log('something')
      btn.addEventListener('click', function() {
        btn.classList.remove('fa-regular');
        btn.classList.add('fa-solid');
        document.querySelector('.favorites-notice').innerHTML =
          `<div class="alert alert-info alert-dismissible fade show m-1" role="alert">
            Added to Favourites!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            </button>
          </div>`
      })
    });
  }
})

// var coll = document.getElementsByClassName("dropdown");
// var i;

// for (i = 0; i < coll.length; i++) {
//   coll[i].addEventListener("click", function() {
//     this.classList.toggle("active");
//     var content = this.nextElementSibling;
//     if (content.style.display === "block") {
//       content.style.display = "none";
//     } else {
//       content.style.display = "block";
//     }
//   });
// }
