window.initMap = ->
  map = new google.maps.Map $('.map')[0],
    center:
      lat: 59.435406
      lng: 24.745213
    zoom: 17

  new google.maps.Marker
    position:
      lat: 59.435283
      lng: 24.745345
    map: map
    title: 'Sõprus'
    label: '1'

  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.435154
      lng: 24.745211
    radius: 20

$ ->
  $('a[href^="#"]').smoothScroll
    offset: -60
    speed: 800

  $('[data-toggle="modal"').on 'click', (e) ->
    e.preventDefault()
    url = $(this).data('href') ? $(this).attr('href')
    $('#modal-details').find('.modal-content').load url


  $('.row-equal-height [class^="col-"]').matchHeight()

  $('.table-tickets tr').hover ->
    image = $(this).data 'image'
    url = $(this).find('a').attr 'href'

    row = $(this).closest('.row').find('.col-day-info')

    row.find('img').attr 'src', image
    row.find('a').attr 'href', url
