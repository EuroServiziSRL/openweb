/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
console.log('Hello World from Webpacker!')
//import {} from 'jquery'
//import {} from 'jquery-ujs'
//inizializzo jquery
import $ from 'jquery'
global.$ = $
global.jQuery = $
//inizializzo jquery-ujs
import Rails from 'rails-ujs'
Rails.start()

console.log('Hello World from Webpacker! Ready for React!');

import React from 'react';
import { render } from 'react-dom';
import SampleComponent from '../components/SampleComponent';

$(document).ready(function(){
  const container = $("<div>");
  $("body").append(container);
  render(<SampleComponent/>, container[0]);
});