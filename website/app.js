window.onscroll = () => {
    sections.forEach(sec => {
        let top = window.scrollY;
        let offset = sec.offsetTop - 150;
        let height = sec.offsetHeight;
        let id = sec.getAttribute('id');

        if (top >= offset && top < offset + height) {
            navLinks.forEach(link => {
                if (link.getAttribute('href').includes(id)) {
                    link.classList.add('active');
                } else {
                    link.classList.remove('active');
                }
            });
        }
    });
};
