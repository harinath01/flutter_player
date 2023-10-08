import Foundation
import Flutter
import UIKit
import AVKit

class AVPlayerView: NSObject, FlutterPlatformView {
    private var playerViewController: AVPlayerViewController
    private var _methodChannel: FlutterMethodChannel
    
    func view() -> UIView {
        return playerViewController.view
    }
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger
    ) {

        var player = AVPlayer(url: URL(string: "https://d384padtbeqfgy.cloudfront.net/transcoded/8r65J7EY6NP/video.m3u8")!)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        _methodChannel = FlutterMethodChannel(name: "plugins.flutter_player_plugin/player_view_\(viewId)", binaryMessenger: messenger)

        super.init()
        _methodChannel.setMethodCallHandler(onMethodCall)
    }

    func onMethodCall(call: FlutterMethodCall, result: FlutterResult) {
        switch(call.method){
        case "setText":
            setText(call:call, result:result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    func setText(call: FlutterMethodCall, result: FlutterResult){
        let text = call.arguments as! String
    } 
}
