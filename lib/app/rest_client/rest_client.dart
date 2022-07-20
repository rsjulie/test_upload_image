import 'package:get/get.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://blooming-mountain-93746.herokuapp.com/api';
  }
}
