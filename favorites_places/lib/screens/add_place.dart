import 'package:favorites_places/models/place.dart';
import 'package:favorites_places/providers/user_places.dart';
import 'package:favorites_places/widgets/image_input.dart';
import 'package:favorites_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  PlaceLocation? _selectedLocation;

  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (_selectedImage == null ||
        enteredTitle.isEmpty ||
        _selectedLocation == null) {
      return;
    } else {
      ref
          .read(userPlacesProvider.notifier)
          .addPlace(enteredTitle, _selectedImage!, _selectedLocation!);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlace,
              label: const Text('Add Place'),
            )
          ],
        ),
      ),
    );
  }
}
