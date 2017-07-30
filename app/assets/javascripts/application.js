// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

window.initMap = function() {
  initPublicMap();
};

window.initPublicMap = function() {
  if($("#map-for-public").length > 0) {
  sharedPublicPlaces = JSON.parse(publicPlaces)
  position = {lat: sharedPublicPlaces[0].latitude, lng: sharedPublicPlaces[0].longitude};
  var map = new google.maps.Map(document.getElementById('map-for-public'), {
    zoom: 4,
    center:position
  });

  var infoWindow = new google.maps.InfoWindow();

  $.each(sharedPublicPlaces, function(i, place) {
    var content = ("<p>" + place.address);
    if(place.public == true) {
      content = content + " With Public. </p>";
    }else if(currentUserId && place.friend_id == currentUserId) {
      content = content + " With Me. </p>"
    }else {
      content = content + " With Friends. </p>";
    }

    var marker = new google.maps.Marker({
      position: {lat: place.latitude, lng: place.longitude},
      map: map
    });

    marker.addListener('click', function() {
      infoWindow.setContent(content);
      infoWindow.open(map, marker);
    });
  });
}
}

$(document).on("change", "#new_shared_place input[type='radio']", function() {
  if($("#share_via_friend").is(":checked")) {
    $("#friend-list").removeClass("hide");
  } else {
    $("#friend-list").addClass("hide");
  }
});
