import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_uni_mp_sdk_platform_interface.dart';

/// An implementation of [FlutterUniMpSdkPlatform] that uses method channels.
class MethodChannelFlutterUniMpSdk extends FlutterUniMpSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_uni_mp_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> callOpenUniApp() async {
    await methodChannel.invokeMethod<String>('open');
    return null;
  }

  @override
  Future<String?> callConsole() async {
    await methodChannel.invokeMethod<String>('console');
    return null;
  }
}
