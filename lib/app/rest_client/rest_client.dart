import 'package:get/get.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://e052-177-128-15-224.sa.ngrok.io';
  }
  // Get request
  Future<Response> getUser(int id) => get('http://youapi/users/$id');
  // Post request
  Future<Response> postUser(Map data) => post('http://youapi/users', data);
  // Post request with File

  Future<Response> postCases(List<int> image) async {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile (image, filename: 'cover.png'),
    });
    return await post('/momore', form);
  }
}
