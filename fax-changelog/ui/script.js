var audio = new Audio('action.ogg');
$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			/* ----CHANGELOG JS SECTION---- */
			if (item !== undefined && item.type === "changelog") {

				if (item.display === true) {
					$('#changelog').delay(100).fadeIn( 0 );
					audio.play();
				} else if (item.display === false) {
					$('#changelog').fadeOut( "slow" );
				}
			}
		});
	};
});