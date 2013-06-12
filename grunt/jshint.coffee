module.exports =
  options:
    jshintrc: '.jshintrc'
  all: [
    'app/scripts/{,*/}*.js',
    '!app/scripts/vendor/*',
    '!app/scripts/skrollr*',
    '!app/scripts/video.js*',
    'test/spec/{,*/}*.js'
  ]

