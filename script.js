// script.js

// Slideshow script
let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.getElementsByClassName("slide");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }
    slides[slideIndex - 1].style.display = "block";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}

// Button creation and functionality script
document.addEventListener('DOMContentLoaded', function() {
    // Create a button
    let button = document.createElement('button');
    button.textContent = 'Click Me';
    button.classList.add('my-button'); // Add class for styling
    
    // Append the button to the body (you can append it to any element)
    document.body.appendChild(button);
    
    // Add event listener for button click
    button.addEventListener('click', function() {
        alert('Button clicked!');
    });
});
