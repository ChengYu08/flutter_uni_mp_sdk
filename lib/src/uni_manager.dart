import 'package:flutter/services.dart';

class UniManager {
  MethodChannel channel;
  UniManager(this.channel) {
    _addNativeCallback(channel);
  }

  static Map _buildParam(Map param) {
    param["uniManager"] = "uniManager";
    return param;
  }

  // 处理重原生发回来的信息
  _addNativeCallback(MethodChannel channel) {
    channel.setMethodCallHandler((call) async {
      try {
        String method = call.method;
        String type = call.arguments['type'];
        switch (method) {
          case "onUniEvent":
            print(type);
            break;
          default:
            print("default");
            break;
        }
      } catch (e) {
        print(
            "回调失败了。$e ${call.method} ${call.arguments['type']} ${call.arguments['data']}");
      }
      return Future.value(null);
    });
  }

  Future init() {
    return channel.invokeMethod('init', _buildParam({}));
  }
}
