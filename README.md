# Flutter Firebase Authentication

This project demonstrates Firebase authentication integration in a Flutter application, featuring basic login and signup functionality. The app uses Firebase services to handle user authentication, allowing users to create accounts, log in, and log out. After successful login, users are navigated to the home screen, which displays their details, with an option to log out.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Author](#author)

## Features

- **Firebase Authentication:** Utilizes firebase_auth to handle user sign-up, login, and logout.
- **Login and Signup Screens:** Basic UI with email and password fields for authentication.
- **Navigation Flow:** After account creation, users are navigated to the login screen; post-login, the home screen is displayed with user details.
- **Logout Functionality:** A logout button is available on the home screen, allowing users to log out and return to the login screen.
- **Error Handling:** Displays error messages for invalid login or sign-up attempts.

## Technologies Used

- **Programming Language:** Dart
- **Framework:** Flutter
- **Firebase Services:** `firebase_auth, firebase_core` package
- **Others:**
  - Flutter SDK
  - Android Studio / Visual Studio Code for development
  - Git for version control

## Installation

Follow these steps to get the project up and running locally:

```bash
# Clone the repository
git clone https://github.com/Packiyalakshmi-M/Flutter-Firebase-App.git
# Navigate into the project directory
cd flutter_firebase_app
# Install dependencies
flutter pub get
```

## Usage

The following snippet shows a basic usage of flutter_auth to create, login, and logout the user account:

```
import 'package:flutter_firebase_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseAuthService implements IFirebaseAuthService {
  @override
  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      } else {
        print({"Firebase Exception: ${e.message.toString()}"});
        return false;
      }
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }
  @override
  Future<bool> loginUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false;
      } else if (e.code == 'wrong-password') {
        return false;
      } else {
        print({"Firebase Exception: ${e.message.toString()}"});
        return false;
      }
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }
  @override
  Future<bool> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print({"Exception: ${e.message.toString()}"});
      return false;
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }
}
```

## License

This project is open source and available under the MIT License.

## Author

- Packiyalakshmi Murugan
- [LinkedIn Link](https://www.linkedin.com/in/packiyalakshmi-m-7a9844210/)
- [Github link](https://github.com/Packiyalakshmi-M/)
