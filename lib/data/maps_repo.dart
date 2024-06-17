import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_maps/data/models/PlaceSuggestion.dart';
import 'package:my_maps/data/models/place_location.dart';
import 'package:my_maps/data/webservices/PlacesWebservices.dart';

import 'models/place_directions.dart';

class MapsRepository {
  late final PlacesWebServices placesWebServices;

  MapsRepository(this.placesWebServices);

  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
    await placesWebServices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);//why didnt map?
  }


//  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
//     final locator =
//         await placesWebServices.getPlaceLocation(placeId, sessionToken);
//     return locator.map((placeLocator) => Place.fromJson(placeLocator))();
//   }
// }



  Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
    await placesWebServices.getDirections(origin, destination);

    return PlaceDirections.fromJson(directions);
  }
}
