import 'finicity_platform_interface.dart';

class Finicity {
  Future<String?> initFinicity(connectUrl) {
    return FinicityPlatform.instance.initFinicity(connectUrl);
  }
}
