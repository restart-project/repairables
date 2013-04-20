(function() {

  $(document).ready(function() {
    $.ajax('https://search.twitter.com/search.json?q=%23repairables&include_entities=t', {
      type: 'GET',
      dataType: 'jsonp',
      error: function(jqXHR, textStatus, errorThrown) {
        return $('body').append("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        var hIndex, parts, twitterText;
        twitterText = data.results[0].text;
        $('body').append(twitterText);
        hIndex = twitterText.indexOf('http');
        console.log(twitterText.split('http'));
        parts = twitterText.split('http');
        $('body').append("<img src=\"" + data.results[0].entities.media[0].media_url + ":thumb\"\/>");
        console.log('http' + parts[1]);
        return $.get('http' + parts[1], function(data) {
          return $('body').append("Successfully got the page.");
        });
      }
    });
    return $.get('http://t.co/OItb4LZViq', function(data) {
      return $('body').append("Successfully got the page.");
    });
  });

}).call(this);
