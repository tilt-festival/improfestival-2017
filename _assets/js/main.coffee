window.initMap = ->
  map = new google.maps.Map $('.map')[0],
    center:
      lat: 59.436292
      lng: 24.746169
    zoom: 16

  new google.maps.Marker
    position:
      lat: 59.435283
      lng: 24.745345
    map: map
    title: 'Sõprus'
    label: '1'

  new google.maps.Marker
    position:
      lat: 59.437209
      lng: 24.747384
    map: map
    title: 'Tallinna Rahvaülikooli Teatrikeskus'
    label: '2'

  # Sõprus
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.435154
      lng: 24.745211
    radius: 20

  # Rahvaülikool
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.437209
      lng: 24.747384
    radius: 20

$ ->
  $('a[href^="#"]').smoothScroll
    offset: -60
    speed: 800

  $('[data-toggle="modal"').on 'click', (e) ->
    e.preventDefault()
    url = $(this).data('href') ? $(this).attr('href')
    $('#modal-details').find('.modal-content').html('').load url


  $('.row-equal-height [class^="col-"]').matchHeight()

  $('.table-tickets tr').hover ->
    image = $(this).data 'image'
    url = $(this).find('a').attr 'href'

    row = $(this).closest('.row').find('.col-day-info')

    row.find('img').attr 'src', image
    row.find('a').attr 'href', url
