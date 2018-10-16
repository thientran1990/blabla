jQuery ->
  $('#admin_place_fileupload').fileupload
    dataType: 'json'
    done: (e, data) ->
      $('ul.guide_content_images').append(data.result.html)
