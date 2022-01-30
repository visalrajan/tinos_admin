// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tinos_admin/userpage/register.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // var defaultEmail = "tinos@gmail.com";
//   // var defaultPassword = "12345678";
//
//   static Future<User?> loginUsingEmailPassword(
//
//       {
//         required String email,
//         required String password,
//         required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         print("No User found that email");
//       }
//     }
//     return user;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     return Center(
//       child: SingleChildScrollView(
//         reverse: true,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               child: Text(
//                 "TINOS",
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               child: Text(
//                 "Username",
//                 style: TextStyle(
//                   // fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Container(
//               child: TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   // labelText: "User Name",
//                   border: InputBorder.none,
//                   hintText: "Your username here",
//                   prefixIcon: Icon(
//                     Icons.mail,
//                     color: Colors.teal,
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.teal, width: 2),
//
//
//               ),
//             ),
//             const SizedBox(
//               height: 26.0,
//             ),
//             Container(
//               child: Text(
//                 "Password",
//                 style: TextStyle(
//                   // fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Your Password here",
//                   prefixIcon: Icon(
//                     Icons.lock,
//                     color: Colors.teal,
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.teal, width: 2),
//
//               ),
//             ),
//             const SizedBox(
//               height: 70.0,
//             ),
//             Container(
//               width: double.infinity,
//               child: RawMaterialButton(
//                 fillColor: Colors.teal,
//                 elevation: 0.0,
//                 padding: EdgeInsets.symmetric(vertical: 12.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 onPressed: () async {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.purple,
//                             strokeWidth: 6.0,
//                           ),
//                         );
//                       });
//                   User? user = await loginUsingEmailPassword(
//                       email: _emailController.text,
//                       password: _passwordController.text,
//                       context: context);
//                   print(user);
//                   if (user != null) {
//
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => UserPage()));
//                     }
//                   },
//
//
//                 child: const Text(
//                   "PROCEED",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// Packages

import 'package:iconsax/iconsax.dart';
import 'package:tinos_admin/bottom_navigationbar_page/bottom_navigationbar_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Firebase Auth
  static Future<User?> loginUsingEmailPassword(

      {
        required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found that email");
      }
    }
    return user;
  }

  // BottomNavBar Index
  int activeIndex = 0;
  // Input Fields
  // late String email;
  // late String password;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 50), (timer) {
      setState(() {
        activeIndex++;
        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 350,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: activeIndex == 0 ? 1 : 0,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png',
                        height: 400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: activeIndex == 1 ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png',
                        height: 400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: activeIndex == 2 ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png',
                        height: 400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: activeIndex == 3 ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png',
                        height: 400,
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                // onChanged: (value) {
                //   email = value;
                // },
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0.0),
                  labelText: 'Email',
                  hintText: 'Username or e-mail',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  prefixIcon: const Icon(
                    Iconsax.user,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                // onChanged: (value) {
                //   password = value;
                // },
                controller: _passwordController,
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0.0),
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(
                    Iconsax.key,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
    onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.purple,
                            strokeWidth: 6.0,
                          ),
                        );
                      });
                  User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BottomBarPage()));
                    }
                  },

                height: 45,
                color: Colors.black,
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

