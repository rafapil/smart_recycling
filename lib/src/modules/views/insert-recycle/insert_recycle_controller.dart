import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:provider/provider.dart';
// import 'package:smart_recycling/src/shared/models/recycle_model.dart';

class InsertRecycleController {
  Future<String> getUserLocation() async {
    bool permissionGranted = await checkPermission();
    if (permissionGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      // String address =
      //     "${place.street}, ${place.subLocality}, ${place.administrativeArea}";

      // Consumer<RecycleModel>(builder: (_, recycleModel, __) {

      return "${place.street}, ${place.subLocality}, ${place.administrativeArea}";
      // });

      // print(
      //     "${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.postalCode}");
      // print(place.toString());
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
        // incluir alguma devolutiva para avisar o usuario sobre o erro
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
