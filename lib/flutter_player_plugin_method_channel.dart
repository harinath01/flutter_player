import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_player_plugin_platform_interface.dart';

/// An implementation of [FlutterPlayerPluginPlatform] that uses method channels.
class MethodChannelFlutterPlayerPlugin extends FlutterPlayerPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_player_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
