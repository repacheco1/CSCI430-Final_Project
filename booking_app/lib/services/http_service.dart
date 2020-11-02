import 'dart:convert';
import 'package:booking_app/models/business.dart';
import 'package:http/http.dart';

// class Repository {
//   static final Repository _repo = Repository._internal();
//   static const String API_KEY =
//       '6lMqYiuxXrk02xRkBFXkurRQ5LnCqWgzsE-6RuN7iOsiE6S6wEXXN6ZYpPufOo8ClfmsmppBg2PrTHQZP7_nKykWb1LNaCaVwIUmqSQ19xYx5hHGkcsPubAkiuiNX3Yx';
//   static const Map<String, String> AUTH_HEADER = {
//     'Authorization': 'Bearer $API_KEY'
//   };

//   static Repository get() {
//     return _repo;
//   }

//   // ignore: sort_constructors_first
//   Repository._internal();
// }

class HttpService {
  final String yelpUrl =
      'https://api.yelp.com/v3/businesses/search?latitude=39.728493&longitude=-121.837479';
  //static const String apiKey =
  //'6lMqYiuxXrk02xRkBFXkurRQ5LnCqWgzsE-6RuN7iOsiE6S6wEXXN6ZYpPufOo8ClfmsmppBg2PrTHQZP7_nKykWb1LNaCaVwIUmqSQ19xYx5hHGkcsPubAkiuiNX3Yx';
  static const String API_KEY =
      '6lMqYiuxXrk02xRkBFXkurRQ5LnCqWgzsE-6RuN7iOsiE6S6wEXXN6ZYpPufOo8ClfmsmppBg2PrTHQZP7_nKykWb1LNaCaVwIUmqSQ19xYx5hHGkcsPubAkiuiNX3Yx';
  static const Map<String, String> AUTH_HEADER = {
    'Authorization': 'Bearer $API_KEY'
  };
  Future<List<Business>> getPosts() async {
    // ignore: omit_local_variable_types
    final Response res = await get(yelpUrl, headers: AUTH_HEADER);
    //succesfull request
    if (res.statusCode == 200) {
      // ignore: omit_local_variable_types
      final Map<String, dynamic> body =
          jsonDecode(res.body) as Map<String, dynamic>;

      // ignore: omit_local_variable_types
      // final List<Business> business = body
      //     .map(
      //         (dynamic item) => Business.fromJson(item as Map<String, dynamic>))
      //     .toList();

      // ignore: omit_local_variable_types
      final Iterable jsonList = body['businesses'] as Iterable<dynamic>;

      // ignore: omit_local_variable_types
      final List<Business> businesses = jsonList
          .map(
              (dynamic item) => Business.fromJson(item as Map<String, dynamic>))
          .toList();

      return businesses;
    } else {
      throw 'Can not retrieve information';
    }
  }
}
