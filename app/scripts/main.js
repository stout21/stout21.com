(function (skrollr, _V_) {
  function noop(){}
  if (typeof sessionStorage === 'undefined')
    window.sessionStorage = { setItem: noop, getItem: noop };

  var AGE_KEY = 'age-verified';
  var OLD_ENOUGH = '1';
  var skrl, w, h;
  var $w = $(window).on('resize', onResize);
  var player = _V_('the-video');

  $('a[href=#play-video]').on('tap', function(e) {
    e.preventDefault();
    player.play();
  });

  if (sessionStorage.getItem(AGE_KEY) === OLD_ENOUGH)
    $(function() { startup(); setTimeout(startup, 2500); });
  else {
    $('#how-old-you-be').on('tap', 'button', function() {
      if ($(this).hasClass('btn-confirm')) startup();
      else soonYoungPadawan();
    });
  }

  function startup() {
    sessionStorage.setItem(AGE_KEY, OLD_ENOUGH);
    if (w > 560) {
      $('html').removeClass('isFlat');

      skrl = skrollr.init();

      skrollr.menu.init(skrl, {
        animate: true,
        duration: 500,
        easing: 'swing'
      });
    }
    else $('html').addClass('isFlat');

    $('#how-old-you-be').fadeOut();
    $('#video').removeClass('isHidden');
    $('.no-scrolling').removeClass('no-scrolling');
  }

  function soonYoungPadawan() {
    $('#wrapper')
      .css({ background: 'url(/images/home.png) no-repeat', 'background-size': '100% 100%', height: w })
      .children().not('#how-old-you-be').remove();
    $('#how-old-you-be button').remove();
    $('#how-old-you-be').append('<p>Sorry, you must be at least 21 years of age to view this site.</p>');
  }

  function onResize() {
    w = $w.width();
    h = $w.height();
    setDimensions();
  }

  var $about = $('#about');
  function onScroll() {
    var offsetTop = $about.offset().top;
    var currentScroll = $w.scrollTop();
    if (currentScroll >= offsetTop) {
      player.pause();
      $w.off('scroll');
    }
  }

  // player.ready(function () { player = this; });

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
    $('#find-us').height(h * 0.65);
    $('#map-locations-list').height(h * 0.65);
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
