import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'finicity_method_channel.dart';

abstract class FinicityPlatform extends PlatformInterface {
  /// Constructs a FinicityPlatform.
  FinicityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FinicityPlatform _instance = MethodChannelFinicity();

  /// The default instance of [FinicityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFinicity].
  static FinicityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FinicityPlatform] when
  /// they register themselves.
  static set instance(FinicityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> initFinicity(connectUrl) {
    throw UnimplementedError('initFinicity() has not been implemented.');
  }
}
