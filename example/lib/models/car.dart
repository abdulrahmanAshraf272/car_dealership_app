// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bluetooth_serial_example/models/feature.dart';

class Car {
  final int id;
  final String name;
  final String fullName;
  final String imageWithoutBackground;
  final int year;
  final int cc;
  final int hp;
  final int seatsNo;
  final int topSpeed;
  final String description;
  final List<Feature> engineFeatures;
  final List<Feature> performanceFeatures;
  final List<Feature> interiorFeatures;
  final List<Feature> exteriorFeatures;
  final List<Feature> techFeatures;
  Car(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.imageWithoutBackground,
      required this.year,
      required this.cc,
      required this.hp,
      required this.seatsNo,
      required this.topSpeed,
      required this.description,
      required this.engineFeatures,
      required this.performanceFeatures,
      required this.interiorFeatures,
      required this.exteriorFeatures,
      required this.techFeatures});
}
