import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> getPosition() async {
  if (!await Permission.location.request().isGranted) {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  return position;
}
