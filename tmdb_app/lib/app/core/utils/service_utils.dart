import 'package:connectivity_plus/connectivity_plus.dart';

class ServiceUtil {
  static Future<bool> checkInternetConnection() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.mobile ||
        await Connectivity().checkConnectivity() == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
