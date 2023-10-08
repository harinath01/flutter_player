import Flutter
import UIKit

public class FlutterPlayerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(PlayerViewFactory(messenger: registrar.messenger()), withId: "plugins.flutter_player_plugin/player_view")
  }
}
