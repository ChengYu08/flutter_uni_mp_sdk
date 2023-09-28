import 'flutter_uni_mp_sdk_platform_interface.dart';

class FlutterUniMpSdk {
  Future<String?> getPlatformVersion() {
    return FlutterUniMpSdkPlatform.instance.getPlatformVersion();
  }

  Future<String?> callUniInit() {
    return FlutterUniMpSdkPlatform.instance.getPlatformVersion();
  }

  Future<String?> callOpenUniApp() {
    return FlutterUniMpSdkPlatform.instance.getPlatformVersion();
  }

  Future<String?> callConsole() {
    return FlutterUniMpSdkPlatform.instance.getPlatformVersion();
  }
}
