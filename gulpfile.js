'use strict';

var gulp = require('gulp');

var less = require('gulp-less');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var imagemin = require('gulp-imagemin');
var browserSync = require('browser-sync');
var reload      = browserSync.reload;

var paths = {
  less: 'src/less/style.less',
  scripts: 'src/js/**/*',
  images: 'src/img/**/*',
  html: 'src/*.html'
};

gulp.task('scripts', function() {
  return gulp.src(paths.scripts)
    .pipe(concat('main.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('dist/js'))
    .pipe(reload({ stream: true }));
});

gulp.task('html', function() {
  return gulp.src(paths.html)
    .pipe(gulp.dest('dist'))
    .pipe(reload({ stream: true }));
});

// Copy all static images
gulp.task('images', function() {
  return gulp.src(paths.images)
    // Pass in options to the task
    .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest('dist/img'))
    .pipe(reload({ stream: true }));
});

gulp.task('less', function() {
  return gulp.src(paths.less)
    // Pass in options to the task
    .pipe(less())
    .pipe(gulp.dest('dist/css'))
    .pipe(reload({ stream: true }));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  browserSync({
    server: {
      baseDir: 'dist'
    }
  });

  gulp.watch(paths.less, ['less']);
  gulp.watch(paths.html, ['html']);
  gulp.watch(paths.images, ['images']);
  gulp.watch(paths.scripts, ['scripts']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'less', 'html', 'scripts', 'images']);
