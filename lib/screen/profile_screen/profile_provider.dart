import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/api/user_data_api.dart';
import 'package:sustain_tour_mobile/models/user_data_models/user_data_models.dart';

class ProfileProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  Future<void> getUserData({required int userId}) async {
    _isLoading = true;
    notifyListeners();
    _user = await UserDataApi().getUserData(userId: userId);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateName({
    required int userId,
    required String newName,
  }) async {
    bool isDoneUpdate = false;

    try {
      isDoneUpdate = await UserDataApi().updateName(
        userId: userId,
        newName: newName,
      );

      if (isDoneUpdate) {
        _message = 'Berhasil update nama';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<void> updateUsername({
    required int userId,
    required String newUsername,
  }) async {
    try {
      String newToken = await UserDataApi().updateUsername(
        userId: userId,
        newUsername: newUsername,
      );

      // simpan token baru di local
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', newToken);

      _message = 'Berhasil update username';
      await getUserData(userId: userId);
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<void> updateNoHandphone({
    required int userId,
    required String newNoHp,
  }) async {
    bool isDoneUpdate = false;

    try {
      isDoneUpdate = await UserDataApi().updateNoHandphone(
        userId: userId,
        newNoHp: newNoHp,
      );

      if (isDoneUpdate) {
        _message = 'Berhasil update no hp';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<void> updateEmail({
    required int userId,
    required String newEmail,
  }) async {
    bool isDoneUpdate = false;

    try {
      isDoneUpdate = await UserDataApi().updateEmail(
        userId: userId,
        newEmail: newEmail,
      );

      if (isDoneUpdate) {
        _message = 'Berhasil update email';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  // WARNING: FUNCTION INI HANYA DIPANGGIL JIKA IZIN LOKASI SUDAH DIBERIKAN
  // JADI MINTA DULU IZINNYA DI SPLASH SCREEN ATAU TOMBOL CHECKOUT
  Future<void> updateUserLocation() async {
    bool isDoneUpdate = false;
    Position userLocation = await Geolocator.getCurrentPosition();

    try {
      isDoneUpdate = await UserDataApi().updateLokasiUser(
          lat: userLocation.latitude, long: userLocation.longitude);
      if (isDoneUpdate) {
        _message = 'Berhasil update lokasi user';
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  void clearMessage() {
    _message = '';
  }

  Future<void> updatePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    bool isDoneUpload = false;

    try {
      isDoneUpload = await UserDataApi().updatePassword(
        userId: userId,
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );

      if (isDoneUpload) {
        _message = 'Berhasil ganti password';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<void> uploadProfileImage({
    required int userId,
    required File image,
  }) async {
    bool isDoneUpdate = false;

    try {
      isDoneUpdate = await UserDataApi().uploadProfileImage(
        userId: userId,
        image: image,
      );
      if (isDoneUpdate) {
        _message = 'Berhasil upload profile image';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<void> deleteProfileImage({
    required int userId,
  }) async {
    bool isDoneUpdate = false;

    try {
      isDoneUpdate = await UserDataApi().deleteProfileImage(
        userId: userId,
      );
      if (isDoneUpdate) {
        _message = 'Berhasil delete profile image';
        await getUserData(userId: userId);
      }
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<XFile?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
