package com.example.flutter_player_plugin

import android.content.Context
import android.view.View
import android.widget.TextView
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
    private val textView: TextView
    private val methodChannel: MethodChannel
    override fun getView(): View {
        return textView
    }

    init {
        textView = TextView(context)
        textView.text = "Hari Hara Nathan"
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
        textView.text = text
        result.success(null)
    }
    
    override fun dispose() {
        TODO("Not yet implemented")
    }
}