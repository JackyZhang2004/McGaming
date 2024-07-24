import 'package:flutter/material.dart';
import 'package:mcgaming/components/login_text_field.dart';
import 'package:mcgaming/components/register_button.dart';
import 'package:mcgaming/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});


  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  void signuserin() {}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1B1E),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A1B1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Logo McGaming
                Image.asset('lib/images/logo_mcgaming.png'),
          
                const Text(
                  'Create An Account!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // email text
          
          
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                        ), // Use the hex color code here
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 10),
          
          
                // email tf
          
                LoginTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
          
                // password text
                const SizedBox(height: 20),
          
          
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                        ), // Use the hex color code here
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 10),
          
                // password tf
          
                LoginTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 20),
          
          
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Password Confirmation',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                        ), // Use the hex color code here
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 10),
          
                // confirm password tf
          
                LoginTextField(
                  controller: passwordConfirmationController,
                  hintText: 'Password Confirmation',
                  obscureText: true,
                ),
          
                // button

                const SizedBox(height: 20),

                RegisterButton(
                  onTap: signuserin
                ),

                const SizedBox(height: 10),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have Account?',
                        style: TextStyle(color: Colors.grey[700])),
                    const SizedBox(
                      width: 4,
                    ),
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        'Log In Now!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                
          
                // gambar clow

                Image.asset(
                  'lib/images/clow_close.png'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
