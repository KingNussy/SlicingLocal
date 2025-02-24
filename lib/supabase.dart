import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

Future<void> main() async {
  const url = 'https://aejqzqdnjfhzxebourql.supabase.co';
  const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlanF6cWRuamZoenhlYm91cnFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzExNDcwOTYsImV4cCI6MjA0NjcyMzA5Nn0.hA_gjxgPd3yd_3msLbwxhHFoCWvM55uD03MrPxmJkLY';
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyHomeState();
}

final supabase = Supabase.instance.client;

class _MyHomeState extends State<MyApp> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  Future<List<dynamic>> fetchFood() async {
    final List<Map<String, dynamic>> response =
        await supabase.from('food').select('*');
    return response as List<dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}