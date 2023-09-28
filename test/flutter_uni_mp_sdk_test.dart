import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uni_mp_sdk/flutter_uni_mp_sdk.dart';
import 'package:flutter_uni_mp_sdk/flutter_uni_mp_sdk_platform_interface.dart';
import 'package:flutter_uni_mp_sdk/flutter_uni_mp_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterUniMpSdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterUniMpSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterUniMpSdkPlatform initialPlatform = FlutterUniMpSdkPlatform.instance;

  test('$MethodChannelFlutterUniMpSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterUniMpSdk>());
  });

  test('getPlatformVersion', () async {
    FlutterUniMpSdk flutterUniMpSdkPlugin = FlutterUniMpSdk();
    MockFlutterUniMpSdkPlatform fakePlatform = MockFlutterUniMpSdkPlatform();
    FlutterUniMpSdkPlatform.instance = fakePlatform;

    expect(await flutterUniMpSdkPlugin.getPlatformVersion(), '42');
  });
}
