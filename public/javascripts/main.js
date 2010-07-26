$(document).ready(function() {
    
    // Users thought these login / register links were for our site.
    setTimeout(function() {
        $("div.urtakw-footer-left").fadeOut();
        $("div.urtakw-footer-right").mouseenter(function(){
            $("div.urtakw-footer-left").fadeIn();
        });
        $("div.urtakw-footer").mouseleave(function(){
            $("div.urtakw-footer-left").fadeOut();
        });
        $("div.urtakw-footer-right a").attr("title","Polling provided by Urkat.")
    }, 4500);
    
})