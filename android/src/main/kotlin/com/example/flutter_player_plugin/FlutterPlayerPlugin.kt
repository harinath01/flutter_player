package com.example.flutter_player_plugin

import android.content.Context
import android.util.LongSparseArray
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry.SurfaceTextureEntry


class FlutterPlayerPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var texture: SurfaceTextureEntry
  private lateinit var context: Context
  private val videoPlayers = LongSparseArray<ExoPlayerView>()

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "test_plugin")
    channel.setMethodCallHandler(this)
    texture = flutterPluginBinding.textureRegistry.createSurfaceTexture()
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "initializePlayerView"){
      initializeExoplayerView(call, result)
    } else {
      result.notImplemented()
    }
  }

  private fun initializeExoplayerView(call: MethodCall, result: Result){
    val player = ExoPlayerView(context, texture)
    videoPlayers.put(texture.id(), player)
    result.success(texture.id())
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
