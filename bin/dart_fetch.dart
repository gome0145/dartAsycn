// import 'package:dart_fetch/dart_fetch.dart' as dart_fetch;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var uri =
        Uri.parse('https://random-data-api.com/api/users/random_user?size=12');
    // final info = await http.read(uri);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var users = convert.jsonDecode(response.body) as List<dynamic>;

      for (final user in users) {
        final uid = user['uid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];

        final userInfo = 'UID: $uid, Name: $firstName $lastName';
        print(userInfo);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (err) {
    print('Failed http request');
  }
}
