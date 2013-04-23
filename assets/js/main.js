(function (skrollr, _V_) {
  var skrl;

  skrollr.menu.init(skrl, {
    animate: true,
    duration: 500,
    easing: 'swing'
  });

  $(function() {
    var CONSTANTS = {
      applePie: $('.flavorApplePie').offset().top,
      margarita: $('.flavorMargarita').offset().top,
      royalFlush: $('.flavorRoyalFlush').offset().top,
      screwdriver: $('.flavorScrewdriver').offset().top
    };
    console.log(CONSTANTS);

    skrl = skrollr.init({
      constants: CONSTANTS
    });
  });

  var player = _V_('the-video');
  console.log(player);

  window.skrl = skrl;

  var $w = $(window).on('resize', onResize),
      w, h;

  $('a[href=#play-video]').on('click', function(e) {
    e.preventDefault();
    player.play();
  });

  function onResize() {
    w = $w.width();
    h = $w.height();
    setDimensions();
  }

  player.ready(function () {
    //player = this;
  });

  player.addEvent('play', function () {
    $('#video')
      .removeClass('isPaused')
      .addClass('isPlaying');
  });
  player.addEvent('pause', function () {
    $('#video')
      .removeClass('isPlaying')
      .addClass('isPaused');
  });


  function setDimensions() {
    $('#video').height(h);
  }

  onResize();

})(window.skrollr, window._V_);
