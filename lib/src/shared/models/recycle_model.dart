import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class RecycleModel with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _address;
  String? selection = "";
  bool isLoading = false;

  XFile? get image => _image;
  String? get address => _address;

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _image = image;
    }
    notifyListeners();
  }

  void setaddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void setSelection(String value) {
    selection = value;
    notifyListeners();
  }
}
