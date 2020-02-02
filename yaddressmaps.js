var response

function drawMap(myAddress){
	$.getJSON("https://map.yahooapis.jp/geocode/V1/geoCoder?callback=?",
	{
		appid:"dj00aiZpPUI5b2JlM21DOEk5TyZzPWNvbnN1bWVyc2VjcmV0Jng9NzY-",
		query: myAddress,
		al:"4",
		output:"json",
	},
	function(result){
		response=result;
		console.log(response);
		var lnglat=result.Feature[0].Geometry.Coordinates.split(",");
		var lng=lnglat[0];
		var lat=lnglat[1]
		var myCenter=new Y.LatLng(lat,lng);
		var ymap=new Y.Map("map_canvas");
		ymap.drawMap(myCenter,15,Y.LayerSetId.NORMAL);
	}
	);
}