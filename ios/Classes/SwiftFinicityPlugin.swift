import Flutter
import UIKit
import Connect
import Dispatch

public class SwiftFinicityPlugin: NSObject, FlutterPlugin {
  var flutterResult: FlutterResult!
  var connectViewController: ConnectViewController!
  var connectNavController: UINavigationController!
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "finicity", binaryMessenger: registrar.messenger())
    let instance = SwiftFinicityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    flutterResult = result;
    guard let args = call.arguments as? [String : Any] else {return}
    let connectUrl = args["connectUrl"] as! String
    let config = ConnectViewConfig(connectUrl: connectUrl, loaded: self.connectLoaded, done: self.connectDone, cancel: self.connectCancelled, error: self.connectError, route: self.connectRoute, userEvent: self.connectUserEvent)
    self.connectViewController = ConnectViewController()
    self.connectViewController.load(config: config)
  }

  func connectLoaded() {
    self.connectNavController = UINavigationController(rootViewController: self.connectViewController)
    self.connectNavController.modalPresentationStyle = .fullScreen
    let rootViewController:UIViewController! = UIApplication.shared.keyWindow?.rootViewController
    rootViewController.present(self.connectNavController, animated: false)
  }

  func connectDone(_ data: NSDictionary?) {
    flutterResult("iOS " + UIDevice.current.systemVersion)
  }

  func connectCancelled() {
    
  }

  func connectError(_ data: NSDictionary?) {
      // Error encountered in Connect flow
  }

  func connectRoute(_data: NSDictionary?) {
  // Connect route changed
  }

  func connectUserEvent(_ data: NSDictionary?) {
  // Connect user event fired in response to user action
  }
}
