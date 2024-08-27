import 'package:flutter/material.dart';
import 'package:mcgaming/components/custom_bottom_navbar.dart';
import 'package:mcgaming/components/login_button.dart';
import 'package:mcgaming/components/login_text_field.dart';
import 'package:mcgaming/pages/landing_page.dart';
import 'package:mcgaming/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formfield = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1B1E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formfield,
              child: Column(
                children: [
                  const SizedBox(height: 57),
                        
                  Image.asset(
                    'lib/images/logo_mcgaming.png',
                  ),
                        
                  // welcome back,
                  const Text(
                    'Log In To Your Account!',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                        
                  const SizedBox(height: 25),
                        
                  // username tf
                        
                  LoginTextField(
                    controller: usernameController,
                    hintText: 'Email or Phone Number',
                    obscureText: false,
                    prefixIcon: const Icon(Icons.person, color: Color(0xffAD94C7),),
                  ),
                        
                  const SizedBox(height: 10),
                        
                  // password tf
                        
                  LoginTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock, color: Color(0xffAD94C7),), 
                    suffixIcon: const Icon(Icons.visibility_off, color: Color(0xffAD94C7),),
                  ),
                        
                  const SizedBox(height: 10),
                        
                  // forgot password
                        
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color:
                                  Color(0xffAD94C7)), 
                        ),
                      ],
                    ),
                  ),
                        
                  const SizedBox(height: 10),
                        
                  // sign in button
                        
                  LoginButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserSelectionPage()));
                    },

                  ),
                  
                  const SizedBox(height: 20),
                        
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not A Member?',
                          style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(
                        width: 4,
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          'Register Now!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                        
                  const SizedBox(height: 30),
                        
                  // gambar clow
                        
                  Image.asset(
                    'lib/images/clow_close.png'
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
