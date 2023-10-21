import Flutter
import UIKit

public class FlutterUniMpSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_uni_mp_sdk", binaryMessenger: registrar.messenger())
    let instance = FlutterUniMpSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion);
      break;
    case "open":
        if let arguments = call.arguments as? Dictionary<String,Any> {
          let AppID: String = arguments["AppID"] as? String ?? ""
          let options = NSMutableDictionary.init(dictionary: launchOptions ?? [:])
          options.setValue(NSNumber.init(value:true), forKey: "debug")
          DCUniMPSDKEngine.initSDKEnvironment(launchOptions: options as! [AnyHashable : Any]);
          self?.checkUniMPResoutce(appid:AppID)
          self?.openUniMP(appid:AppID)
        }
      result(FlutterUniMpSdk.open(call.arguments as! String))
      break;
    default:
      result(FlutterMethodNotImplemented)
    }
  }


  func checkUniMPResoutce(appid: String) -> Void {
    let wgtPath = Bundle.main.path(forResource: appid, ofType: "wgt") ?? ""
    if DCUniMPSDKEngine.isExistsUniMP(appid) {
      let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
      let name = version["code"]!
      let code = version["code"]!
      print("小程序：\(appid) 资源已存在，版本信息：name:\(name) code:\(code)")
    } else {
      do {
        try DCUniMPSDKEngine.installUniMPResource(withAppid: appid, resourceFilePath: wgtPath, password: nil)
        let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
        let name = version["code"]!
        let code = version["code"]!
        print("✅ 小程序：\(appid) 资源释放成功，版本信息：name:\(name) code:\(code)")
      } catch let err as NSError {
        print("❌ 小程序：\(appid) 资源释放失败:\(err)")
      }
    }
  }

  /// 打开uni小程序
  @IBAction func openUniMP(appid: String) {
    let configuration = DCUniMPConfiguration.init()
    configuration.enableBackground = true
    
    DCUniMPSDKEngine.openUniMP(appid, configuration: configuration) { instance, error in
        if instance != nil {
            print("小程序打开成功")
        } else {
            print(error as Any)
        }
    }
  }

  func uniMP(onClose appid: String) {
    print("小程序：\(appid) closed")
  }

  func defaultMenuItemClicked(_ appid: String, identifier: String) {
    print("defaultMenuItemClicked：\(appid) \(identifier)")
  }

  func splashView(forApp appid: String) -> UIView {
      let splashView:UIView = Bundle.main.loadNibNamed("SplashView", owner: self, options: nil)?.last as! UIView
      return splashView
  }

}
