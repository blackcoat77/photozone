$(document).on 'turbolinks:load', ->  # Fix for Turbolinks preventing ready()
  $("#posts .flex-container").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#posts li.flex-item" # selector for all items you'll retrieve

    # Popup image from posts/show
    $('.popup').magnificPopup type: 'image'
