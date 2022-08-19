// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start()
require('@rails/activestorage').start()
require('channels')
require('bootstrap')

window.jQuery = window.$ = require('jquery')

var Turbolinks = require('turbolinks');
Turbolinks.start();

import I18n from 'i18n-js'
window.I18n = I18n

import check_micropost_image from './micropost'
check_micropost_image
