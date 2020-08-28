import 'package:geolocator/geolocator.dart';
class Location{

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async
  {
    try{
      print("done");
      Geolocator geolocator = Geolocator();
      Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).timeout(const Duration(seconds: 5));
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    }catch(e){
      print(e);
    }
  }
}



