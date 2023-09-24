import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/controllers/auth_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationController authController =
      Get.find<AuthenticationController>();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            authController.logout();
          },
          icon: const Icon(Icons.logout),
          color: Colors.black,
        )
      ]),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "T",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "a",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.lime,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "s",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "k",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " A",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "p",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "p",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: GetBuilder<AuthenticationController>(
              builder: (state) {
                if (state.userProfile.value != null) {
                  final userProfile = state.userProfile.value;
                  final user = state.user.value;
                  // print('userProfile : ${userProfile!.profile}');
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: userProfile!.profile.isNotEmpty
                              ? NetworkImage(
                                  userProfile.profile,
                                )
                              : const AssetImage(
                                  'assets/profile.png',
                                ) as ImageProvider<Object>?,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                                0.5), // Set the background color to grey
                            borderRadius: BorderRadius.circular(
                                10.0), // Set circular corners
                          ),
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.all(20.0),
                          child: Text(
                            'Name : ${userProfile.name.isNotEmpty ? userProfile.name : 'N/A'}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                                0.5), // Set the background color to grey
                            borderRadius: BorderRadius.circular(
                                10.0), // Set circular corners
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Email : ${user?.email}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Get.toNamed('/update');
          },
          label: Row(
            children: [
              Icon(
                Icons.post_add,
                size: 24.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              )
            ],
          )),
    ));
  }
}
