package dev.gvsakhil.finicity

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.finicity.connect.sdk.Connect
import com.finicity.connect.sdk.EventHandler

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject

/** FinicityPlugin */
class FinicityPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  private lateinit var result: Result

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "finicity")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    this.result = result;
    if (call.method == "initFinicity") {
      var connectUrl = call.argument<String>("connectUrl");
      Log.d("connectUrl", "connectUrl");
      Log.d(connectUrl, "connectUrl");
      start(activity, connectUrl, handler);
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  fun start(context: Context, connectUrl: String?, eventHandler: EventHandler?){
    Connect.start(context, connectUrl, eventHandler);
  }

  val handler = object: EventHandler {
    override fun onLoaded() {
      Log.d("Finicity", "Finicity SDK Loaded Successfully");
    }

    override fun onDone(doneEvent: JSONObject?) {
      Log.d("Done", "Done");
      result.success("Done");
    }

    override fun onCancel() {
      Connect.finishCurrentActivity();
    }

    override fun onError(errorEvent: JSONObject?) {
      TODO("Not yet implemented")
    }

    override fun onRouteEvent(routeEvent: JSONObject?) {
      TODO("Not yet implemented")
    }

    override fun onUserEvent(userEvent: JSONObject?) {
      TODO("Not yet implemented")
    }
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    Connect.finishCurrentActivity();
  }
}
