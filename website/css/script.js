const menuOpen = document.getElementById("menu-open");
const menuClose = document.getElementById("menu-close");
const menuTopRight = document.getElementById("menu-top-right");
const btnsearchmenumb = document.querySelector(".btn-search-menu-mb");
const searchMenu = document.querySelector(".searchMenu");
if (menuOpen) {
  menuOpen.addEventListener("click", () => {
    menuTopRight.classList.add("active");
  });
}
if (menuClose) {
  menuClose.addEventListener("click", () => {
    menuTopRight.classList.remove("active");
  });
}

// if (btnsearchmenumb) {
//   let elem = document.querySelector("#main1");
//   let hasClassMain = elem.classList.contains("active-btn");
//   if (hasClassMain == false) {
//     btnsearchmenumb.addEventListener("click", () => {
//       searchMenu.classList.add("active-btn");
//     });
//   } else {
//     btnsearchmenumb.addEventListener("click", () => {
//       searchMenu.classList.remove("active-btn");
//     });
//   }
// }
