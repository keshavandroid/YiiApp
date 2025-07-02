import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/register_model.dart';

class ApiService {
  static const String baseUrl =
      'https://keshavinfotechdemo2.com/keshav/KG1/YII/api';

  Future<RegisterModel> register(
    String userName,
    String email,
    String contactNumber,
    String password,
    int countryId,
  ) async {
    try {
      print('Attempting registration for user: $userName'); // Debug log

      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'userName': userName,
          'email': email,
          'phoneNumber': contactNumber,
          'password': password,
          'countryId': countryId,
        }),
      );

      print('Response status code: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final registerResponse = RegisterModel.fromJson(data);

        print(registerResponse.result.otp.runtimeType); // Will print 'int' or 'String'

        if (registerResponse.status == 1) {
          // Store user data in SharedPreferences
          // await _storeUserData(registerResponse.result);
          print('Response username: ${registerResponse.result.userName}');
          print('Response email: ${registerResponse.result.email}');
          print('Response phoneNumber: ${registerResponse.result.phoneNumber}');
          print('Response phoneNumber: ${registerResponse.result.otp}');
          print('Response countryId: ${registerResponse.result.countryId}');
          print('Response userToken: ${registerResponse.result.userToken}');
          return registerResponse;
        } else {
          throw Exception(registerResponse.message);
        }
      } else {
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } catch (e) {
      print('Registration error: $e'); // Debug log
      throw Exception('Failed to register: $e');
    }
  }

  // Future<BoothFormFieldsResponse> getBoothFormDetails({
  //   required String type,
  //   String? searchWord,
  // })
  // async
  // {
  //   try {
  //     // Get stored userId and userToken
  //     final userId = await UserPreferences.getId();
  //     final userToken = await UserPreferences.getUserToken();
  //
  //     if (userId == null || userToken == null) {
  //       throw Exception('User not authenticated. Please login first.');
  //     }
  //
  //     print(
  //       'Fetching booth form details with type: $type, searchWord: $searchWord',
  //     ); // Debug log
  //     print('Using userId: $userId, userToken: $userToken'); // Debug log
  //
  //     final queryParameters = {
  //       'userId': userId.toString(),
  //       'userToken': userToken,
  //       'categoryId': '4', // Fixed categoryId for drinks
  //       'type': type,
  //     };
  //
  //     // Add searchWord parameter only if it's provided and not empty
  //     if (searchWord != null && searchWord.isNotEmpty) {
  //       queryParameters['searchWord'] = searchWord;
  //     }
  //
  //     final uri = Uri.parse(
  //       '$baseUrl/getBoothFormDetails',
  //     ).replace(queryParameters: queryParameters);
  //
  //     final response = await http.get(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );
  //
  //     print('Request URL: ${uri.toString()}'); // Debug log
  //     print('Response status code: ${response.statusCode}'); // Debug log
  //     print('Response body: ${response.body}'); // Debug log
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       final boothFormFieldsResponse = BoothFormFieldsResponse.fromJson(data);
  //
  //       if (boothFormFieldsResponse.status == 1) {
  //         return boothFormFieldsResponse;
  //       } else {
  //         throw Exception(boothFormFieldsResponse.message);
  //       }
  //     } else {
  //       throw Exception(
  //         'Failed to load booth form details: ${response.statusCode}',
  //       );
  //     }
  //   } catch (e) {
  //     print('Error fetching booth form details: $e'); // Debug log
  //     throw Exception('Failed to load booth form details: $e');
  //   }
  // }
}
