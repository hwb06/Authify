import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gtcci_method_channel.dart';

abstract class GtcciPlatform extends PlatformInterface {
  /// Constructs a GtcciPlatform.
  GtcciPlatform() : super(token: _token);

  static final Object _token = Object();

  static GtcciPlatform _instance = MethodChannelGtcci();

  /// The default instance of [GtcciPlatform] to use.
  ///
  /// Defaults to [MethodChannelGtcci].
  static GtcciPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GtcciPlatform] when
  /// they register themselves.
  static set instance(GtcciPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
