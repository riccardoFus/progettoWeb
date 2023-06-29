var currentIndex = 1;

// Show current image
showSlides(currentIndex);

// Function to move Next
function plusSlides(n) {
    showSlides(currentIndex += n);
}

// Function to move back
function currentSlide(n) {
    showSlides(currentIndex = n);
}


// Initiate moving of slides
function showSlides(currentIndex) {
    var i;
    var slides = document.getElementsByClassName("imagesFade");
    var dots = document.getElementsByClassName("navigation-dot");
    if (currentIndex > slides.length) {currentIndex = 1}
    if (currentIndex < 1) {currentIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.opacity = "0";

    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[currentIndex-1].style.opacity = "1";
    dots[currentIndex-1].className += " active";
}