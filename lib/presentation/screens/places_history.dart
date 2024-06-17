// places_history.dart
import '../../data/models/PlaceSuggestion.dart';

class PlacesHistory {
  List<PlaceSuggestion> _history = [];

  void addPlace(PlaceSuggestion place) {
    _history.add(place);

    if (_history.length > 10) {
      _history.removeAt(0);
    }
  }

  List<PlaceSuggestion> getHistory() {
    return List.unmodifiable(_history);
  }

  void clearHistory() {
    _history.clear();
  }
}
