$(function() {
  var $starrers = $('a#starrers');
  $starrers.on('click', function(event) {
    event.preventDefault();
    showStarrers($starrers.attr('href'));
  });
});

var showStarrers = function(href) {
     $.get("/lists/" + href + ".json", function(data) {
       console.log(data);
       
    });
 }
