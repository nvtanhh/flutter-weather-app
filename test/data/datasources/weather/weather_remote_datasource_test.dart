import 'package:flutter_resources/core/exceptions/exceptions.index.dart';
import 'package:flutter_resources/data/datasources/weather/weather_remote_datasource.dart';
import 'package:flutter_resources/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockClient mockClient;
  late WeatherRemoteDatasourceImpl datasource;

  setUp(() {
    mockClient = MockClient();
    datasource = WeatherRemoteDatasourceImpl(mockClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('weather.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getWeatherByLocation', () {
    test(
      'should return WeatherModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result =
            await datasource.getWeatherByLocation(51.5285582, -0.2416811);
        // assert
        expect(result, isA<WeatherModel>());
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = datasource.getWeatherByLocation;
        // assert
        expect(
          () => call(51.5285582, -0.2416811),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });

  group('getWeatherByCityName', () {
    const String cityName = 'London';

    test(
      'should return WeatherModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await datasource.getWeatherByCityName(cityName);
        // assert
        expect(result, isA<WeatherModel>());
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = datasource.getWeatherByCityName;
        // assert
        expect(() => call(cityName), throwsA(isA<ServerException>()));
      },
    );
  });
}
