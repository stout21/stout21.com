(function (skrollr, _V_) {
  var skrl, w, h;
  var $w = $(window).on('resize', onResize);
  var player = _V_('the-video');

  $('a[href=#play-video]').on('tap', function(e) {
    e.preventDefault();
    player.play();
  });

  $('#how-old-you-be').one('tap', 'button', function(e) {
    if ($(this).hasClass('btn-confirm')) startup();
    else soonYoungPadawan();
  });

  function startup() {
    if (w > 560) {
      skrl = skrollr.init();

      skrollr.menu.init(skrl, {
        animate: true,
        duration: 500,
        easing: 'swing'
      });
    }
    else {
      $('html').addClass('isFlat');
    }

    $('#how-old-you-be').fadeOut();
    $('#video').removeClass('isHidden');
    $('.no-scrolling').removeClass('no-scrolling');
  }

  function soonYoungPadawan() {
    $('#wrapper').children().not('#how-old-you-be').remove();
    $('#wrapper').css({ background: 'url(/images/home.png) no-repeat', 'background-size': '100% 100%', height: w });
    $('#how-old-you-be button').remove();
    $('#how-old-you-be').append('<p>Sorry, you must be at least 21 years of age to view this site.</p>');
  }

  function onResize() {
    w = $w.width();
    h = $w.height();
    setDimensions();
  }

  function onScroll() {
    var offsetTop = $('#about').offset().top;
    var currentScroll = $w.scrollTop();
    if (currentScroll >= offsetTop) {
      player.pause();
      $w.off('scroll');
    }
  }

  player.ready(function () {
    //player = this;
  });

  player.addEvent('play', function () {
    $('#video')
      .removeClass('isPaused')
      .addClass('isPlaying');

    $w.on('scroll', throttle(onScroll, 100));
  });
  player.addEvent('pause', onStop);
  player.addEvent('ended', onStop);

  player.addEvent('play', trackPlayStart);
  player.addEvent('ended', trackPlayEnd);

  function onStop() {
    $('#video')
      .removeClass('isPlaying')
      .addClass('isPaused');

    this.el.querySelector('.vjs-poster').style.display = '';
  }

  function setDimensions() {
    $('#video').height(h);
  }

  function throttle(fn, time) {
    var timeout;
    return function () {
      if (timeout) return;

      timeout = setTimeout(function () {
        fn();
        timeout = null;
      }, time);
    };
  }


  $(function() {
    setTimeout(function() {
      onResize();
    }, 1000);
  });

  function trackPlayStart() {
    _gaq.push(['_trackEvent', 'Promo Video', 'Play']);
  }

  function trackPlayEnd() {
    _gaq.push(['_trackEvent', 'Promo Video', 'Complete']);
  }

})(window.skrollr, window._V_);
