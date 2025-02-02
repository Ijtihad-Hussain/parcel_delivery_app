import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _mileageBalance = prefs.getDouble('ff_mileageBalance') ?? _mileageBalance;
  }

  SharedPreferences prefs;

  LatLng pickupLocation;

  LatLng destinationLocation;

  double buyMileage = 0.0;

  double mileageCost = 0.0;

  double _mileageBalance = 0;
  double get mileageBalance => _mileageBalance;
  set mileageBalance(double _value) {
    _mileageBalance = _value;
    prefs.setDouble('ff_mileageBalance', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
