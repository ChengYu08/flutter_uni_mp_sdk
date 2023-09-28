import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_uni_mp_sdk_method_channel.dart';

abstract class FlutterUniMpSdkPlatform extends PlatformInterface {
  /// Constructs a FlutterUniMpSdkPlatform.
  FlutterUniMpSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUniMpSdkPlatform _instance = MethodChannelFlutterUniMpSdk();

  /// The default instance of [FlutterUniMpSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUniMpSdk].
  static FlutterUniMpSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUniMpSdkPlatform] when
  /// they register themselves.
  static set instance(FlutterUniMpSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> callUniInit() {
    throw UnimplementedError('callUniInit() has not been implemented.');
  }

  Future<String?> callOpenUniApp() {
    throw UnimplementedError('callOpenUniApp() has not been implemented.');
  }

  Future<String?> callConsole() {
    throw UnimplementedError('callConsole() has not been implemented.');
  }
}
