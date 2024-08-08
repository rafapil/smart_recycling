import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class InsertRecycleController {
  Future<String> getUserLocation() async {
    bool permissionGranted = await checkPermission();
    if (permissionGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      return "${place.street}, ${place.subLocality}, ${place.administrativeArea}";
    } else {
      return "Permission not granted";
    }
  }

  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
