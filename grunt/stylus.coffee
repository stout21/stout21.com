module.exports =
  compile:
    files:
      '<%= yeoman.tmp %>/styles/main.css': '<%= yeoman.app %>/styles/main.styl'
    options:
      paths: ['app/styles'],
      use: [
        require('nib') # use stylus plugin at compile time
      ],
      #urlfunc: 'embedurl', # use embedurl('test.png') in our code to trigger Data URI embedding
      #import: [    #  @import 'foo', 'bar/moo', etc. into every .styl file
      #  'foo',     #  that is compiled. These might be findable based on values you gave
      #  'bar/moo'  #  to `paths`, or a plugin you added under `use`
      #]
  dist:
    files:
      '<%= yeoman.dist %>/styles/main.css': '<%= yeoman.app %>/styles/main.styl'

