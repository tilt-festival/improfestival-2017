window.initMap = ->
  map = new google.maps.Map $('.map')[0],
    center:
      lat: 59.436292
      lng: 24.746169
    zoom: 16

  soprus = new google.maps.Marker
    position:
      lat: 59.435283
      lng: 24.745345
    map: map
    title: 'Sõprus'
    label: '1'

  soprusInfo = new google.maps.InfoWindow
    content: """
      <h3>Cinema "Sõprus"</h3>
      <p class="lead">Vana-Posti 8, Tallinn</p>
      <p>Performance venue. Entrance from the smaller door to the right of the building.</p>
"""
  soprus.addListener 'click', -> soprusInfo.open map, soprus

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

  vene = new google.maps.Marker
    position:
      lat: 59.437209
      lng: 24.747384
    map: map
    title: 'Tallinna Rahvaülikooli Teatrikeskus'
    label: '2'

  veneInfo = new google.maps.InfoWindow
    content: """
      <h3>Tallinna Rahvaülikooli Teatrikeskus</h3>
      <p class="lead">Vene 6, Tallinn</p>
      <p>Workshops venue. Come into the tunnel from Vene street. <br />Ring the bell next to the first door on the right.
      Workshops will take place on the 2nd and 3rd floors.</p>
"""
  vene.addListener 'click', -> veneInfo.open map, vene

# Open a modal window with the set modal's content loaded
# url should be in the form workshops/do-it-yourself.html (no leading # or /)
showModal = (url) ->
  # Forcing the prepending of .href helps mitigrate some XSS attacks
  url = "#{getPageUrl()}#{url}.html"
  $('#modal-details').find('.modal-content').html('').load(url)
  $('#modal-details').modal 'show'

# Return the URL of the current page, without the .hash part
getPageUrl = ->
  window.location.href.substr 0, window.location.href.indexOf('#')-1

$ ->

  # Easter egg
  $('.footer-bg').click ->
    window.open 'https://fucking.tilt.ee', '_blank'

  $('a[href^="#"]').smoothScroll
    offset: -60
    speed: 800

  $('[data-toggle="modal"]:not(tr)').on 'click', (e) ->
    e.preventDefault()
    url = $(this).data('href') ? $(this).attr('href')

    # Append the modal's ID to the URL's hash
    window.location.hash = url.replace '.html', ''

    $('#modal-details').find('.modal-content').html('').load url


  $('.row-equal-height [class^="col-"]').matchHeight()

  $('.table-tickets tr').hover ->
    image = $(this).data 'image'
    url = $(this).find('a').attr 'href'

    row = $(this).closest('.row').find('.col-day-info')

    row.find('img').attr 'src', image
    row.find('a').attr 'href', url

  # When a modal window is closed, remove the modal's hash from the URL
  $('#modal-details').on 'hidden.bs.modal', ->
    history.replaceState {}, document.title, getPageUrl()

  # When the browser's (or phone's) "Back" button is pressed
  # make sure the possibly-open modal window will be closed.
  # This enables navigation where the user can open the modal, then
  # use the phone's Back button to close it
  $(window).on 'popstate', ->
    # Popstate is also activated when appending the hash? so we'll only consider
    # a 'Back' event when the hash is currently empty
    $('#modal-details').modal 'hide' unless window.location.hash

  # If the user navigated to the page and the URL contains a modal's ID, open that modal
  # This allows linking directly to some specific modals
  if window.location.hash
    showModal window.location.hash.replace('#','')
