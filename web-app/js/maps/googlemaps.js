
	google.maps.visualRefresh = true;

	var map;
	function initialize() {
	  var mapOptions = {
	    zoom: 11,
	    minZoom: 8,
	    maxZoom: 17,
	    center: new google.maps.LatLng(51.5077, -0.126),
	    panControl: false,
	    zoomControl: true,
	    mapTypeControl: false,
	    scaleControl: false,
	    streetViewControl: false,
	    overviewMapControl: false,

	    mapTypeId: google.maps.MapTypeId.ROADMAP
	    
	  };
	  mymap = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
	  
      // Bounds for UK
	  var strictBounds = new google.maps.LatLngBounds(
			  new google.maps.LatLng(49.90878, -7.69042),
			  new google.maps.LatLng(60.88770, 1.83496) 
			);	  
      // Listen for the dragend event
      google.maps.event.addListener(mymap, 'bounds_changed', function() {
          if (strictBounds.contains(mymap.getCenter())) return;

          // We're out of bounds - Move the map back within the bounds
          var c = mymap.getCenter(),
          x = c.lng(),
          y = c.lat(),
          maxX = strictBounds.getNorthEast().lng(),
          maxY = strictBounds.getNorthEast().lat(),
          minX = strictBounds.getSouthWest().lng(),
          minY = strictBounds.getSouthWest().lat();

          if (x < minX) x = minX;
          if (x > maxX) x = maxX;
          if (y < minY) y = minY;
          if (y > maxY) y = maxY;

          mymap.setCenter(new google.maps.LatLng(y, x));
      });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	
	