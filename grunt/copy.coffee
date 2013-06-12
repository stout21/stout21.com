module.exports =
  dist:
    files: [{
      expand: true,
      dot: true,
      cwd: 'app',
      dest: 'dist',
      src: [
        '*.{ico,txt}',
        '.htaccess',
        'images/{,*/}*.{webp,gif,jpg,jpeg,png}',
        'styles/fonts/*'
      ]
    }, {
      expand: true,
      cwd: '.tmp/images',
      dest: 'dist/images',
      src: [
        'generated/*'
      ]
    }]

