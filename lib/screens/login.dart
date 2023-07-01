import 'package:flutter/material.dart';
import 'package:flutter_proxigo_v1/constants/constants.dart';
import 'package:line_icons/line_icons.dart';
import '../widgets/widgets.dart';

// Define a Login class that extends StatelessWidget
class Login extends StatelessWidget {
  // Constructor for Login, taking an optional Key parameter
  const Login({super.key});

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return an instance of MyScaffold with specific drawer and body properties
    return MyScaffold(
      drawer: drawer,
      body: SingleChildScrollView(
        // The child of the SingleChildScrollView is a Container with specific padding and several children widgets
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // The first child is a Container with specific padding, alignment, and child properties
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                alignment: Alignment.center,
                child: const Text(
                  "Pour vous connecter, \nveuillez remplir les champs ci-dessous",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              // The second child is a SizedBox with fixed height for spacing
              const SizedBox(
                height: 30.0,
              ),
              // The third child is an instance of LoginForm
              const LoginForm(),
              // The fourth child is another SizedBox with fixed height for spacing
              const SizedBox(
                height: 70.0,
              ),
              // The fifth child is a Column with stretch crossAxisAlignment and several children widgets
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // The first child is another SizedBox with fixed height for spacing
                  const SizedBox(
                    height: 10.0,
                  ),
                  // The second, third, and fourth children are instances of SocialButton with specific text, icon, iconColor, and onPressed properties
                  SocialButton(
                      text: 'Se connecter avec Google',
                      icon: LineIcons.googlePlus,
                      iconColor: proxigoBlue,
                      onPressed: () {}),
                  SizedBox(height: 20),
                  SocialButton(
                      text: "Se connecter avec Apple",
                      icon: LineIcons.apple,
                      iconColor: proxigoBlue,
                      onPressed: () {}),
                  SizedBox(height: 20),
                  SocialButton(
                      text: 'Se connecter avec Facebook',
                      icon: LineIcons.facebook,
                      iconColor: proxigoBlue,
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
