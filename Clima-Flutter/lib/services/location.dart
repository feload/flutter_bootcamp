import 'package:geolocator/geolocator.dart';

class Location {

  Position position;

  get latitude => position.latitude;
  get longitude => position.longitude;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch(e){
      print(e);
    }
  }
}