import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  bool addPlace(Place newPlace) {
    final isAlreadyAdded = state.contains(newPlace);

    if (isAlreadyAdded) {
      return false;
    } else {
      state = [...state, newPlace];
      return true;
    }
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) {
    return PlacesNotifier();
  },
);