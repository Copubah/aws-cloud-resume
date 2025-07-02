// Toggle navbar on mobile
const menuIcon = document.querySelector('#menu-icon');
const navbar = document.querySelector('.navbar');

menuIcon.onclick = () => {
  navbar.classList.toggle('active');
};

// Highlight active nav link based on scroll position
const sections = document.querySelectorAll('section');
const navLinks = document.querySelectorAll('.navbar a');

window.onscroll = () => {
  const scrollY = window.scrollY;

  sections.forEach(section => {
    const offsetTop = section.offsetTop - 150;
    const sectionHeight = section.offsetHeight;
    const sectionId = section.getAttribute('id');

    if (scrollY >= offsetTop && scrollY < offsetTop + sectionHeight) {
      navLinks.forEach(link => {
        // Remove 'active' from all
        link.classList.remove('active');

        // Add 'active' to the one matching current section
        if (link.getAttribute('href').includes(sectionId)) {
          link.classList.add('active');
        }
      });
    }
  });

  // Optional: close mobile menu when scrolling
  navbar.classList.remove('active');
};
