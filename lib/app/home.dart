import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_upload_image/app/rest_client/rest_client.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var imagePicker;
  var _image;
  var client = RestClient();
  late Uint8List imageBytes;
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(color: Colors.red[200]),
              child: _image != null
                  ? Image.file(
                      _image,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.red[200]),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Take'),
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  child: const Text('Send'),
                  onPressed: () {
                    send();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> getImage(ImageSource imageSource) async {
    final image =
        await ImagePicker().pickImage(source: imageSource, maxHeight: 800);
    if (image == null) {
      return Future.value();
    }
    setState(() {
      _image = File(image.path);
    });
    imageBytes = await image.readAsBytes();
    return await image.readAsBytes();
  }

  send() async {
    try {
      var response = await client.postCases([0, 0, 0, 1]);
      log(response.statusText.toString());
    } catch (e) {
      log('erro: $e');
    }
  }
}
