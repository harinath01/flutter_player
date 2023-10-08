package com.example.flutter_player_plugin

import android.content.Context
import android.view.View
import androidx.media3.common.MediaItem
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.MediaPlayer
import androidx.media3.exoplayer.MediaPlayerProvider
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView


class ExoPlayerView internal constructor(
    context: Context,
    messenger: BinaryMessenger,
    id: Int
) :
    PlatformView, MethodCallHandler {
    private val playerView = PlayerView(context)
    private val exoPlayer = ExoPlayer.Builder(context)
        .setMediaPlayerProvider(MediaPlayerProvider { MediaPlayer(context) })
        .build()
    private val methodChannel: MethodChannel
    override fun getView(): View {
        return playerView
    }

    init {
        playerView.player = exoPlayer
        val mediaItem = MediaItem.Builder().setUri("https://d384padtbeqfgy.cloudfront.net/transcoded/8r65J7EY6NP/video.m3u8").build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()
        methodChannel = MethodChannel(messenger, "plugins.flutter_player_plugin/player_view_$id")
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "setText" -> setText(methodCall, result)
            else -> result.notImplemented()
        }
    }

    private fun setText(methodCall: MethodCall, result: MethodChannel.Result ) {
        val text = methodCall.arguments as String
        result.success(null)
    }
    
    override fun dispose() {
        exoPlayer.release()
    }
}