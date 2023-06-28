import 'package:faker/faker.dart';
import 'package:flutter_Riverpod/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_Riverpod/utils/unittest/userdata_api_response.dart';



// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}
//@GenerateMocks([http.Client])
/*void main() {
  print("The test function is calling");

  group('API Testing', () {
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
    });

    test('Test API', () async {
      // Prepare the mock response
      final mockResponse = http.Response('{"page": 2, "total": "12"}', 200);
      print(mockResponse.statusCode);
      print(mockResponse.body);

      // Set up the mock request
        when(mockClient.get(Uri.parse('https://reqres.in/api/users?page=2')))
          .thenAnswer((_) async => mockResponse);
      expect(await fetchusers(mockClient), isA<UserModel>());
     // expect(api.getNetErrorException(""), HttpException(""));
      print(mockResponse.body);
    });
    // Add more test cases as needed

  });



}*/



void main() {
  final mockClient = MockClient();
  final mockResponse = http.Response('Mocked response', 200);
  print(mockResponse.body);
  test('Mock HTTP GET Request', () async {
    when(mockClient.get(Uri.parse('https://reqres.in/api/users?page=2')))
        .thenAnswer((_) async => mockResponse);

    final response = await mockClient.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print("the responder is:$response");

    expect(response, mockResponse);
    expect(response.statusCode, 200);
    expect(response.body, 'Mocked response');

  });
}






