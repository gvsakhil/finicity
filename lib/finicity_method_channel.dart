import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'finicity_platform_interface.dart';

/// An implementation of [FinicityPlatform] that uses method channels.
class MethodChannelFinicity extends FinicityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('finicity');

  @override
  Future<String?> initFinicity(connectUrl) async {
    final version = await methodChannel
        .invokeMethod<String>('initFinicity', {'connectUrl': connectUrl});
    return version;
  }
}
