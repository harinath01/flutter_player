package com.example.flutter_player_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

class FlutterPlayerPlugin: FlutterPlugin {
  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    binding.platformViewRegistry.registerViewFactory(
      "plugins.flutter_player_plugin/player_view", PlayerViewFactory(binding.binaryMessenger))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    
  }
}
