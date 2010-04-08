TrunkFilm = {
  init: function(){
    $('#contact-details').hide();
    $('#contact a').click(function(){
      $('#contact-details').toggle();
      return false;
    });
  }
},

TrunkFilm.Movie = {
  height: 0,
  width: 0,

  init: function(movie_id, height, width){
    TrunkFilm.Movie.height = height;
    TrunkFilm.Movie.width = width;
    TrunkFilm.Movie.addSwobject(movie_id);

    $('.details').click(function(){
      $(this).fadeOut();
      $('.movie object')[0].api_play();
    });
  },

  vimeo_player_loaded: function(){
    $('.movie object')[0].api_addEventListener('onPlay', 'TrunkFilm.Movie.hide_details');
  },

  hide_details: function(){
    $('.details').fadeOut();
  },

  addSwobject: function(movie_id){
    var flashvars = {
      clip_id: movie_id,
      show_portrait: 1,
      show_byline: 1,
      show_title: 1,
      js_api: 1,
      js_onLoad: 'TrunkFilm.Movie.vimeo_player_loaded'
    };
    var params = {
      allowscriptaccess: 'always',
      allowfullscreen: 'true',
      wmode: "transparent"
    };
    var attributes = {};
    swfobject.embedSWF("http://vimeo.com/moogaloop.swf", 'movie_'+movie_id, TrunkFilm.Movie.width, TrunkFilm.Movie.height, "9.0.0","expressInstall.swf", flashvars, params, attributes);
  }

},

TrunkFilm.AboutUs = {

  current_position: 0,
  amount_to_move: 655,

  init: function(){
    $('#scroll-left').hide();
    $('#scroll-right').click(TrunkFilm.AboutUs.scrollRight);
    $('#scroll-left').click(TrunkFilm.AboutUs.scrollLeft);
  },

  scrollLeft: function(){
    TrunkFilm.AboutUs.current_position--;
    TrunkFilm.AboutUs.scroll('+');
    return false;
  },

  scrollRight: function(){
    TrunkFilm.AboutUs.current_position++;
    TrunkFilm.AboutUs.scroll('-');
    return false;
  },

  scroll: function(direction){
    $('div#about-us img').animate({
      marginLeft: direction+'='+TrunkFilm.AboutUs.amount_to_move+'px'
    }, 1000);

    $('#texts').animate({
      marginLeft: direction+'='+TrunkFilm.AboutUs.amount_to_move+'px'
    }, 1000);

    if(TrunkFilm.AboutUs.current_position == 0){
      $('#scroll-left').hide();
    } else if($('.text').size()-1 == TrunkFilm.AboutUs.current_position){
      $('#scroll-right').hide();
    } else {
      $('#scroll-left').show();
      $('#scroll-right').show();
    }
  }
}

$(document).ready(function(){
  TrunkFilm.init();
});
