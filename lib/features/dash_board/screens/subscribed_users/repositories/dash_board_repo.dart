import 'package:admin_panel/features/dash_board/screens/subscribed_users/models/sub_user_model.dart';
import 'package:admin_panel/utils/const/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ASubUserRepo extends GetxController {
  static ASubUserRepo get instance => Get.find();

  getUserData({required String whichData}) async {
    try {
      final response = await http.post(
        Uri.parse(apiEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'collectionName': whichData,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON response
        List<dynamic> jsonResponse = json.decode(response.body);

        return jsonResponse.map((data) {
          try {
            return ASubcribedUserModel.fromMap(data);
          } catch (e) {
            print(
                'Error converting document: $data'); // Print the problematic data
            print('Error: $e');
            return ASubcribedUserModel.empty();
          }
        }).toList();
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        print('Failed to load data');
        return [];
      }
    } catch (e) {
      print('Failed to load data $e');
      return [];
    }
  }
}
