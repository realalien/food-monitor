 <script type="text/javascript"> 
 /* <![CDATA[ */
 var map; 
 var default_shared_info_window = new google.maps.InfoWindow({ content: "" }); 
 
 function cartographer_ajax_fetch_url(url){ 
    if (window.XMLHttpRequest) {/* code for IE7+, Firefox, Chrome, Opera, Safari */ 
          xmlhttp=new XMLHttpRequest(); }
    else {/* code for IE6, IE5 */ 
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); } 
          
    xmlhttp.open("GET",url,false); xmlhttp.send(); 
    return xmlhttp.responseText; 
  } 
  function initialize_gmap_map() { 
        map = new google.maps.Map(document.getElementById("map"),
                                    {center: new google.maps.LatLng(0, 0), 
                                     zoom: 0, 
                                     scrollWheel: true, 
                                     mapTypeId: google.maps.MapTypeId.ROADMAP});
      map.setCenter(new google.maps.LatLng(0,0),0); 
      var map_bounds = new google.maps.LatLngBounds(new google.maps.LatLng(, ), new google.maps.LatLng(, )); map.setCenter(map_bounds.getCenter()); map.fitBounds(map_bounds); map.setMapTypeId(google.maps.MapTypeId.ROADMAP); setupMarkers(); setupAds();} function setupAds(){} function setupMarkers(){} if (typeof window.onload !== 'function') { window.onload = initialize_gmap_map; } else { old_before_cartographer_map = window.onload; window.onload = function() { old_before_cartographer_map(); initialize_gmap_map(); }; }/* ]]> */</script> 