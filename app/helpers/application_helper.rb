module ApplicationHelper
  def contact_map
    gmaps(contact_map_options.merge(contact_markers))
  end

private

  def contact_map_options
    {
      map_options: {
        type:   'ROADMAP',
        styles: [
          { stylers: [{ saturation: -100 }]}
        ],
        mapTypeControl: false,
        navigationControl: false,
        streetViewControl: false,
        scrollwheel: false,
        scaleControl: false,
        zoom: 1,
        auto_adjust: true
      }.to_json
    }
  end

  def contact_markers
    {
      markers: {
        data: [
          { description: '', title: '', lng: '0.4833920', lat: '44.8538060', picture: '', width: '', height: '' }
        ].to_json
      }
    }
  end
end
