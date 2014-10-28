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
      $("#adoption_form").find(".errors").html "Por favor corrije: #{jqXHR.responseText}"
    success: (data, textStatus, jqXHR) ->
      $("#adoption_form").html "#{data}"

$(document).ready ->
  showAgeElements(false)
  updateCountdown($('#adoption_pet_pet_attributes_story'))
  updateCountdown($('#adoption_pet_temperament'))
  $("#adoption_pet_pet_attributes_story, #adoption_pet_temperament").change updateCountdown($(this))
  $("#adoption_pet_pet_attributes_story, #adoption_pet_temperament").keyup ->
    updateCountdown($(this))
    textarea_limit = parseInt($(this).attr("maxlength"))
    current_text = $(this).val()
    actual_chars = current_text.length
    if actual_chars > textarea_limit
      new_text = current_text.substr(0,textarea_limit)
      $(this).val new_text
  $('.numbersOnly').keyup ->
    this.value = this.value.replace(/[^0-9\.]/g,'')
  $("#adoption_pet_age, #agelist").change ->
    fixAgeField()
  $("#adoption_pet_age").keyup ->
    fixAgeField()
  $("#age").change ->
    showAgeElements(true)

updateCountdown = (x) ->
  remaining = 450 - $(x).val().length
  $(".countdown_#{x.attr('id')}").text remaining + " caracteres restantes"
  return

fixAgeField = ->
  if($('#adoption_pet_age').val()==''||$('#age :selected').val()=="")
    $("#adoption_pet_pet_attributes_age").val("#{$('#age :selected').val()}")
  else
    $("#adoption_pet_pet_attributes_age").val("#{$('#adoption_pet_age').val()} #{$('#agelist :selected').val()}")

showAgeElements = (show) ->
  fixAgeField()
  if(show==false||$('#age :selected').val()=="")
    $("#adoption_pet_age").hide()
    $("#agelist").hide()
  else
    $("#adoption_pet_age").show()
    $("#agelist").show()