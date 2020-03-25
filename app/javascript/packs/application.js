/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

//= require filterrific/filterrific-jquery

import 'bootstrap';
import 'jsonwebtoken';

//inizializzo jquery-ujs
import Rails from 'rails-ujs';
Rails.start();


//import SampleComponent from '../components/SampleComponent';


/* importo application degli engines */
import '../../../engines/wiki_hd/app/assets/javascripts/packs/application_wikihd'


var jwt = require('jsonwebtoken');
const uuidv1 = require('uuid/v1');
var sha256 = require('js-sha256').sha256;

/* crea il token jwt, passo il nome del db per creare il clientid  */
function jwt_token(nome_db) {
    //var now = new Date.now();
    //var exp_date = now.addHours(2); // 2 ore
    var now = new Date().getTime();
    var actualTimeInSeconds = new Date().getTime()/1000;
    //1 hour from now, 60minuti * 60sec
    var exp_date = (now + 60 * 60 * 1000)/1000;
    var jti = uuidv1(); /* stringa alfanumerica random  */
    var client_id = sha256(nome_db+jti) /* sha256 del nome del db e del jti  */
    var payload = {
      iss: 'auth_hub',
      iat: actualTimeInSeconds, //secondi
      exp: exp_date, //secondi
      jti: jti,
      client_id: client_id
    };
    var secret = $("#scrt").attr('data');
    
    var jwt_token = jwt.sign(payload, secret );
    return "Bearer " + jwt_token;
}


$(document).ready(function() {
  
  $(".dropdown-toggle").dropdown();
  
  /* faccio il submit del form al click su aggiorna enti  */
  $("#cliente_id").on("change",function(){
    $(".form_cambio_ente").submit();
  })
  
  /* Invio richiesta per restart ai portali dei vari enti */
  $("#restart").on('click',function(){
    let esito = confirm("Vuoi riavviare il sito ed applicare le nuove impostazioni?")
    if(esito){
      //recupero le info da un campo nascosto
      var dati_ente = $('#tag_dati_ente').data();
      // $.get(, function( data_res ) {
      //   $(".result" ).html( data_res );
      //   alert( "Load was performed." );
      // });
      $.ajax
        ({
          type: "GET",
          url: "https://"+dati_ente['urlEnte']+"/portal/api/rstapp",
          dataType: 'json',
          crossDomain: true,
          xhrFields: {
            //withCredentials: true
          },
          contentType: "application/json",
          //async: false,
          // data: {   //questi sono i dati passati in get
          //   'name': 'test123456',
          //   'description': 'test'
          // },
          //cache : true,
          //caso richiesta in preflight mode
          beforeSend: function (xhr){ 
              xhr.setRequestHeader('Authorization', jwt_token(dati_ente['nomeDb']));
              xhr.setRequestHeader("Access-Control-Allow-Origin",'*');
              xhr.setRequestHeader("Access-Control-Allow-Methods","POST, GET, OPTIONS, PUT, DELETE");
              xhr.setRequestHeader("Access-Control-Allow-Credentials","true");
              xhr.setRequestHeader("Access-Control-Allow-Headers","Content-Type");
          },
          success: function (res){
            if(res['esito'] == 'ok'){
              alert('Riavviato!'); 
            }else{
              alert('Problemi nel riavvio.');
            }
              
          }
      });  /* Fine chiamata ajax */ 
    }
  });
  
  /* Invio richiesta per aggiornare clienti */
  $("#agg_clienti").on('click',function(event){
    event.preventDefault();
    let esito = confirm("Vuoi aggiornare la lista dei clienti?");
    let url_assoluto = window.origin+"/auth_hub/aggiorna_clienti"
    console.log("esito confirm");
    console.log(esito);
    if(esito){
      Rails.ajax({
        type: "GET", 
        url: url_assoluto,
        data: {},
        success: function(response){
          if(response['stato'] == 'ok'){
            $("#corpo_centrale").prepend("<div id='msg_esito_agg_clienti' class='alert alert-success'>Aggiornamento clienti effettuato.</div>");
          }else{
            $("#corpo_centrale").prepend("<div id='msg_esito_agg_clienti' class='alert alert-danger'>Errore nell'aggiornamento!</div>");
          }
          setTimeout(function(){
            $("#msg_esito_agg_clienti").remove();
          }, 3000);
        },
        error: function(response){
          $("#corpo_centrale").prepend("<div id='msg_esito_agg_clienti' class='alert alert-danger'>Errore nell'aggiornamento!</div>");
          setTimeout(function(){
            $("#msg_esito_agg_clienti").remove();
          }, 3000);
          console.log(response);
          $("#msg_esito_agg_clienti").remove();
        }
      })
    }
  });


  /* Controllo sintassi yaml con libreria yaml https://github.com/jeremyfa/yaml.js/ */
  $("#valore_yaml_conf").on("keyup",function(event){
    $("#msg_errore_yaml").addClass('hide');
    let yaml_str = $(this).val();
    try {
      let tipo_dato = YAML.parse($("#valore_yaml_conf").val()).constructor.name;
      console.log(tipo_dato);
    } catch (error) {
      $("#msg_errore_yaml").removeClass('hide');
      console.log("Problemi!");
    }
  });
  
  
  
  
}); //fine ready

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