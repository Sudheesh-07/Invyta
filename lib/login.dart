import "dart:ui";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Background(),
            Center(
                child: Container(
              height: height * 0.8,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.transparent),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: width * 0.08),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.06,
                                        ),
                                        _Login(),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Username(width: width),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        PasswordField(
                                          width: width,
                                          obscureText: obscureText,
                                          onToggleVisibility: () {
                                            setState(() {
                                              obscureText = !obscureText;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: height * 0.001,
                                        ),
                                        RememberMeCheckbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue!;
                                            });
                                          },
                                        ),
                                      ])),
                              Center(
                                child: _LoginButton(height: height, width: width),
                              ),
                              // SizedBox(
                              //   height: height * 0.01,
                              // ),
                              Center(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle forgot password logic
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: _Divider(),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Image.asset(
                                'assets/icons/google.png', // Path to your Google logo asset
                                height: 42,
                                width: 42,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text(
                                    "Don't have an account? Sign Up",
                                    style: GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
              ),
            )),
          ],
        ));
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.5, -1.2),
          child: Container(
            height: height * 0.4,
            width: width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF530061),
                  Color(0xFF0D0A30),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.5, 1.2),
          child: Container(
            height: height * 0.4,
            width: width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF530061),
                  Color(0xFF0D0A30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Login",
        style: GoogleFonts.notoSans(
            fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Text(
        "Glad You are back!",
        style: GoogleFonts.notoSans(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
      ),
    ]);
  }
}

class Username extends StatelessWidget {
  final double width;
  const Username({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: GoogleFonts.notoSans(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: GoogleFonts.notoSans(color: Colors.white),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final double width;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    required this.width,
    required this.obscureText,
    required this.onToggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: GoogleFonts.notoSans(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: onToggleVisibility,
          ),
        ),
        style: GoogleFonts.notoSans(color: Colors.white),
      ),
    );
  }
}

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMeCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          "Remember me",
          style: GoogleFonts.notoSans(color: Colors.white),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final double height;
  final double width;
  const _LoginButton({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF628EFF),
            Color(0xFF8740CD), // Start color
            Color(0xFF580475), // End color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15), // Match button border radius
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle login logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Make button background transparent
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.28,
            vertical: height * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.transparent, // Remove shadow
        ),
        child: Text(
          "Login",
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Divider(
            height: 25,
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Or",
            style: GoogleFonts.notoSans(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            height: 25,
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
