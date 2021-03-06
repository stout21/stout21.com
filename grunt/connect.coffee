LIVERELOAD_PORT = require('./livereloadPort')
mountFolder = (connect, dir) ->
  return connect.static(require('path').resolve(dir))

lrSnippet = require('connect-livereload')({ port: LIVERELOAD_PORT })

module.exports =
  options:
    port: 9000,
    # change this to '0.0.0.0' to access the server from outside
    hostname: '0.0.0.0'
  livereload:
    options:
      middleware: (connect) ->
        [
          mountFolder(connect, '.tmp')
          mountFolder(connect, 'app')
          lrSnippet
        ]
  test:
    options:
      middleware: (connect) ->
        [
          mountFolder(connect, '.tmp')
          mountFolder(connect, 'test')
        ]
  dist:
    options:
      middleware: (connect) ->
        [
          mountFolder(connect, 'dist')
        ]


