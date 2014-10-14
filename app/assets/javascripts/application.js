// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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

var on_load_fnc = function(){
    $('div.candidate-cards').shuffle();
    $('ul#issue_websites').shuffle();

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
};

$(document).ready(on_load_fnc);
$(document).on('page:load', on_load_fnc)
