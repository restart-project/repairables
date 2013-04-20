




$(document).ready ->
  $.ajax 'https://search.twitter.com/search.json?q=%23repairables&include_entities=t',
    type: 'GET'
    dataType: 'jsonp'
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      twitterText = data.results[0].text
      $('body').append twitterText
      hIndex = twitterText.indexOf 'http'
      console.log twitterText.split 'http'
      parts = twitterText.split 'http'
      $('body').append "<img src=\"#{data.results[0].entities.media[0].media_url}:thumb\"\/>"
      console.log 'http'+parts[1]
      $.get 'http'+parts[1], (data) ->
        $('body').append "Successfully got the page."     
  $.get 'http://t.co/OItb4LZViq', (data) ->
    $('body').append "Successfully got the page."

  # $.ajax 'http://t.co/OItb4LZViq',
  #   type: 'GET'
  #   dataType: 'html'
  #   error: (jqXHR, textStatus, errorThrown) ->
  #     $('body').append "AJAX Error: #{textStatus}"
  #   success: (data, textStatus, jqXHR) ->
  #     $('body').append "Successful AJAX call: #{data}"