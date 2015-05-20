gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
sass        = require 'gulp-ruby-sass'
ect         = require 'gulp-ect'

config =
  sassPath: './css'
  bowerDir: './bower_components' 

gulp.task 'ect', () ->
  gulp.src 'src/*.ect'
      .pipe ect()
      .pipe gulp.dest('./public')

gulp.task 'coffee', () ->
  gulp.src 'js/*.coffee'
      .pipe coffee()
      .pipe gulp.dest('./public/js')

gulp.task 'vendor-css', -> 
  sass config.sassPath + '/vendors.scss',
        precision: 8
        loadPath: [
          config.bowerDir + '/bootstrap-sass-official/assets/stylesheets'
          config.bowerDir + '/fontawesome/scss'
        ]
     .pipe gulp.dest './public/css'

gulp.task 'css', -> 
  sass config.sassPath + '/style.scss',
        loadPath: [
          './css'
        ]
     .pipe gulp.dest './public/css'

gulp.task 'icons', ->
  gulp.src config.bowerDir + '/fontawesome/fonts/**.*' 
      .pipe gulp.dest './public/fonts' 


gulp.task 'build', [
  'coffee'
  'vendor-css'
  'css'
  'ect'
  'icons'
]

gulp.task 'watch', ['build'], ->
  gulp.watch 'js/*.coffee', ['coffee']
  gulp.watch 'css/*.scss', ['css']
  gulp.watch ['src/*.ect', 'src/**/*.ect'], ['ect']
