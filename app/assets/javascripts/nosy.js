function init_map(htmlElem, latitude, longitude)
{
    return new google.maps.Map(
        document.getElementById(htmlElem),
        {
            center: new google.maps.LatLng(latitude, longitude),
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
}

function pin_event(map, event)
{
    var coord = new google.maps.LatLng(
        event.location.latitude,
        event.location.longitude);
    var marker = new google.maps.Marker({
        position: coord,
        map: map,
        title: event.title
    });
}

function Event(title, latitude, longitude)
{
    this.title = title;
    this.location = {
        latitude: latitude,
        longitude: longitude
    };
}
