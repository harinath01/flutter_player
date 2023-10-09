import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_player_plugin/platform_interface.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  int? _playerTextureId;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int? playerTextureId;

    try {
      playerTextureId =
          await PlayerPlatform.instance.initializePlayerView(200, 200);
          print(playerTextureId);
    } on PlatformException {
      playerTextureId = null;
    }
    if (!mounted) return;

    setState(() {
      _playerTextureId = playerTextureId;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _playerTextureId != null ? Texture(textureId: _playerTextureId!) : null,
    );
  }
}