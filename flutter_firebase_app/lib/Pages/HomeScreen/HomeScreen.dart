import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/Pages/LoginScreen/LoginScreen.dart';
import 'package:flutter_firebase_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Create an instance for IFirebaseAuthService
  final IFirebaseAuthService _firebaseAuthService =
      GetIt.instance<IFirebaseAuthService>();

  User? userInfo;
  bool userInfoVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Home Screen",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () async {
                  var response = await FirebaseAuth.instance.currentUser;
                  setState(() {
                    userInfo = response;
                  });
                  print("User Response: $userInfo");
                  if (userInfo != null) {
                    setState(() {
                      userInfoVisibility = true;
                    });
                  }
                },
                child: const Text('User Details'),
              ),
            ),
            userInfoVisibility
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("User ID: ${userInfo!.uid}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Email ID: ${userInfo!.email}"),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () async {
                  bool result = await _firebaseAuthService.logoutUser();
                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Logout Successful!!!"),
                      ),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  }
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
