# Generated on 2013-06-05 using generator-webapp 0.2.2
'use strict'

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
  # load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  # configurable paths
  yeomanConfig =
    app: 'app'
    dist: 'dist'
    tmp: '.tmp'

  grunt.initConfig({
    yeoman: yeomanConfig

    mocha:
      all:
        options:
          run: true,
          urls: ['http://localhost:<%= connect.options.port %>/index.html']

    # not used since Uglify task does concat, but still available if needed
    #concat: { dist: {} },
    # not enabled since usemin task does concat and uglify
    # check index.html to edit your build targets
    # enable this task if you prefer defining your build targets here
    uglify:
      dist: {}
    rev:
      dist:
        files:
          src: [
            '<%= yeoman.dist %>/scripts/{,*/}*.js',
            '<%= yeoman.dist %>/styles/{,*/}*.css',
            '<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp}',
            '<%= yeoman.dist %>/styles/fonts/*'
          ]
    useminPrepare:
      options:
        dest: '<%= yeoman.dist %>'
      html: '<%= yeoman.app %>/index.html'
    usemin:
      options:
        dirs: ['<%= yeoman.dist %>']
      html: ['<%= yeoman.dist %>/{,*/}*.html'],
      css: ['<%= yeoman.dist %>/styles/{,*/}*.css']
    imagemin:
      dist:
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.{png,jpg,jpeg}',
          dest: '<%= yeoman.dist %>/images'
        }]
    svgmin:
      dist:
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.svg',
          dest: '<%= yeoman.dist %>/images'
        }]
    concurrent:
      server: [
        'coffee:dist',
        'stylus:server'
      ],
      test: [
        'coffee',
        'stylus'
      ],
      dist: [
        'coffee',
        'stylus:dist',
        'imagemin',
        'svgmin'
      ]

    copy: require('./grunt/copy')
    coffee: require('./grunt/coffee')
    connect: require('./grunt/connect')
    clean: require('./grunt/clean')
    jshint: require('./grunt/jshint')
    open: require('./grunt/open')
    watch: require('./grunt/watch')

    jade: require('./grunt/jade')
    stylus: require('./grunt/stylus')

  })

  grunt.registerTask 'server', (target) ->
    return grunt.task.run(['build', 'open', 'connect:dist:keepalive']) if (target == 'dist')

    grunt.task.run([
      'clean:server',
      'jade:compile',
      'stylus:compile',
      'connect:livereload',
      'open',
      'watch'
    ])

  grunt.registerTask 'test', [
      'clean:server',
      'concurrent:test',
      'connect:test',
      'mocha'
    ]

  grunt.registerTask 'build', [
      'clean:dist',
      'useminPrepare',
      'concurrent:dist',
      #'concat',
      'uglify',
      'copy',
      'rev',
      'usemin'
    ]

  grunt.registerTask 'default', [
      'jshint',
      'test',
      'build'
    ]

