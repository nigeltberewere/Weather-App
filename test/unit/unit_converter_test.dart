import 'package:flutter_test/flutter_test.dart';
import 'package:weatherly/core/utils/unit_converter.dart';

void main() {
  group('UnitConverter', () {
    group('Temperature Conversion', () {
      test('converts Celsius to Fahrenheit correctly', () {
        expect(UnitConverter.celsiusToFahrenheit(0), 32);
        expect(UnitConverter.celsiusToFahrenheit(100), 212);
        expect(UnitConverter.celsiusToFahrenheit(25), 77);
        expect(UnitConverter.celsiusToFahrenheit(-40), -40);
      });

      test('converts Fahrenheit to Celsius correctly', () {
        expect(UnitConverter.fahrenheitToCelsius(32), 0);
        expect(UnitConverter.fahrenheitToCelsius(212), 100);
        expect(UnitConverter.fahrenheitToCelsius(-40), -40);
      });

      test('formats temperature with correct unit', () {
        expect(UnitConverter.formatTemperature(25, 'metric'), '25°C');
        expect(UnitConverter.formatTemperature(25, 'imperial'), '77°F');
        expect(UnitConverter.formatTemperature(25, 'kelvin'), '298K');
      });
    });

    group('Speed Conversion', () {
      test('converts km/h to mph correctly', () {
        final result = UnitConverter.kmhToMph(100);
        expect(result, closeTo(62.14, 0.01));
      });

      test('formats wind speed with correct unit', () {
        // Input is now km/h
        expect(UnitConverter.formatWindSpeed(36, 'metric'), '36 km/h');
        expect(UnitConverter.formatWindSpeed(36, 'imperial'), '22 mph');
      });
    });

    group('Distance Conversion', () {
      test('converts km to miles correctly', () {
        final result = UnitConverter.kmToMiles(1.609);
        expect(result, closeTo(1.0, 0.01));
      });

      test('formats visibility with correct unit', () {
        // Input is now km
        expect(UnitConverter.formatVisibility(10, 'metric'), '10.0 km');
        expect(UnitConverter.formatVisibility(1.609, 'imperial'), '1.0 mi');
      });
    });
  });
}
