import 'package:shared_preferences/shared_preferences.dart';

class GloryAiStorage {
  static final GloryAiStorage _singleton =  GloryAiStorage._internal();
  static SharedPreferences? _sharedPreferences;
  factory GloryAiStorage() {
    return _singleton;
  }
  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance().whenComplete(()=> true
    );
  }

  static setValue(String key, String value) async{
    await _sharedPreferences!.setString(key, value);
  }

  static getValue(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences!.getString(key);
    }
    return '';
  }

  static cleanData() {
    return _sharedPreferences!.clear();
  }

  GloryAiStorage._internal();
}