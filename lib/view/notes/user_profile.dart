import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_shape_clipper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:  const [AddEventTop(),
            CircleAvatar(radius: 50,
              backgroundColor: Colors.black,
              // add user image
             // child: ,

            ),
            SizedBox(height: 20,),
            Text("Janeesha Wishmika"),
            SizedBox(height: 20,),
            Text("janeesha.w@eyepax.com"),

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
