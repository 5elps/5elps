// script.js
const paragraphs = document.querySelectorAll('p');

paragraphs.forEach(paragraph => {
    paragraph.addEventListener('mouseenter', () => {
        paragraph.style.color = 'red';
    });
    paragraph.addEventListener('mouseleave', () => {
        paragraph.style.color = 'black';
    });
});
