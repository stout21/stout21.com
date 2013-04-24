(function (skrollr, _V_) {
  var skrl, w, h;
  var $w = $(window).on('resize', onResize);
  var player = _V_('the-video');

  skrollr.menu.init(skrl, {
    animate: true,
    duration: 500,
    easing: 'swing'
  });

  console.log(player);

  window.skrl = skrl;

  $('a[href=#play-video]').on('click', function(e) {
    e.preventDefault();
    player.play();
  });

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
    console.log('play event');

    $('#video')
      .removeClass('isPaused')
      .addClass('isPlaying');

    $w.on('scroll', throttle(onScroll, 100));
  });
  player.addEvent('pause', function () {
    $('#video')
      .removeClass('isPlaying')
      .addClass('isPaused');
  });

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
    var CONSTANTS = {
      applePie: $('.flavorApplePie').offset().top,
      margarita: $('.flavorMargarita').offset().top,
      royalFlush: $('.flavorRoyalFlush').offset().top,
      screwdriver: $('.flavorScrewdriver').offset().top
    };

    skrl = skrollr.init({
      constants: CONSTANTS
    });

    setTimeout(function() {
      onResize();
    }, 300);
  });

})(window.skrollr, window._V_);
