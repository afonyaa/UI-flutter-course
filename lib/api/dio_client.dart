import 'package:dio/dio.dart';
import 'package:chack_norris/models/Joke.dart';
import 'package:chack_norris/api/constants.dart' as Constants;

class DioClient {
  final Dio _dio = Dio();
  final String _baseUrl = Constants.API_URI;

  Future<Joke?> getJoke() async {
    Joke? joke;
    try {
      final Response response = await Dio().get(_baseUrl);
      joke = Joke.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return joke;
  }
}
