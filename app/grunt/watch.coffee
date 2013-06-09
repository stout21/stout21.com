module.exports =
  options:
    nospawn: true
  coffee:
    files: ['<%= yeoman.app %>/scripts/{,*/}*.coffee']
    tasks: ['coffee:dist']
  coffeeTest:
    files: ['test/spec/{,*/}*.coffee']
    tasks: ['coffee:test']
  stylus:
    files: ['<%= yeoman.app %>/styles/{,*/}*.styl']
    tasks: ['stylus:compile']
  jade:
    files: ['<%= yeoman.app %>/{,*/}*.jade']
    tasks: ['jade:compile']
  livereload:
    options:
      livereload: require('./livereloadPort')
    files: [
      '{.tmp,<%= yeoman.app %>}/*.html'
      '{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css'
      '{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js'
      '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
    ]

