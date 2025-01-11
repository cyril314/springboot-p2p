(function ($) {
    $('#leftControl,#rightControl').css({'opacity': 0.4});
    $('#leftControl,#rightControl').hover(function () {
            $(this).fadeTo(200, 0.8);
        }, function () {
            $(this).fadeTo(200, 0.4);
        }
    );
    $(".acitvity").hover(function () {
        $("#controlpanel").css("display", "block");
    }, function () {
        $("#controlpanel").css("display", "none");
    });

    $.fn.slide = function (options) {
        var defaults = {
            slideWidth: 966,
            autoplay: true,
            duration: 15000,
            showSlideIndex: true
        };
        var options = $.extend(defaults, options);
        return this.each(function () {
            var slideshow = $(this);
            var o = options;
            var currentPosition = 0;
            var slides = $('.slide');
            var numberOfSlides = slides.length;

            // Remove scrollbar in JS
            $('#slidesContainer').css('overflow', 'hidden');

            // Wrap all .slides with #slideInner div
            slides.wrapAll('<div id="slideInner"></div>')
                // Float left to display horizontally, readjust .slides width
                .css({
                    'float': 'left',
                    'width': o.slideWidth
                });

            // Insert a clone of first slide
            $('.slide:first').clone().appendTo('#slideInner');

            // Set #slideInner width equal to total width of all slides
            $('#slideInner').css('width', o.slideWidth * (numberOfSlides + 1));


            // Create event listeners for .controls clicks
            $('#leftControl').click(function () {
                prev()
            });
            $('#rightControl').click(function () {
                next()
            });

            // Init slides index
            if (o.showSlideIndex == true) {
                $('#slideIndex').append((currentPosition + 1) + '/' + numberOfSlides);
            }
            // Start
            init();
            //Init function
            function init() {
                manageControls(currentPosition);
                if (o.autoplay == true) setNextTimeOut(o.duration);
            }

            // Next
            function next() {
                currentPosition++;
                if (currentPosition >= numberOfSlides) currentPosition = 0;
                slideTo(currentPosition, true);
            }

            // Previous
            function prev() {
                currentPosition--;
                if (currentPosition < 0) currentPosition = numberOfSlides - 1;
                slideTo(currentPosition, false);
            }

            // Go to a slide
            function goto(position) {
                currentPosition = position;
                slideTo(currentPosition, false);
            }

            // Set time out for next slide
            function setNextTimeOut(time) {
                $('#slidesContainer').stop();
                // Just a crap animation to get timer, I got problem with setTimeout
                $('#slidesContainer').animate({optical: 1}, time, '', function () {
                    next();
                });
            }

            // Slide
            function slideTo(position, continuously) {
                //change slideIndex
                $('#slideIndex').html((position + 1) + '/' + numberOfSlides);

                $('#slideInner').stop();
                // usual cases
                if (continuously == false || o.autoplay == false || position != 0) {
                    $('#slideInner').animate({'marginLeft': o.slideWidth * (-position)}, '', '',
                        function () {
                            manageControls(position);
                            if (o.autoplay == true) setNextTimeOut(o.duration);
                        }
                    )
                }
                // autoplay: slide from last to first one continuously
                else {
                    // slide to the 'fake' first slide (actually at the last)
                    $('#slideInner').animate({'marginLeft': o.slideWidth * (-numberOfSlides)}, '', '',
                        function () {
                            //immediately change to the 'true' first slide
                            $('#slideInner').css('marginLeft', 0);
                            manageControls(position)
                            if (o.autoplay == true) setNextTimeOut(o.duration);
                        }
                    )
                }
            }

            // manageControls: Hides and Shows controls depending on currentPosition
            function manageControls(position) {
                // Hide left arrow if position is first slide
                if (position == 0) {
                    $('#leftControl').show()
                } else {
                    $('#leftControl').show()
                }
                ;
                // Hide right arrow if position is last slide
                if (position == (numberOfSlides - 1)) {
                    $('#rightControl').show()
                } else {
                    $('#rightControl').show()
                }
                ;
            }
        });
    };
})(jQuery);