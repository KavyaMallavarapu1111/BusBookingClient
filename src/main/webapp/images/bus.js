/* document.addEventListener("DOMContentLoaded", function() {
    const carousel = document.querySelector(".carousel-container");
    const cards = document.querySelectorAll(".tourist-card");
  
    let currentIndex = 0;
    const cardWidth = cards[0].clientWidth + parseInt(getComputedStyle(cards[0]).marginRight);
  
    function moveCarousel(direction) {
      currentIndex += direction;
      if (currentIndex < 0) {
        currentIndex = cards.length - 1;
      } else if (currentIndex >= cards.length) {
        currentIndex = 0;
      }
      const translateX = -currentIndex * cardWidth;
      carousel.style.transform = `translateX(${translateX}px)`;
    }
  
    document.querySelector(".left-button").addEventListener("click", () => moveCarousel(-1));
    document.querySelector(".right-button").addEventListener("click", () => moveCarousel(1));
  });
   */

  