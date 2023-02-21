import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_app/models/user.dart';
import 'package:note_app/services/app_shared_data.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_shape_clipper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  UserModel? currentUser;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    AppSharedData sharedData = AppSharedData(prefs: sharedPref);
    String user = await sharedData.getToken(USER);
    currentUser = UserModel.fromJson(jsonDecode(user));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: ScalingText('Loading...'),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  AddEventTop(),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    // add user image
                    child: currentUser!.result[0].photo!.isNotEmpty
                        ? Image.network(currentUser!.result[0].photo!)
                        : Image.asset("assets/images/profile_pic.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(currentUser!.result[0].userName!),
                  SizedBox(
                    height: 20,
                  ),
                  Text(currentUser!.result[0].email!),
                ],
              ),
            ),
    );
  }
}

class AddEventTop extends StatefulWidget {
  const AddEventTop({Key? key}) : super(key: key);

  @override
  State<AddEventTop> createState() => _AddEventTopState();
}

class _AddEventTopState extends State<AddEventTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 200.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [bgDark, bgBlackLight],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "User Profile",
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
