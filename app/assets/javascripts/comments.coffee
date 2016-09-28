$(document).on 'turbolinks:load', ->
  $('#comments-link').click (event) ->
    event.preventDefault() # Prevent default jumping hash tag on click
    $('#comments-section').toggle()  #Toggle comments
    $('#comment_body').focus() # Jump to comment text area, #comment_body is
