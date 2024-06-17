
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants/strings.dart';
import '../models/PlaceSuggestion.dart';

class PlacesWebServices{

late Dio dio;
PlacesWebServices(){
  BaseOptions options = BaseOptions(
    connectTimeout:  Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),

  );

  dio = Dio(options);
}
Future<List<dynamic>> fetchSuggestions(String place,String sessionToken)async{


  try{
  Response response = await dio.get(GoogleSSuggestionURL,queryParameters:{
    'input': place,
    'types': 'address',
    'components': 'country:eg',
    'key': GoogleAPIKey,
    'sessionToken': sessionToken
  });
  return response.data['predictions'];

}
catch(error){
print(error.toString());
return [];
}
}
Future<dynamic>getPlaceLocation(String placeId,String sessionToken)async{
//try future of place
  try{
    Response response = await dio.get(placesDetailsURL,queryParameters:{
      'place_id': placeId,
      'fields': 'geometry',
      'key': GoogleAPIKey,
      'sessionToken': sessionToken
    });
    return response.data;

  }
  catch(error){
    print(error.toString());
    return Future.error("Place location error : " ,StackTrace.fromString('this is its trace'));
  }
}
Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
  try {
    Response response = await dio.get(
      DirectionURL,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': GoogleAPIKey,
      },
    );
    //print("Omar I'm testing directions");
    print(response.data);
    return response.data;
  } catch (error) {
    return Future.error("Place location error : ",
        StackTrace.fromString(('this is its trace')));
  }
}
}




