import 'package:flutter_test/flutter_test.dart';
import 'package:gtcci/gtcci.dart';
import 'package:gtcci/gtcci_platform_interface.dart';
import 'package:gtcci/gtcci_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGtcciPlatform
    with MockPlatformInterfaceMixin
    implements GtcciPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GtcciPlatform initialPlatform = GtcciPlatform.instance;

  test('$MethodChannelGtcci is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGtcci>());
  });

  test('getPlatformVersion', () async {
    Gtcci gtcciPlugin = Gtcci();
    MockGtcciPlatform fakePlatform = MockGtcciPlatform();
    GtcciPlatform.instance = fakePlatform;

    expect(await gtcciPlugin.getPlatformVersion(), '42');
  });
}
