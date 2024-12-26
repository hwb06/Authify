
import 'gtcci_platform_interface.dart';

class Gtcci {
  Future<String?> getPlatformVersion() {
    return GtcciPlatform.instance.getPlatformVersion();
  }
}
