// ================================================================
// Φαιστός ΦΑΪ — Universal Navbar Horizontal Scroll Controller
// Handles mobile scrollable menu with subtle indicator arrows & pulse
// ================================================================
(function() {
    function initNavScroll() {
        const wrapper = document.querySelector('.navbar-links-wrapper');
        const nav = document.querySelector('.navbar-links');
        const leftBtn = document.querySelector('.nav-arrow-left');
        const rightBtn = document.querySelector('.nav-arrow-right');
        if (!wrapper || !nav || !leftBtn || !rightBtn) return;

        function updateArrows() {
            const maxScroll = nav.scrollWidth - nav.clientWidth;
            const hasOverflow = maxScroll > 8;

            if (!hasOverflow) {
                leftBtn.classList.remove('visible');
                rightBtn.classList.remove('visible');
                rightBtn.classList.remove('hint-pulse');
                wrapper.classList.remove('has-scroll-left', 'has-scroll-right');
                return;
            }

            const current = nav.scrollLeft;

            // Left arrow
            if (current > 10) {
                leftBtn.classList.add('visible');
                wrapper.classList.add('has-scroll-left');
            } else {
                leftBtn.classList.remove('visible');
                wrapper.classList.remove('has-scroll-left');
            }

            // Right arrow
            if (current < maxScroll - 10) {
                rightBtn.classList.add('visible');
                wrapper.classList.add('has-scroll-right');
            } else {
                rightBtn.classList.remove('visible');
                rightBtn.classList.remove('hint-pulse');
                wrapper.classList.remove('has-scroll-right');
            }
        }

        leftBtn.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            rightBtn.classList.remove('hint-pulse');
            nav.scrollBy({ left: -160, behavior: 'smooth' });
        });

        rightBtn.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            rightBtn.classList.remove('hint-pulse');
            nav.scrollBy({ left: 160, behavior: 'smooth' });
        });

        nav.addEventListener('scroll', () => {
            rightBtn.classList.remove('hint-pulse');
            updateArrows();
        }, { passive: true });

        window.addEventListener('resize', updateArrows, { passive: true });

        // Scroll active nav item into view on load
        function scrollActiveIntoView() {
            const activeLink = nav.querySelector('a.active');
            if (!activeLink) return;
            const navLeft = nav.getBoundingClientRect().left;
            const linkLeft = activeLink.getBoundingClientRect().left;
            const linkCenter = activeLink.offsetLeft + activeLink.offsetWidth / 2;
            const navCenter = nav.clientWidth / 2;
            const targetScroll = linkCenter - navCenter;
            nav.scrollTo({ left: targetScroll, behavior: 'smooth' });
        }

        // Check after DOM layout & fonts are ready
        setTimeout(() => { updateArrows(); scrollActiveIntoView(); }, 100);
        setTimeout(() => { updateArrows(); scrollActiveIntoView(); }, 400);
        setTimeout(updateArrows, 1000);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initNavScroll);
    } else {
        initNavScroll();
    }
})();
