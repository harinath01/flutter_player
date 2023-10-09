package com.example.flutter_player_plugin

import android.content.Context
import android.view.Surface
import androidx.media3.common.MediaItem
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.TextureRegistry

class ExoPlayerView internal constructor(
    context: Context,
    texture: TextureRegistry.SurfaceTextureEntry
) {
    private val playerView = PlayerView(context)
    private val exoPlayer = ExoPlayer.Builder(context).build()

    init {
        playerView.player = exoPlayer
        val mediaItem = MediaItem.Builder()
            .setUri("https://d384padtbeqfgy.cloudfront.net/transcoded/8r65J7EY6NP/video.m3u8")
            .build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        val surface = Surface(texture.surfaceTexture())
        exoPlayer.setVideoSurface(surface)
        exoPlayer.play()
    }
}