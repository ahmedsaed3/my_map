import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../data/maps_repo.dart';
import '../../data/models/PlaceSuggestion.dart';
import '../../data/models/place_directions.dart';
import '../../data/models/place_location.dart';
part 'maps_state.dart';
class MapsCubit extends Cubit<MapsState> {
  MapsCubit(this.mapsRepository) : super(MapsInitial());
  final MapsRepository mapsRepository;
 void emitSuggestions( String place,String sessionToken){
   mapsRepository.fetchSuggestions(place, sessionToken).then((suggestion) {
     emit(PlacesLoaded(suggestion));


   });

 }
  void emitPlaceLocation( String placeId,String sessionToken){
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((placeLocation) {
      emit(PlaceLocationLoaded(placeLocation));


    });

  }
  void emitPlaceHistory( String description,String sessionToken){
    mapsRepository.getPlaceLocation(description, sessionToken).then((placeLocation) {
      emit(PlaceLocationLoaded(placeLocation));


    });

  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepository.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }
}


