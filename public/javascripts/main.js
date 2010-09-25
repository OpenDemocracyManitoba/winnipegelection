(function($){
  $.fn.shuffle = function() {
    return this.each(function(){
      var items = $(this).children();
      return (items.length)
        ? $(this).html($.shuffle(items))
        : this;
    });
  }

  $.shuffle = function(arr) {
    for(
      var j, x, i = arr.length; i;
      j = parseInt(Math.random() * i),
      x = arr[--i], arr[i] = arr[j], arr[j] = x
    );
    return arr;
  }
})(jQuery);


$(document).ready(function() {
    
    // Users thought these login / register links were for our site.
    setTimeout(function() {
        $("div.twtr-ft").fadeOut();
    }, 4000);

    $('div.candidates').shuffle();
})