import 'package:flutter/services.dart';
import "uni_manager.dart";

class UniApp {
  static const version = "0.0.1";
  static const _channel = MethodChannel("flutter_uni_mp_sdk");

  static final manager = UniManager(_channel);

  UniApp._();
}
