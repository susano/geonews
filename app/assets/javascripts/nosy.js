function init_map(htmlElem, latitude, longitude)
{
    return new google.maps.Map(
        document.getElementById(htmlElem),
        {
            center: new google.maps.LatLng(latitude, longitude),
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
}

function pinEvent(map, event, icon_file)
{
    var coord = new google.maps.LatLng(
        event.location.latitude,
        event.location.longitude);
    return icon_file == undefined
        ? new google.maps.Marker({
                position: coord,
                map: map,
                title: event.title
          })
        : new google.maps.Marker({
                position: coord,
                map: map,
                title: event.title,
                icon: icon_file,
                optimized: false // To enable gif animation
          });
}

function pinFixMyStreet(map, event)
{
    return pinEvent(map, event, 'marker.gif');
}

function pinTweet(map, event)
{
    return pinEvent(map, event, 'tweetmarker.png');
}

function Event(title, latitude, longitude)
{
    this.title = title;
    this.location = {
        latitude: latitude,
        longitude: longitude
    };
}

function makeInfoWindow(map, marker, event)
{
    var infoWindow = new google.maps.InfoWindow({
        content: event.title
    });
    return function() {
	infoWindow.open(map, marker);
    };
}