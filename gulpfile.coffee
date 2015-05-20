gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
sass        = require 'gulp-ruby-sass'
ect         = require 'gulp-ect'

config =
  sassPath: './css'
  bowerDir: './bower_components' 
  bootstrapPath: './bower_components/bootstrap-sass-official/assets' 

gulp.task 'ect', ->
  gulp.src 'src/*.ect'
      .pipe ect()
      .pipe gulp.dest './public'

gulp.task 'coffee', ->
  gulp.src 'js/*.coffee'
      .pipe coffee()
      .pipe gulp.dest './public/js'

gulp.task 'vendor-css', -> 
  sass config.sassPath + '/vendors.scss',
        container: 'gulp-ruby-sass-vendor-css'
        precision: 8
        loadPath: [
          config.bootstrapPath + '/stylesheets'
          config.bowerDir + '/fontawesome/scss'
        ]
     .pipe gulp.dest './public/css'

gulp.task 'css', -> 
  sass config.sassPath + '/style.scss',
        container: 'gulp-ruby-sass-css'
        loadPath: [
          './css'
        ]
     .pipe gulp.dest './public/css'

gulp.task 'vendor-js', ->
  gulp.src [
        config.bootstrapPath + '/javascripts/bootstrap.min.js',
        config.bowerDir + '/jquery/dist/jquery.min.js'
      ]
      .pipe gulp.dest './public/js/'

gulp.task 'icons', ->
  gulp.src config.bowerDir + '/fontawesome/fonts/**.*' 
      .pipe gulp.dest './public/fonts' 


gulp.task 'build', [
  'coffee'
  'css'
  'vendor-js'
  'vendor-css'
  'ect'
  'icons'
]

gulp.task 'watch', ['build'], ->
  gulp.watch 'js/*.coffee', ['coffee']
  gulp.watch 'css/*.scss', ['css']
  gulp.watch ['src/*.ect', 'src/**/*.ect'], ['ect']
