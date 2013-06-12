module.exports =
  build:
    auth:
      host: 'stout21.com',
      port: 21,
      authKey: 'ftp'
    src: require('path').resolve('dist')
    dest: ''
    exclusions: ['*video*']

