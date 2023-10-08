import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_player_plugin_method_channel.dart';

abstract class FlutterPlayerPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterPlayerPluginPlatform.
  FlutterPlayerPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPlayerPluginPlatform _instance = MethodChannelFlutterPlayerPlugin();

  /// The default instance of [FlutterPlayerPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPlayerPlugin].
  static FlutterPlayerPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPlayerPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterPlayerPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
