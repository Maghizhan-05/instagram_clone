import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/utlis/colors.dart';
import 'package:instagram_clone/utlis/utils.dart';
import 'package:instagram_clone/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //It is a text editing controller that controls whether the given String is email or not, and the ensures the fields are unique
  final TextEditingController _emailaddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  //The "?" is added because the _image can be a null value.
  Uint8List? _image;


  //Used to dispose email and password after login, secure code practice.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailaddressController.dispose();
    _passwordController.dispose();
  }
  // It is a function that is used by the Icon to add profile photo in our app, It uses another function called pickImage which is defined in another file called Utlis.dart
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // setstate function is used to change the state of the widget after the button is clicked.
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 68,
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  //We are using a ternary operator here to select image from the user or display the default image.
                  _image != null
                      ? CircleAvatar(
                          radius: 68,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 68,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 85,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextInput(
                  textInputType: TextInputType.text,
                  hinText: 'Enter your username',
                  textEditingController: _usernameController),
              SizedBox(
                height: 30,
              ),
              TextInput(
                  textInputType: TextInputType.emailAddress,
                  hinText: 'Enter your email address',
                  textEditingController: _emailaddressController),
              SizedBox(
                height: 30,
              ),
              TextInput(
                textInputType: TextInputType.text,
                hinText: 'Enter your password',
                textEditingController: _passwordController,
                isPass: true,
              ),
              SizedBox(
                height: 30,
              ),
              TextInput(
                  textInputType: TextInputType.text,
                  hinText: 'Write your bio',
                  textEditingController: _bioController),
              SizedBox(
                height: 30,
              ),
              InkWell(
                // Using the Authmethods() class and signUpUser function to get and store the email, pass, bio and username and also the profile image if it is defined.
                onTap: () async {
                  String res = await Authmethods().signUpUser(
                      email: _emailaddressController.text,
                      password: _passwordController.text,
                      username: _usernameController.text,
                      bio: _bioController.text,
                      file: _image!);
                },
                child: Container(
                  child: const Text('Sign Up'),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Already have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),

              //password input
              //button
            ],
          ),
        ),
      ),
    );
  }
}
