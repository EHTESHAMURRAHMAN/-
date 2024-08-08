import 'package:get/get.dart';
import 'package:siddique/App/Module/Credentials/Controllers/Credential_Controller.dart';

class CredentialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CredentialController>(CredentialController());
  }
}
