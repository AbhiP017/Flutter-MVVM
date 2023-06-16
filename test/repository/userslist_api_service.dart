import 'package:flutter_mvvm_provider/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/network_service/unittest/userdata_api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';



// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}
//@GenerateMocks([http.Client])
void main() {
  print("The test function is calling");

  group('API Testing', () {
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
    });

    test('Test API', () async {
      // Prepare the mock response
      final mockResponse = http.Response('{"id": 1, "name": "Leanne Graham"}', 200);
      print(mockResponse.statusCode);
      print(mockResponse.body);

      // Set up the mock request
      when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => mockResponse);

      // Perform the API request using the mock client
      final response = await mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      // Verify the response
      expect(response.statusCode, 200);
      expect(response.body, '{"id": 1, "name": "Leanne Graham"}');

    });

    // Add more test cases as needed

  });
}