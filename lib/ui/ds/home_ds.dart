import 'package:dio/dio.dart';
import 'package:elsner_practical/network/client/api_client.dart';
import 'package:elsner_practical/network/rx_converter.dart';
import 'package:rxdart/rxdart.dart';

class HomeDs<T> extends RxConverter {

  Observable<dynamic> homeApi() {

    FormData formData = new FormData.fromMap({
      'type': '',
      'distance': '',
      'latitute': '23.022505',
      'gender': '',
      'keyword': '',
      'ratingSort': 'asc',
      'price': 'asc',
      'age': '',
      'longitute': '72.5713621',
      'page': '1',
      'user_id': '1',
      'role': '2',
      'ratingFilter': '',
      'sport': '["1"]',
      'start_date': ''
    });

    return callApi(
      ApiClient().dio().post(
        'User/getUsers',
        data: formData,
      ),
    ).map((response) {
       return returnResponse(response);
    });
  }
  
}