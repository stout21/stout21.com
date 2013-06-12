module.exports =

  # files options for local targets
  localFiles: [{
      expand: true,
      cwd: '<%= yeoman.app %>'
      src: '{,*/}*.jade'
      dest: '<%= yeoman.tmp %>'
      ext: '.html'
    }]

  # files options for remote targets
  distFiles: [{
      expand: true,
      cwd: '<%= yeoman.app %>'
      src: '*.jade'
      dest: '<%= yeoman.dist %>'
      ext: '.html'
    }]

  #default options
  options:
    data:
      assetsRoot: '/'

  #production target
  production:
    files: '<%= jade.distFiles %>'

  # local target used with grunt server
  compile:
    options:
      data:
        assetsRoot: '/'
    files: '<%= jade.localFiles %>'

