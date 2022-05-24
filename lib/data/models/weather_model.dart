import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.cityName,
    required super.main,
    required super.description,
    required super.iconCode,
    required super.temperature,
    required super.tempFeelLike,
    required super.pressure,
    required super.humidity,
    required super.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] as String,
      main: json['weather']['main'] as String,
      description: json['weather']['description'] as String,
      iconCode: json['weather']['icon'] as String,
      temperature: json['main']['temp'] as double,
      tempFeelLike: json['main']['feels_like'] as double,
      pressure: json['main']['pressure'] as int,
      humidity: json['main']['humidity'] as int,
      windSpeed: json['wind']['speed'] as double,
    );
  }
  factory WeatherModel.fromEntity(Weather entity) {
    return WeatherModel(
      cityName: entity.cityName,
      main: entity.main,
      description: entity.description,
      iconCode: entity.iconCode,
      temperature: entity.temperature,
      tempFeelLike: entity.tempFeelLike,
      pressure: entity.pressure,
      humidity: entity.humidity,
      windSpeed: entity.windSpeed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      "weather": {
        "main": main,
        "description": description,
        "icon": iconCode,
      },
      "main": {
        "temp": temperature,
        "feels_like": tempFeelLike,
        "pressure": pressure,
        "humidity": humidity,
      },
      "wind": {
        "speed": windSpeed,
      },
    };
  }
}