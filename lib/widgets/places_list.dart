import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/selected_place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No places added yet',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, i) => Dismissible(
          key: ValueKey(places[i]),
          onDismissed: (direction) {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: FileImage(
                places[i].image,
              ),
            ),
            title: Text(
              places[i].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SelectedPlace(place: places[i]),
                ),
              );
            },
          ),
        ),
      );
    }

    return content;
  }
}
