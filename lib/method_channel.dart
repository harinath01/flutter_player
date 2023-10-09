import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_player_plugin/platform_interface.dart';

/// An implementation of [TestPluginPlatform] that uses method channels.
class PlayerMethodChannel extends PlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> initializePlayerView(double width, double height) async {
    final textureId = await methodChannel.invokeMethod<int>('initializePlayerView', {
      'width': width,
      'height': height,
    });
    return textureId;
  }
}