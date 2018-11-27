function initMap() {
  var uluru = {lat, lng};
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: uluru
  });

    var marker = new google.maps.Marker({
        position: uluru,
        map: map
      });

  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('right-panel'));

   var control = document.getElementById('floating-panel');
   console.log("Err pos 1");
   control.style.display = 'block';
   console.log("Err pos 2");
   map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };
  document.getElementById('start').addEventListener('change', onChangeHandler);
  document.getElementById('end').addEventListener('change', onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  directionsService.route({
    origin: document.getElementById('start').value,
    destination: document.getElementById('end').value,
    travelMode: 'DRIVING'
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}
