import 'dart:io';
import 'package:eschoolaire_app/constant.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';


class AjouterCVPage extends StatefulWidget {
  const AjouterCVPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AjouterCVPageState createState() => _AjouterCVPageState();
}

class _AjouterCVPageState extends State<AjouterCVPage> {
  File? _cvFile;

 

 _pickCV() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null){
      _cvFile= File(image.path);
    }
  setState(() {
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
         backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _cvFile != null
                ? Image.file(
                    _cvFile!,
                    height: 200,
                  )
                : const Icon(
                    Icons.picture_as_pdf,
                    size: 100,
                    color: Colors.grey,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:() async {
                await _pickCV();
                },
              child: const Text('Choose a file'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Enregistrer le CV dans la base de données ou effectuer toute autre action nécessaire.
                // Exemple : _saveCVToDatabase(_cvFile);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('CV ajouté avec succès!'),
                  ),
                );
              },
              child: const Text('save and send'),
            ),
          ],
        ),
      ),
    );
  }
}