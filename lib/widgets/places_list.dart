import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/selected_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          background: Container(
            color:
                Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.delete),
              ],
            ),
          ),
          onDismissed: (direction) {
            final Place place = places[i];
            ref.read(placesProvider.notifier).removePlace(places[i].id);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 3),
              content: Text(
                '${place.name} was deleted.',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            ));
          },
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
            subtitle: Text(
              places[i].location.address,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
