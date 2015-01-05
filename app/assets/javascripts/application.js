// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require_tree .


function createSidebarLi(json){
  return ("<li><a>" + json.name + "</a></li>");
};

function bindLiToMarker($li, marker){
  $li.on('click', function(){
    handler.getMap().setZoom(14);
    marker.setMap(handler.getMap()); //because clusterer removes map property from marker
    marker.panTo();
    google.maps.event.trigger(marker.getServiceObject(), 'click');
  })
};

function createSidebar(json_array){
  _.each(json_array, function(json){
    var $li = $( createSidebarLi(json) );
    $li.appendTo('#sidebar_container');
    bindLiToMarker($li, json.marker);
  });
};

handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'sidebar_builder'}}, function(){
  var json_array = [
    { lat: 40, lng: -80, name: 'Foo', infowindow: "I'm Foo" },
    { lat: 45, lng: -90, name: 'Bar', infowindow: "I'm Bar" },
    { lat: 50, lng: -85, name: 'Baz', infowindow: "I'm Baz" }
  ];

  var markers = handler.addMarkers(json_array);

  _.each(json_array, function(json, index){
    json.marker = markers[index];
  });

  createSidebar(json_array);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});
   