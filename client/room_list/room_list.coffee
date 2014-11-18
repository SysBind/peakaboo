Template.room_list.helpers
  room: ->
    query = Session.get 'search-query'
    filter = new RegExp query, 'i'
    Rooms.find { displayName: filter }, { sort: { displayName: 1 } }

Template.room_list.rendered = ->
  @$('[data-toggle="tooltip"]').tooltip()

Template.room_summary.helpers
  image: (room) ->
    switch Session.get 'view'
      when 'view-screen'
        file = 'screen.jpg'
      when 'view-camera'
        file = 'presenter.jpg'
      when 'view-galicaster'
        file = 'presentation.jpg'
    "http://localhost:3000/image/#{room}/#{file}"
  thumbnail: ->
    switch Session.get 'view'
      when 'view-screen'
        @presentationVideo
      when 'view-camera'
        @presenterVideo
      when 'view-galicaster'
        @screen
  zoom: ->
    Session.get 'zoom'

Template.rec.rendered = ->
  @$('[data-toggle="popover"]').popover
    placement: 'auto left'
    html: true
    container: 'body'
    content: ->
      $('#meta').html()
