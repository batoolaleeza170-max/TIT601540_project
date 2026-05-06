import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../utils/constants.dart';
class ApiService {
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint),
    );
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
