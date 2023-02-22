import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_app/models/user.dart';
import 'package:note_app/services/app_shared_data.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_shape_clipper.dart';
import '../login_screen/login_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  UserModel? currentUser;
  AppSharedData? sharedData;


  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedData = AppSharedData(prefs: sharedPref);
    String user = await sharedData!.getToken(USER);
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
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () async {
                      sharedData!.clearAll();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                      //_appRepository.addReminder(Reminder(selectedType, titleController.text, selectedTime, pickedDate,"false", _selectedOption[repeatIndex].toString()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: bgDark)
                      ),
                      primary: bgDark,
                      elevation: 8,
                      shadowColor: Colors.black87,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25,right: 25,top: 4,bottom: 4),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
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
