import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerWidget {
  const AddPlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    // final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            const SizedBox(height: 12,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(placesProvider.notifier).addPlace(
                    Place(name: nameController.text)
                  );
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Place was added!'),),
                  );
                },
                child: const Text('Add place'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}