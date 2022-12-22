import Flutter
import UIKit
import Connect

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
    // flutterResult("iOS " + UIDevice.current.systemVersion)
    do {
      print("Inside Do");
      DispatchQueue.main.async {
        self.connectViewController = ConnectViewController()
        self.connectViewController.load(config: config)
      }
    } catch {
      print(error.localizedDescription)
    }
  }

  func connectLoaded() {
    // self.connectNavController = UINavigationController(rootViewController: self.connectViewController)
    // self.connectNavController.modalPresentationStyle = .fullScreen
    //  self.present(self.connectNavController, animated: false)
}

func connectDone(_ data: NSDictionary?) {
  flutterResult("iOS " + UIDevice.current.systemVersion)
}

func connectCancelled() {
     // Connect flow exited prematurely
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
