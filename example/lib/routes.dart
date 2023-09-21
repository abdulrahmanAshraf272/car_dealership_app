import 'package:flutter_bluetooth_serial_example/ChatPage.dart';
import 'package:flutter_bluetooth_serial_example/MainPage.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_details/car_details_screen.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_specifications/car_specifications_screen.dart';
import 'package:flutter_bluetooth_serial_example/screens/confirm_screen/confirm_screen.dart';
import 'package:flutter_bluetooth_serial_example/screens/all_cars/all_cars_screen.dart';
import 'package:flutter_bluetooth_serial_example/screens/smile_face/smile_face_screen.dart';
import 'package:flutter_bluetooth_serial_example/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/";
  static String allCarsScreen = '/all_cars_screen';
  static String confirmScreen = '/confirm_screen';
  static String carDetailsScreen = '/car_details_screen';
  static String carSpecificationsScreen = '/car_specifications_screen';
  static String welcomeScreen = '/welcome_scree';
  static String smileFaceScreen = '/smile_face_screen';
  static String chatPageForConnection = '/char_page_for_connection';

  static String getHomeRoute() => home;
  static String getConfirmScreenRoute() => confirmScreen;
  static String getCarDetailsScreenRoute() => carDetailsScreen;
  static String getCarSpecificationsScreenRoute() => carSpecificationsScreen;
  static String getWelcomeScreenRoute() => welcomeScreen;
  static String getAllCarsScreenRoute() => allCarsScreen;
  static String getSmileFaceScreen() => smileFaceScreen;
  static String getChatPage() => chatPageForConnection;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => MainPage()),
    GetPage(name: allCarsScreen, page: () => AllCarsScreen()),
    GetPage(name: confirmScreen, page: () => const ConfirmScreen()),
    GetPage(name: carDetailsScreen, page: () => CarDetails()),
    GetPage(name: carSpecificationsScreen, page: () => CarSpecification()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: smileFaceScreen, page: () => SmileFaceScreen()),
    GetPage(name: chatPageForConnection, page: () => ChatPage())
  ];
}
