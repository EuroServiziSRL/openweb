/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

//= require filterrific/filterrific-jquery

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

// carico tutti i js installati via yarn

// import {} from 'modernizr' // va in errore alla compilazione

// import {} from 'fastclick'
// import {} from 'jquery-slimscroll'
// import {} from 'wowjs'
// import {} from 'jquery.nicescroll'
// import {} from 'jquery.scrollto'
// import {} from 'switchery'
// import {} from 'jquery-circliful'
// import {} from 'jquery-sparkline'

// import {} from 'detect/lib/tree-walk'
// import {} from 'counterup/jquery.counterup'
// import {} from 'jquery-waypoints/waypoints'
// import {} from 'jquery-dashboard/dist/jquery.dashboard.core'
// import {} from 'jquery-dashboard/dist/jquery.dashboard.jqueryui'
// import {} from 'waves/dist/waves'

var resizefunc = [];
$(document).ready(function() {
  
  /* Nascondo barra caricatore
  const container = $("<div>");
  $(".card-box").append(container);
  render(<SampleComponent/>, container[0]);
  
  $('.counter').counterUp({
      delay: 100,
      time: 1200
  });
  $('.circliful-chart').circliful();
  */
  /* console.log("initialize dropdown"); */
  $(".dropdown-toggle").dropdown();
  
  /* faccio il submit del form al click su aggiorna enti  */
  $("#cliente_id").on("change",function(){
    $(".form_cambio_ente").submit();
  })
  
});

// BEGIN SVG WEATHER ICON
if (typeof Skycons !== 'undefined'){
var icons = new Skycons(
    {"color": "#3bafda"},
    {"resizeClear": true}
    ),
	list  = [
	    "clear-day", "clear-night", "partly-cloudy-day",
	    "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
	    "fog"
	],
	i;

    for(i = list.length; i--; )
    icons.set(list[i], list[i]);
    icons.play();
};