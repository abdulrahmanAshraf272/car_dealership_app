import 'package:flutter_bluetooth_serial_example/cars_data/cars_list.dart';
import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_bluetooth_serial_example/models/feature.dart';

class HoldValues {
  static Car carSelected = cars[0];
  static String titleCardSelected = '';
  static List<Feature> featuresListSelected = cars[0].engineFeatures;
}
