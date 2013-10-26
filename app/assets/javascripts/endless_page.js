$(document).ajaxSend(function(event, request, settings) {
    $('#loading-indicator').show();
});

var currentPage = 1;
var intervalID = -1000;
 
function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage++;
  console.log("endless request "+ currentPage);
    jQuery.ajax('?page=' + currentPage, {asynchronous:true, evalScripts:true, method:'get', success: function(data, textStatus, jqXHR) {
		$('.stories').append(jQuery(data).find('.stories').html());
		if(typeof jQuery(data).find('.stories').html() == 'undefined' || jQuery(data).find('.stories').html().trim().length == 0){
			clearInterval(intervalID);
		}
	},});
  }
}
 
function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 20;
}
 
function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}
 
function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}
 
$('document').ready(function(){
	intervalID = setInterval(checkScroll, 250);
})

$(document).ajaxComplete(function(){
    try{
        FB.XFBML.parse();
        twttr.widgets.load(); 
    }catch(ex){}
});

$(document).ajaxComplete(function(event, request, settings) {
    $('#loading-indicator').hide();
});