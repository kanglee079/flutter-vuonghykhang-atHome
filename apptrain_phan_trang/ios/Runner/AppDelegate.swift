import UIKit
import Flutter
import zpdk // Đảm bảo rằng bạn đã import thư viện ZaloPay SDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Thêm hàm xử lý mở URL
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ZaloPaySDK.sharedInstance().application(app, open:url, sourceApplication: "vn.com.vng.zalopay", annotation:nil)
  }
}
