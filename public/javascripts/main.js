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
    
    $('input#ward_button').click(function(){
        var house_num    = $('input.house_num'); 
        var house_street = $('input.house_street')
        
        var house_num_val    = house_num.val();
        var house_street_val = house_street.val();
        
        if (house_num_val == "") {
            house_num.focus();
            alert("Street number cannot be blank.");
            return false;
        } else if (house_num_val != parseInt(house_num_val)) {
            house_num.focus();
            alert("Street number must be a number.");
            return false;
        } else if (house_street_val == "") {
            house_street.focus();
            alert("Street nane cannot be blank.");
            return false;
        } 
        
        window.open("","myNewWin","width=800,height=600,toolbar=0,scrollbars=1");
        return true;
    });
    
    $('input.house_num').focus(function(){
        if ($(this).val() == '#') {
            $(this).val('');
        }
    });
    
    $('input.house_street').focus(function(){
        if ($(this).val() == 'street name') {
            $(this).val('');
        }
    });
});