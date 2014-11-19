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

$("#share_pet_on_fb").click ->
  FB.ui
    method: "stream.publish"
    display: "iframe"
    attachment: {
      name: "Me llamo #{$(".pet_name").html()} y quiero que me adopten"
      caption: "Soy una mascota que busca un hogar, he pensado en ti para hacerte compañía y por eso quiero que visites mi perfil para que veas lo tierno que soy."
      href: $(location).attr('href')
      media:[{"type":"image","src":$('.div_left img').attr('src'),"href":$(location).attr('href')}]
    }
  , (response) ->

$("#share_pet_on_twitter").click (e) ->
  e.preventDefault()
  loc = $(location).attr('href')
  title = escape($(this).attr("title"))
  window.open "http://twitter.com/share?url=" + loc + "&text=" + title + "&", "twitterwindow", "height=450, width=550, top=" + ($(window).height() / 2 - 225) + ", left=" + $(window).width() / 2 + ", toolbar=0, location=0, menubar=0, directories=0, scrollbars=0"
  return


updateCountdown = (x) ->
  remaining = 450 - $(x).val().length
  $(".countdown_#{x.attr('id')}").text remaining + " caracteres restantes"
  return

fixAgeField = ->
  if(!$('#adoption_pet_age').val() || !$('#age :selected').val())
    $("#adoption_pet_pet_attributes_age").val("#{$('#age :selected').val()}")
  else
    $("#adoption_pet_pet_attributes_age").val("#{$('#adoption_pet_age').val()} #{$('#agelist :selected').val()}")

showAgeElements = (show) ->
  fixAgeField()
  if(show == false || !$('#age :selected').val())
    $("#adoption_pet_age").hide()
    $("#agelist").hide()
  else
    $("#adoption_pet_age").show()
    $("#agelist").show()

