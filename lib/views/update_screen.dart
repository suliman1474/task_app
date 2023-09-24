import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/auth_controller.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController nameController = TextEditingController();
  final authController = Get.find<AuthenticationController>();
  final ImagePicker imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  XFile? profilePic;

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = authController.userProfile.value?.name ?? '';

    super.initState();
  }

  void selectImage() async {
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        profilePic = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white, // Set the background color to white
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () {
                    final oldPic = authController.userProfile.value?.profile;

                    return GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: profilePic != null
                                ? FileImage(File(profilePic!.path))
                                : (oldPic!.isNotEmpty
                                    ? NetworkImage(oldPic) as ImageProvider<
                                        Object>? // Assuming profileImage is a URL
                                    : const AssetImage('assets/profile.png')),
                          ),
                          Positioned(
                            right: 10.h,
                            bottom: -4.h,
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      }),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.find<AuthenticationController>()
                          .updateUserProfile(nameController.text, profilePic);
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
