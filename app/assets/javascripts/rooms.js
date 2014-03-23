var Colchonet = Colchonet || {};

Colchonet.Rooms = {
	init: function() {
		this.Reviews.init();
	},
};

Colchonet.Rooms.Reviews = {
	init: function() {
		this.review = $('.review');
		this.setAjaxCallbacks();
		this.setReviews();
	},
	setAjaxCallbacks: function() {
		var self = this;

		this.review.on('ajax:beforeSend', function() {
			$(this).find('input').attr('disabled', true);
		});

		this.review.on('ajax:error', function() {
			self.replaceButton(this, 'fa fa-times', '#b94a48');
		});

		this.review.on('ajax:success', function() {
			self.replaceButton(this, 'fa fa-check', '#468847');
		});
	},
	setReviews: function() {
		var self = this;
		var defaultInputs = this.review.find('input:checked + label');
		var stars = this.review.find('input:enabled ~ label');
		
		this.highlightStars(defaultInputs);
		
		stars.on('mouseenter', function() {
			self.highlightStars($(this));
		});

		stars.on('mouseleave', function() {
			self.highlightStars(defaultInputs);
		});

		this.review.find('input').on('change', function() {
			stars.off('mouseenter').off('mouseleave').off('click');
			$(this).parent('form').submit();
		});
	},
	replaceButton: function ( container, icon_class, color ) {
		$(container).find('input:submit')
			.replaceWith(
				$('<i/>')
					.addClass(icon_class)
					.css('color', color)
			);
	},
	highlightStars: function ( elem ) {
		elem.parent().children('label').removeClass('toggled');
		elem.addClass('toggled').prevAll('label').addClass('toggled');
	}
};

$(function() { Colchonet.Rooms.init();  });
