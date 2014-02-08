flavorsSection = (() ->
  attrs = ['data-top="background-color:#000000"']
  colors = [ '#cb232f', '#bdc86e', '#da4c32', '#dfac40' ]
  [0,1,2,3].forEach (i) ->
    pixel1 = i * 2000 + 300
    pixel2 = pixel1 + 1300
    color = colors[i]
    animationStart = (i - 1) * 2000 + 300
    animationIn = animationStart + 300
    animationEnd = animationIn + 1000
    attrs.push "data--#{ pixel1 }-top=\"background-color:#{ color }\""
    attrs.push "data--#{ pixel2 }-top=\"background-color:#{ color }\""

  "<section id=\"flavors\" #{ attrs.join(' ') } style=\"height:8714px;background-color:#cb232f;\">"
)()

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
      src: 'index.jade'
      dest: '<%= yeoman.dist %>'
      ext: '.html'
    }]

  #production target
  build:
    files: '<%= jade.distFiles %>'
    options:
      data:
        env: 'production'
        flavorsSection: flavorsSection

  # local target used with grunt server
  compile:
    options:
      data:
        assetsRoot: '/'
        env: 'development'
        flavorsSection: flavorsSection

    files: '<%= jade.localFiles %>'

