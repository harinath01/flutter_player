import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const AndroidView(
          viewType: 'plugins.flutter_player_plugin/player_view',
        );
      case TargetPlatform.iOS:
        return const UiKitView(
            viewType: 'plugins.flutter_player_plugin/player_view'
        );
      default:
        return Text(
            '$defaultTargetPlatform is not yet supported by the web_view plugin');
    }
  }
}