/*
Flor de Ajedrez Theme 1.0
Back-end: Daniel Cairol - dcairol@gmail.com
Front-end: Norman Ramirez - nramirezcr@gmail.com
2012
*/

jQuery(function($){
	// If document is ready, load functions
	$(document).ready(function(){
		formBehavior();
		windowBehavior();
		asideBehavior();
	});
	/*
	$(window).scroll(function(){
		var positionY = $(window).scrollTop();
		var sections = document.getElementsByTagName('section');
		$('section').each(function(){
			var section = $(this);
			var sectionTop = section.offset().top;
			var sectionBottom = sectionTop+sectionHght;
			if (positionY > sectionTop && positionY <= sectionBottom) {
				section.find('.mainPict').animate({
					'marginRight':'0',
					'opacity':'1'
				}, 1000, 'swing');
				$(this).dequeue();
			}
		});
		
		
		
		
	//	if(positionY <= )
		
	//	var sectionTop = $(sections[i]).offset().top;
	/*	var sectionBottom = sectionTop+sectionHght;
		alert('top: ' + sectionTop + ' || bottom:' + sectionBottom);
		if (positionY > sectionTop && positionY <= sectionBottom) {
			$('#wrapper').append('<span>Cool</span>');
			sections[i].find('.mainPict').delay(500).animate({
				'marginRight':'0',
				'opacity':'1'
			}, 1000, 'swing');
			$(this).dequeue();
		}
	});
	*/
	
	// Window Behavior Function
	function windowBehavior(){
		var windowScroll = $('body, html');
		$('#header').delegate('.navLink', 'click', function(e){
			e.preventDefault();
			var linkToGo = $(this).attr('href');
			var topPos = $(linkToGo).offset();
			$(windowScroll).stop().animate({
				scrollTop: topPos.top
			}, 2000, 'swing');
		});
		
		/*.queue(function(){
				$(linkToGo).find('.mainPict').delay(500).animate({
					'marginRight':'0',
					'opacity':'1'
				}, 1000, 'swing');
				$(this).dequeue();
			})*/
	}
	
	// Aside Behavior Function
	function asideBehavior(){
		var disableAside = true;
		var displayToolTip = false;
		var aside = $('#asideWrapper');
		var asideSize = asideSizeValue();
		function asideSizeValue(){
			return asideSize = (aside.hasClass('active')) ? 1.5 : 15;
		}
		
		// Tooltip Function
		$('.icon').each(function(e){
			var currentCont = $(this);
			var toolTipOb = currentCont.find('.toolTip');
			currentCont.bind('mouseenter mouseleave', function(){
				if (!$('#asideWrapper').hasClass('active')){
					toolTipOb.toggle();
				}
			});
			
			// Forms Function
			currentCont.bind('click', function(){
				asideSizeValue();
				var icon = $(this);
				var iconLink = icon.find('a');
				var formId = iconLink.attr('href');
				var formContainer = $(formId);
				displayToolTip = true;
				$('.icon').find('.toolTip').hide();
				$(this).find('.toolTip').show();
				if (!aside.hasClass('active')){
					// If aside is inactive
					disableAside = false;
					$('body, html').stop();
					icon.addClass('active');
					formContainer.addClass('active');
					$('article, hgroup').animate({
						'opacity':'0.125'
					}, 100, 'swing');
					$('#mainContainer, #footerWrapper').animate({
						'margin-right': (asideSize - 1.5) + 'em'
					}, 750, 'swing');
					aside.addClass('active').animate({
						'width': asideSize + 'em'
					}, 750, 'swing', function(){
						$('.closeAside').slideDown(500);
						formContainer.slideDown(500);
					});
				} else {
					// else, if aside is active
					$('.icon').removeClass('active');
					icon.addClass('active');
					$('form').not(formId).removeClass('active').slideUp(500, function(){
						$(this).removeAttr('style');
					});
					formContainer.addClass('active').slideDown(500);
				}
				return false;
			});
		});
		
		// Close Aside Function
		function closeAside(){
			if (!disableAside){
				disableAside = true;
				displayToolTip = false;
				asideSizeValue();
				// stop() stops the current function
				$('article, hgroup').clearQueue().animate({
					'opacity':'1'
				}, 100, 'swing', function(){
					$(this).removeAttr('style');
				});
				$('form').removeClass('active').clearQueue().slideUp(250, function(){
					$(this).removeAttr('style');
				});
				$('.icon').removeClass('active').find('.toolTip').clearQueue().hide(function(){
					$(this).removeAttr('style');
				});
				$('.closeAside').clearQueue().slideUp(250, function(){
					$(this).removeAttr('style');
				});
				$('#mainContainer, #footerWrapper').clearQueue().animate({
					'margin-right': (asideSize - 1.5) + 'em'
				}, 250, 'linear', function(){
					$(this).removeAttr('style');
				});
				aside.removeClass('active').clearQueue().animate({
					'width': asideSize + 'em'
				}, 250, 'linear', function(){
					$(this).removeAttr('style');
				});
			}
			return false;
		}
		
		// if window is on scroll or .closeAside, #mainContainer, header, footer is on click, run closeAside()
		$(window).delegate('.closeAside, #mainContainer, header, footer', 'click', closeAside).scroll(closeAside);
	}
	
	// This is a temporal behavior, please change to make validation
	function formBehavior(){
		$('form').each(function(){
			$(this).submit(function(){
				var required = $(this).find('.required');
				required.each(function(){
					if ($(this).val() == ''){
						$(this).effect('shake', {
							direction: 'right',
							times: 2,
							distance: 5
						}, 100).addClass('uncorrect');
					} else {
						$(this).removeClass('uncorrect');
					}
				});
			});
		});
	}
});
