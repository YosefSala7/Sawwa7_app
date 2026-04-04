import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/navbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _obPassword = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double horizontalPadding = (size.width * 0.08).clamp(12.0, 40.0);
    final double formFieldHeight = (size.height * 0.085).clamp(48.0, 90.0);
    final double headerHeight = (size.height * 0.25).clamp(200.0, 340.0);
    final double spacingSmall = (size.height * 0.01).clamp(8.0, 18.0);
    final double spacingMedium = (size.height * 0.025).clamp(12.0, 28.0);
    final double spacingLarge = (size.height * 0.05).clamp(20.0, 60.0);
    final double titleFontSize = (size.width * 0.11).clamp(20.0, 50.0);
    final double subtitleFontSize = (size.width * 0.04).clamp(12.0, 20.0);
    final double buttonFontSize = (size.width * 0.055).clamp(14.0, 24.0);
    final double inputVerticalPadding = (size.height * 0.018).clamp(8.0, 28.0);
    final double inputHorizontalPadding = (size.width * 0.03).clamp(8.0, 20.0);

    final double socialBtnHeight = (size.height * 0.06).clamp(40.0, 56.0);
    final double socialBtnWidth = (size.width * 0.27).clamp(90.0, 140.0);
    final double socialIconSize = (size.width * 0.075).clamp(20.0, 36.0);

    final double lineThickness = (size.width * 0.0015).clamp(1.0, 2.0);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                // Header
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(50, 40),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 254, 141, 0),
                        Color.fromARGB(255, 94, 56, 12),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SizedBox(
                    height: headerHeight,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // back button row
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color.fromARGB(255, 33, 33, 33),
                              ),
                            ),
                          ],
                        ),
                        // title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      33,
                                      33,
                                      33,
                                    ),
                                    fontFamily: "norse-bold",
                                    fontSize: titleFontSize,
                                    letterSpacing: 4,
                                  ),
                                ),
                                SizedBox(height: spacingSmall),
                                Text(
                                  "let's Create your account",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      33,
                                      33,
                                      33,
                                    ),
                                    fontFamily: "norse-bold",
                                    fontSize: subtitleFontSize,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: spacingLarge * 0.6),
                      ],
                    ),
                  ),
                ),
                // Form
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: spacingLarge),
                        SizedBox(
                          height: formFieldHeight,
                          child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            cursorColor: const Color.fromARGB(255, 0, 0, 0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Fill The Email";
                              }
                              if (!value.endsWith("@gmail.com")) {
                                return 'write email in th right format';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              helperText: ' ',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: inputVerticalPadding,
                                horizontal: inputHorizontalPadding,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(
                                200,
                                255,
                                255,
                                255,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(CupertinoIcons.mail),
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 254, 141, 0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacingSmall),
                        SizedBox(
                          height: formFieldHeight,
                          child: TextFormField(
                            controller: _nameController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            cursorColor: const Color.fromARGB(255, 0, 0, 0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Fill The Name";
                              }
                              if (value.length < 7) return "At least 7";
                              return null;
                            },
                            decoration: InputDecoration(
                              helperText: ' ',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: inputVerticalPadding,
                                horizontal: inputHorizontalPadding,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(
                                200,
                                255,
                                255,
                                255,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(CupertinoIcons.pen),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 254, 141, 0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacingSmall),
                        // Password
                        SizedBox(
                          height: formFieldHeight,
                          child: TextFormField(
                            controller: _passwordController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            cursorColor: const Color.fromARGB(255, 0, 0, 0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Fill The Password";
                              }
                              if (value.length < 9) return 'at least 9';
                              return null;
                            },
                            maxLength: 15,
                            keyboardType: TextInputType.text,
                            obscureText: _obPassword,
                            decoration: InputDecoration(
                              helperText: ' ',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: inputVerticalPadding,
                                horizontal: inputHorizontalPadding,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(
                                200,
                                255,
                                255,
                                255,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              prefixIcon: const Icon(CupertinoIcons.lock),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _obPassword = !_obPassword),
                                icon: Icon(
                                  _obPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 254, 141, 0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacingMedium / 2),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async{
                              final supabase = Supabase.instance.client;
                              final AuthResponse res = await supabase.auth.signUp(
                                email: _emailController.text.trim(),
                                password: _passwordController.text ,
                              );
                              if (_formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Validated — form is OK'),
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NavBar(title: ''),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: spacingSmall,
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                254,
                                141,
                                0,
                              ),
                              foregroundColor: const Color.fromARGB(
                                255,
                                33,
                                33,
                                33,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: Size(0, (spacingSmall * 1.4)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: spacingSmall / 8,
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: buttonFontSize,
                                  fontFamily: "norse-bold",
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: spacingSmall),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  const Color.fromARGB(0, 255, 214, 64),
                                ),
                                foregroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(255, 254, 141, 0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "forgot password?",
                                style: TextStyle(
                                  fontSize: (size.width * 0.035).clamp(
                                    12.0,
                                    14.0,
                                  ),
                                  fontFamily: "norse-bold",
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    children: [
                      Flexible(
                        child: Divider(
                          color: const Color.fromARGB(133, 255, 255, 255),
                          thickness: lineThickness,
                          height: spacingMedium,
                        ),
                      ),

                      SizedBox(width: horizontalPadding / 2),

                      Text(
                        "Or Sign Up With",
                        style: TextStyle(
                          color: const Color.fromARGB(133, 255, 255, 255),
                          fontFamily: "norse-bold",
                          fontSize: subtitleFontSize / 1.2,
                          letterSpacing: 2,
                        ),
                      ),

                      // gap
                      SizedBox(width: horizontalPadding / 2),

                      Flexible(
                        child: Divider(
                          color: const Color.fromARGB(133, 255, 255, 255),
                          thickness: lineThickness,
                          height: spacingMedium,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: spacingLarge * 0.6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: socialBtnHeight,
                        width: socialBtnWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: socialIconSize,
                              width: socialIconSize,
                              child: Image.asset(
                                "images/Google.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                fontSize: (size.width * 0.032).clamp(
                                  11.0,
                                  14.0,
                                ),
                                fontFamily: "norse-bold",
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: socialBtnHeight,
                        width: socialBtnWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: socialIconSize,
                              width: socialIconSize,
                              child: Image.asset(
                                "images/apple.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "Apple",
                              style: TextStyle(
                                fontSize: (size.width * 0.032).clamp(
                                  11.0,
                                  14.0,
                                ),
                                fontFamily: "norse-bold",
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: socialBtnHeight,
                        width: socialBtnWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: socialIconSize * 1.05,
                              width: socialIconSize * 1.05,
                              child: Image.asset(
                                "images/facebook.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                fontSize: (size.width * 0.03).clamp(11.0, 13.5),
                                fontFamily: "norse-bold",
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: spacingLarge * 0.6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(
                        color: const Color.fromARGB(133, 255, 255, 255),
                        fontFamily: "norse-regular",
                        fontSize: subtitleFontSize,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 254, 141, 0),
                          fontFamily: "norse-bold",
                          fontSize: subtitleFontSize,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: spacingLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
