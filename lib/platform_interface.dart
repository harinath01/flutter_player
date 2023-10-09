import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel.dart';

abstract class PlayerPlatform extends PlatformInterface {
  PlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlayerPlatform _instance = PlayerMethodChannel();

  static PlayerPlatform get instance => _instance;

  static set instance(PlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> initializePlayerView(double width, double height) {
    throw UnimplementedError('create() has not been implemented.');
  }
}
