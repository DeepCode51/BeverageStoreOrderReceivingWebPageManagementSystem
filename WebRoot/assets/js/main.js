/*-----------------------------------------------------------------------------------
    Template Name: Nycondos Luxury Apartments HTML Template
    Template URI: https://webtend.biz/onitir
    Author: WebTend
    Author URI: https://www.webtend.com
    Version: 1.0

	Note: This is Main js File For custom and jQuery plugins activation Code..
-----------------------------------------------------------------------------------

/*---------------------------
	JS INDEX
	===================
	01. Main Menu
	02. Banner Slider
	03. ROOM Slider(Big)
	04. Testimonial Slider
	05. Latest Post Slider
	06. Feature Apartment Slider
	07. CounterUp
	08. Instagram Feed Slider
	09. Food Menu SLider
	10. Gallery Sliders & Popup
	11. Apartment Slider Two
	12. Banner Image Slider
	13. offCanvas Active
	14. init extra plugin
	15. Active Gallery And Video Popup
	16. Search Form
	17. Prelader
	18. Back to top
	19. Sticky header

-----------------------------*/

var mirandaDoc;

(function ($) {
	'use strict';
	mirandaDoc = {
		init: function () {
			this.mianMenu();
			this.bannerSlider();
			this.roomSlider();
			this.testimonialSlider();
			this.latestPostlider();
			this.featureApartment();
			this.counterToUp();
			this.instaFeedSlider();
			this.menuSlider();
			this.gallery();
			this.roomSliderTwo();
			this.bannerImgSlider();
			this.teamSlider();
			this.offCanvas();
			this.extraPlugin();
			this.popUpExtra();
			this.searchForm();
		},

		//===== 01. Main Menu
		mianMenu() {
			// Variables
			var var_window = $(window),
				navContainer = $('.nav-container'),
				pushedWrap = $('.nav-pushed-item'),
				pushItem = $('.nav-push-item'),
				pushedHtml = pushItem.html(),
				pushBlank = '',
				navbarToggler = $('.navbar-toggler'),
				navMenu = $('.nav-menu'),
				navMenuLi = $('.nav-menu ul li'),
				closeIcon = $('.navbar-close');

			// navbar toggler
			navbarToggler.on('click', function () {
				navbarToggler.toggleClass('active');
				navMenu.toggleClass('menu-on');
			});

			// close icon
			closeIcon.on('click', function () {
				navMenu.removeClass('menu-on');
				navbarToggler.removeClass('active');
			});

			// adds toggle button to li items that have children
			navMenu.find('li a').each(function () {
				if ($(this).next().length > 0) {
					$(this)
						.parent('li')
						.append(
							'<span class="dd-trigger"><i class="fal fa-angle-down"></i></span>'
						);
				}
			});

			// expands the dropdown menu on each click
			navMenu.find('li .dd-trigger').on('click', function (e) {
				e.preventDefault();
				$(this)
					.parent('li')
					.children('ul')
					.stop(true, true)
					.slideToggle(350);
				$(this).parent('li').toggleClass('active');
			});

			// check browser width in real-time
			function breakpointCheck() {
				var windoWidth = window.innerWidth;
				if (windoWidth <= 991) {
					navContainer.addClass('breakpoint-on');

					pushedWrap.html(pushedHtml);
					pushItem.hide();
				} else {
					navContainer.removeClass('breakpoint-on');

					pushedWrap.html(pushBlank);
					pushItem.show();
				}
			}

			breakpointCheck();
			var_window.on('resize', function () {
				breakpointCheck();
			});
		},

		//===== 02. Banner Slider
		bannerSlider() {
			var bannerSliderOne = $('#bannerSlider');

			bannerSliderOne.on('init', function (e, slick) {
				var $firstAnimatingElements = $(
					'.single-banner:first-child'
				).find('[data-animation]');
				doAnimations($firstAnimatingElements);
			});

			bannerSliderOne.on('beforeChange', function (
				e,
				slick,
				currentSlide,
				nextSlide
			) {
				var $animatingElements = $(
					'.single-banner[data-slick-index="' + nextSlide + '"]'
				).find('[data-animation]');
				doAnimations($animatingElements);
			});

			// active banner slider
			bannerSliderOne.slick({
				infinite: true,
				autoplay: true,
				autoplaySpeed: 5000,
				dots: false,
				fade: true,
				arrows: false,
				prevArrow:
					'<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
				nextArrow:
					'<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
			});

			// Do for slider animation
			function doAnimations(elements) {
				var animationEndEvents =
					'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
				elements.each(function () {
					var $this = $(this);
					var $animationDelay = $this.data('delay');
					var $animationType = 'animated ' + $this.data('animation');
					$this.css({
						'animation-delay': $animationDelay,
						'-webkit-animation-delay': $animationDelay,
					});
					$this
						.addClass($animationType)
						.one(animationEndEvents, function () {
							$this.removeClass($animationType);
						});
				});
			}
		},

		//===== 03. ROOM Slider (On Home Page One)
		roomSlider() {
			var sliderImg = $('.rooms-slider-one'),
				sliderContent = $('.room-content-slider'),
				countStatus = $('.slider-count'),
				countBig = $('.slider-count-big');

			sliderImg.slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: false,
				centerMode: true,
				centerPadding: '6%',
				asNavFor: sliderContent,
				responsive: [
					{
						breakpoint: 1600,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 1,
							centerPadding: '15%',
						},
					},
				],
			});

			sliderContent.slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: true,
				asNavFor: sliderImg,
			});

			sliderContent.on('init reInit afterChange', function (
				event,
				slick,
				currentSlide,
				nextSlide
			) {
				if (!slick.$dots) {
					return;
				}
				var i = (currentSlide ? currentSlide : 0) + 1;
				var statusText = i > 10 ? i : '0' + i;
				countStatus.html(
					'<span class="current">' +
						statusText +
						'</span>/' +
						slick.$dots[0].children.length
				);
				countBig.html('<span >' + statusText + '</span> ');
			});
		},

		//===== 04. Testimonial Slider
		testimonialSlider() {
			var tslider = $('.testimonial-slider');
			tslider.slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: true,
				responsive: [
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 576,
						settings: {
							slidesToShow: 1,
						},
					},
				],
			});
		},

		//===== 05. Latest Post Slider
		latestPostlider() {
			var tslider = $('.latest-post-slider');
			var arrows = $('.latest-post-arrow');
			tslider.slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: true,
				dots: false,
				prevArrow:
					'<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
				nextArrow:
					'<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
				appendArrows: arrows,
				responsive: [
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 576,
						settings: {
							slidesToShow: 1,
						},
					},
				],
			});
		},

		//===== 06. Feature Apartment Slider
		featureApartment() {
			var fslider = $('.feature-room-slider');
			var arrows = $('.feature-room-arrow');
			fslider.slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: true,
				dots: false,
				prevArrow:
					'<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
				nextArrow:
					'<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
				appendArrows: arrows,
				responsive: [
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 576,
						settings: {
							slidesToShow: 1,
						},
					},
				],
			});
		},

		//===== 07. CounterUp
		counterToUp() {
			$('.counter-box').bind('inview', function (
				event,
				visible,
				visiblePartX,
				visiblePartY
			) {
				if (visible) {
					$(this)
						.find('.counter')
						.each(function () {
							var $this = $(this);
							$({ Counter: 0 }).animate(
								{ Counter: $this.text() },
								{
									duration: 2000,
									easing: 'swing',
									step: function () {
										$this.text(Math.ceil(this.Counter));
									},
								}
							);
						});
					$(this).unbind('inview');
				}
			});
		},

		//===== 08. Instagram Feed Slider
		instaFeedSlider() {
			var tslider = $('.instagram-slider');
			tslider.slick({
				slidesToShow: 6,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: false,
				responsive: [
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 4,
						},
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 3,
						},
					},
					{
						breakpoint: 576,
						settings: {
							slidesToShow: 2,
						},
					},
				],
			});

			// Init magnificPopup on Instagram Gallery
			$('.instagram-slider').each(function () {
				// the containers for all your galleries
				var additionalImages = $('.image a.insta-popup').not(
					'.slick-slide.slick-cloned a.insta-popup'
				);
				additionalImages.magnificPopup({
					type: 'image',
					gallery: {
						enabled: true,
					},
					mainClass: 'mfp-fade',
				});
			});
		},

		//===== 09. Food Menu SLider
		menuSlider() {
			var mslider = $('.menu-slider');
			var arrows = $('.menu-slider-arrow');
			mslider.slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: true,
				dots: false,
				prevArrow:
					'<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
				nextArrow:
					'<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
				appendArrows: arrows,
			});
		},

		//===== 10. Gallery Sliders & Popup
		gallery() {
			var gslider = $('.gallery-slider');
			gslider.slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: false,
				responsive: [
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 500,
						settings: {
							slidesToShow: 1,
						},
					},
				],
			});

			// Init magnificPopup on Menu Gallery
			$('.gallery-slider').each(function () {
				// the containers for all your galleries
				var additionalImages = $('.slick-slide a.gallery-popup').not(
					'.slick-slide.slick-cloned a.gallery-popup'
				);
				additionalImages.magnificPopup({
					type: 'image',
					gallery: {
						enabled: true,
					},
					mainClass: 'mfp-fade',
				});
			});
		},

		//===== 11. Apartment Slider Two (on Home Page Three)
		roomSliderTwo() {
			var sliderTwo = $('.rooms-slider-two');
			sliderTwo.slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: false,
				infinite: true,
				autoplay: false,
				autoplaySpeed: 4000,
				arrows: true,
				dots: false,
				centerMode: true,
				centerPadding: '28%',
				prevArrow:
					'<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
				nextArrow:
					'<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
				responsive: [
					{
						breakpoint: 1600,
						settings: {
							centerPadding: '20%',
						},
					},
					{
						breakpoint: 992,
						settings: {
							centerPadding: '15%',
						},
					},
					{
						breakpoint: 768,
						settings: {
							centerPadding: '10%',
						},
					},
					{
						breakpoint: 576,
						settings: {
							centerPadding: '5%',
						},
					},
				],
			});
		},

		//===== 12. Banner Image Slider
		bannerImgSlider() {
			var sliderOne = $('.hero-slider-one');
			sliderOne.slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: true,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows: false,
				dots: false,
			});
		},

		//===== 13. Team Slider

		teamSlider() {
			var teamSlider = $('.team-slider-one');
			teamSlider.slick({
				infinite: true,
				autoplay: false,
				arrows: false,
				dots: false,
				slidesToShow: 5,
				slidesToScroll: 2,
				responsive: [
					{
						breakpoint: 1600,
						settings: {
							slidesToShow: 4,
						},
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 3,
						},
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 2,
						},
					},
					{
						breakpoint: 576,
						settings: {
							slidesToShow: 1,
						},
					},
				],
			});
		},

		//===== 14. offCanvas Active
		offCanvas() {
			// Set Click Function For open
			$('#offCanvasBtn').on('click', function (e) {
				e.preventDefault();
				$('.offcanvas-wrapper').addClass('show-offcanvas');
				$('.offcanvas-overly').addClass('show-overly');
			});
			// Set Click Function For Close
			$('.offcanvas-close').on('click', function (e) {
				e.preventDefault();
				$('.offcanvas-overly').removeClass('show-overly');
				$('.offcanvas-wrapper').removeClass('show-offcanvas');
			});
			// Set Click Function on Overly For open on
			$('.offcanvas-overly').on('click', function (e) {
				$(this).removeClass('show-overly');
				$('.offcanvas-wrapper').removeClass('show-offcanvas');
			});
		},

		//===== 15. init extra plugin
		extraPlugin() {
			// init nice selects
			$('select').niceSelect();

			// init datepicker
			$('#arrival-date, #departure-date').datepicker({
				format: 'd-m-yyyy',
				autoclose: true,
			});

			// init wow js
			new WOW().init();

			// init isotope on features
			$('.fetaure-masonary').isotope();
		},

		//===== 16. Active Gallery And Video Popup
		popUpExtra() {
			// Init magnificPopup on Popup Video
			$('.popup-video').magnificPopup({
				type: 'iframe',
			});

			// Init magnificPopup on Gallery
			$('.gallery-loop .popup-image').magnificPopup({
				type: 'image',
				gallery: {
					enabled: true,
				},
				mainClass: 'mfp-fade',
			});
		},

		//===== 17. Search Form
		searchForm() {
			// Set Click Function For open
			$('#searchBtn').on('click', function (e) {
				e.preventDefault();
				$('.search-form').slideToggle(350);
				$(this).toggleClass('active');
			});
		},
	};

	// Document Ready
	$(document).ready(function () {
		mirandaDoc.init();
	});

	// Window Load
	$(window).on('load', function () {
		//===== 17. Preloader
		$('.preloader').fadeOut('slow', function () {
			$(this).remove();
		});

		//===== 18. Back to top
		$('#backToTop').on('click', function (e) {
			e.preventDefault();
			$('html, body').animate(
				{
					scrollTop: '0',
				},
				1200
			);
		});
	});

	// Window Scroll
	$(window).on('scroll', function () {
		//===== 19. Sticky header
		var scroll = $(window).scrollTop();
		if (scroll < 150) {
			$('.sticky-header').removeClass('sticky-active');
		} else {
			$('.sticky-header').addClass('sticky-active');
		}

		//===== 20. Scroll Event on back to top
		if (scroll > 300) $('#backToTop').addClass('active');
		if (scroll < 300) $('#backToTop').removeClass('active');
	});
})(jQuery);
