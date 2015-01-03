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

$("#share_pet_on_fb").click ->
  FB.ui
    method: "stream.publish"
    display: "iframe"
    attachment: {
      name: "Me llamo #{$(".pet_name").html()} y necesito que me adopten"
      caption: "Soy una mascota que busca un hogar en Medellin, vista mi perfil para que conozcas mi historia, mis fotos y puedas adoptarme! Es complemente gratis."
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
  remaining = 350 - $(x).val().length
  $(".countdown_#{x.attr('id')}").text remaining + " caracteres restantes"
  return


