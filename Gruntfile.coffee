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
      dist:
        files:
          'dist/main.js': [
            "app/bower_components/jquery/jquery.js"
            #"app/bower_components/skrollr/src/skrollr.js"
            #"app/bower_components/video.js/video.js"
            "app/scripts/vendor/jquery.tap.js"
            "app/scripts/vendor/video.js"
            "app/scripts/vendor/skrollr.js"
            "app/scripts/vendor/skrollr.menu.js"
            "app/scripts/main.js"
            "app/scripts/map.js"
          ]
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
      html: '<%= yeoman.dist %>/index.html'
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
          src: '{,*/}*.{png,jpg,jpeg,webp}',
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
        'uglify',
        'coffee',
        'stylus:dist',
        #'imagemin',
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
    'ftp-deploy': require('./grunt/ftp')

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
      'jade:build',
      #'useminPrepare',
      'concurrent:dist',
      #'concat',
      'copy',
      #'rev',
      #'usemin'
    ]

  grunt.registerTask 'default', [
      'jshint',
      'test',
      'build'
    ]

  grunt.registerTask 'deploy', [
      'build',
      'ftp-deploy'
    ]
