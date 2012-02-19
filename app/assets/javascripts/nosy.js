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

function EventPin(map, event, icon_file)
{
    var coord = new google.maps.LatLng(
        event.location.latitude,
        event.location.longitude);
    
    this.marker = icon_file == undefined
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

function FixMyStreetPin(map, event)
{
    EventPin(map, event, 'http://lecatr.people.wm.edu/redstar.gif');
}

function TweetPin(map, event)
{
    EventPin(map, event);
}

function Event(title, latitude, longitude)
{
    this.title = title;
    this.location = {
        latitude: latitude,
        longitude: longitude
    };
}
