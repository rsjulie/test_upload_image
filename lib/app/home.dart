import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_upload_image/app/rest_client/rest_client.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RestClient restClient = RestClient();
  var client = RestClient();
  late Uint8List imageBytes;

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
              child: Container(
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
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  child: const Text('Send'),
                  onPressed: () async {
                    // Environment.getExternalStoragePublicDirectory(
                    //     Environment.DIRECTORY_DOWNLOADS);
                    Directory appDir = await getApplicationDocumentsDirectory();
                    var appPath = appDir.path;

                    File file = File('$appPath/test.html');
                    await file.writeAsString('''<!DOCTYPE html>
                      <html lang="pt-br">
                        <head>
                          <title>Título da página</title>
                          <meta charset="utf-8">
                        </head>
                        <body>
                        <h1>TESTE</h1>
                          Aqui vai o código HTML que fará seu site aparecer.
                        </body>
                      </html>''');

                    file.create;
                    log(file.path);
                    log(file.readAsStringSync());

                    var urlUri = Uri.parse(
                        '/storage/emulated/0/Download/cardapio-sb-brasil.pdf');
                    var url =
                        '/storage/emulated/0/Download/cardapio-sb-brasil.pdf';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }

                    // var response = await restClient.post(
                    //     '/full-report/?_format=html&watermark=false',
                    //     {"name": "Julie Ribeiro", "born_date": "1999-03-10"});
                    // log(response.bodyBytes.toString());
                    // Directory tempDir = await getTemporaryDirectory();
                    // String tempPath = tempDir.path;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
