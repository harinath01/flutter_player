
import 'flutter_player_plugin_platform_interface.dart';

class FlutterPlayerPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterPlayerPluginPlatform.instance.getPlatformVersion();
  }
}
