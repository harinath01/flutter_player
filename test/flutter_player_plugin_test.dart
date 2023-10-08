import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_player_plugin/flutter_player_plugin.dart';
import 'package:flutter_player_plugin/flutter_player_plugin_platform_interface.dart';
import 'package:flutter_player_plugin/flutter_player_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPlayerPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPlayerPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPlayerPluginPlatform initialPlatform = FlutterPlayerPluginPlatform.instance;

  test('$MethodChannelFlutterPlayerPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPlayerPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterPlayerPlugin flutterPlayerPlugin = FlutterPlayerPlugin();
    MockFlutterPlayerPluginPlatform fakePlatform = MockFlutterPlayerPluginPlatform();
    FlutterPlayerPluginPlatform.instance = fakePlatform;

    expect(await flutterPlayerPlugin.getPlatformVersion(), '42');
  });
}
