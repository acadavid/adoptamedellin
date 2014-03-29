$("#adoptme").click ->
  $(this).fadeOut()
  $("#adoption_form").fadeIn()

$("#new_interested_contact").submit (e)->
  e.preventDefault()
  $.ajax $(this).attr("action"),
    type: 'POST'
    dataType: 'html'
    data: $(this).serialize()
    beforeSend: (xhr) ->
      xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")
    error: (jqXHR, textStatus, errorThrown) ->
      $("#adoption_form").find(".errors").html "Por favor corrije: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      $("#adoption_form").html "#{data}"
