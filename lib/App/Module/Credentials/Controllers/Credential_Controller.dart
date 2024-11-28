import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:siddique/App/Module/route/app_pages.dart';

import '../../../API/api_client.dart';
import '../../../API/api_endpoints.dart';
import '../../../Model/data_model.dart';
import '../../../Model/profile_model.dart';
import '../../../Utils/shared_preferences_manager.dart';

class CredentialController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  var passwordInVisible = true.obs;
  var showLoading = false.obs;

  //* State Machine Input -> SMI Input bool to trigger actions
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  //* SMI Bool for eyes
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;

  //* SMI for numbers of chars in textfield
  SMIInput<double>? lookAtNumber;

  //* Art Board
  Artboard? artboard;

  //* State Machine Controller
  late StateMachineController? controller;

  @override
  void onInit() {
    nameFocusNode.addListener(nameFocus);
    phoneController.addListener(phoneFocus);
    emailController.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.onInit();
  }

  @override
  void onClose() {
    // emailFocusNode.removeListener(emailFocus);
    // passwordFocusNode.removeListener(passwordFocus);
    super.onClose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void nameFocus() {
    isChecking?.change(nameFocusNode.hasFocus);
  }

  void phoneFocus() {
    isChecking?.change(phoneFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  void login() async {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    showLoading.value = true;
    //* delay by 2s
    await Future.delayed(
      const Duration(seconds: 2),
    );
    showLoading.value = false;

    if (emailController.text == '123' && passwordController.text == "123") {
      trigSuccess?.change(true);
      Get.toNamed(Routes.DASHBOARD);
    } else {
      trigFail?.change(true);
    }
  }

  final ApiClient _apiClient = ApiClient();

  var isLoading = false.obs;
  var profile = Rxn<Profile>();

  Future<void> createAccount(AccountRequest accountRequest) async {
    isLoading.value = true;
    try {
      final response = await _apiClient.post(
        ApiEndpoints.createAccount,
        accountRequest.toJson(),
      );
      final accountResponse = AccountResponse.fromJson(response);
      Get.snackbar("Success", "Account created with ID: ${accountResponse.id}");
      await fetchProfile(accountResponse.id); // Fetch profile using the ID
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProfile(int id) async {
    isLoading.value = true;
    try {
      final response = await _apiClient.get("${ApiEndpoints.getProfile}/$id");
      final fetchedProfile = Profile.fromJson(response);

      // Save profile to SharedPreferences
      await SharedPreferencesManager.save(
          'userProfile', fetchedProfile.toJson());
      profile.value = fetchedProfile;

      Get.snackbar("Success", "Profile loaded and saved locally");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Retrieve profile from SharedPreferences
  Future<void> loadProfileFromPreferences() async {
    final savedProfile = SharedPreferencesManager.get('userProfile');
    if (savedProfile != null) {
      profile.value = Profile.fromJson(savedProfile);
    }
  }
}
