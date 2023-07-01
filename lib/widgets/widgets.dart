import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proxigo_v1/screens/login.dart';
import 'package:latlong2/latlong.dart';
import '../constants/constants.dart';
import '../bloc/bottomNavigationBloc.dart';

// Define a class to hold application constants
class AppConstants {
  // Define a constant for the MapBox access token
  static const String mapBoxAccessToken = '';

  // Define a constant for the MapBox style ID, including the access token
  static const String mapBoxStyleId = "?access_token="; //add your token here

  // Define a constant for the default location as a LatLng object
  static const myLocation = LatLng(43.625, 3.862);
}

// Define a dynamic variable for the AppBar of the Proxigo app
dynamic appBarProxigo = AppBar(
    // Set the background color of the AppBar
    backgroundColor: proxigoBlue,
    // Automatically imply leading navigation actions
    automaticallyImplyLeading: true,
    // Center the title of the AppBar
    centerTitle: true,
    // Set the title of the AppBar to be a Text widget with the text "MyApp"
    title: Text('MyApp'));

// Define a SocialButton class that extends StatelessWidget
class SocialButton extends StatelessWidget {
  // Define final fields for the text, icon, icon color, and onPressed callback
  final String text;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  // Constructor for SocialButton, taking required named parameters for all fields
  const SocialButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return a Container with a fixed height of 45.0
    return Container(
      height: 45.0,
      // The child of the Container is an ElevatedButton
      child: ElevatedButton(
        // Set the style of the ElevatedButton using ButtonStyle
        style: ButtonStyle(
          // Set the background color to white for all states
          backgroundColor: MaterialStateProperty.all(Colors.white),
          // Set the minimum size of the button to be Size(180,110)
          minimumSize: MaterialStateProperty.all(const Size(180, 110)),
          // Set the shape of the button to be a RoundedRectangleBorder with a circular border radius of 15
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        // Set the onPressed callback to be the onPressed field passed in through the constructor
        onPressed: onPressed,
        // The child of the ElevatedButton is a Row containing an Icon and an Expanded Text widget
        child: Row(
          children: <Widget>[
            // The first child is an Icon with the icon and color specified in the constructor
            Icon(
              icon,
              color: iconColor,
            ),
            // The second child is an Expanded Text widget with centered text and a specific style
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: proxigoBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define a LoginForm class that extends StatefulWidget
class LoginForm extends StatefulWidget {
  // Constructor for LoginForm, taking an optional Key parameter
  const LoginForm({Key? key}) : super(key: key);

  // Override the createState method to return an instance of _LoginFormState
  @override
  _LoginFormState createState() => _LoginFormState();
}

// Define a private _LoginFormState class that extends State<LoginForm>
class _LoginFormState extends State<LoginForm> {
  // Define TextEditingController fields for the email and password inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Define nullable String fields for the email and password errors
  String? _emailError;
  String? _passwordError;

  // Override the initState method to add listeners to the email and password controllers
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
  }

  // Override the dispose method to remove listeners from the email and password controllers
  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _passwordController.removeListener(_validatePassword);
    super.dispose();
  }

  // Define a private method to validate the email input
  void _validateEmail() {
    // Get the current text of the email controller
    final String email = _emailController.text;
    // Use a regular expression to check if the email is valid
    final bool isValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    // Update the state to set the email error message if the email is not valid
    setState(() {
      _emailError = isValid ? null : 'Adresse email invalide';
    });
  }

  // Define a private method to validate the password input
  void _validatePassword() {
    // Get the current text of the password controller
    final String password = _passwordController.text;
    // Use a regular expression to check if the password is valid
    final bool isValid =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
    // Update the state to set the password error message if the password is not valid
    setState(() {
      _passwordError = isValid ? null : 'Mot de passe invalide';
    });
  }

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return a Column with centered crossAxisAlignment and several children widgets
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // The first child is a Container with fixed width and height containing a TextField for email input
        Container(
          width: 300,
          height: 40,
          child: TextField(
            // Set the controller of the TextField to be the email controller
            controller: _emailController,
            // Set the vertical alignment of the text to be bottom
            textAlignVertical: TextAlignVertical.bottom,
            // Set decoration properties for the TextField, including hint text, fill color, border, and error text
            decoration: InputDecoration(
              hintText: 'Votre email',
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              errorText: _emailError,
            ),
          ),
        ),
        // The second child is a SizedBox with fixed height for spacing
        const SizedBox(
          height: 20.0,
        ),
        // The third child is a Container with fixed width and height containing a TextField for password input
        Container(
          width: 300,
          height: 40,
          child: TextField(
            // Set the controller of the TextField to be the password controller
            controller: _passwordController,
            // Set the vertical alignment of the text to be bottom
            textAlignVertical: TextAlignVertical.bottom,
            // Set decoration properties for the TextField, including hint text, fill color, border, and error text
            decoration: InputDecoration(
              hintText: 'Votre mot de passe',
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              errorText: _passwordError,
            ),
          ),
        ),
        // The fourth child is another SizedBox with fixed height for spacing
        const SizedBox(
          height: 20.0,
        ),
        // The fifth child is a Text widget with specific style for forgotten password link
        const Text(
          "Mot de passe oublié ?",
          style: TextStyle(
              color: Colors.white, decoration: TextDecoration.underline),
        ),
        // The sixth child is another SizedBox with fixed height for spacing
        const SizedBox(
          height: 25.0,
        ),
        // The seventh child is a Container with fixed width and height containing an ElevatedButton for login
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          child: ElevatedButton(
            // Set the style of the ElevatedButton using ButtonStyle
            style: ButtonStyle(
              // Set the background color to proxigoBlue for all states
              backgroundColor: MaterialStateProperty.all(proxigoBlue),
              // Set the minimum size of the button to be Size(180,110)
              minimumSize: MaterialStateProperty.all(const Size(180, 110)),
              // Set the shape of the button to be a RoundedRectangleBorder with a circular border radius of 15
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
            ),
            // Set the onPressed callback to be an empty function for now
            onPressed: () {
              // Navigator.of(context).push(route);
            },
            // The child of the ElevatedButton is a Text widget with specific style and text
            child: const Text(
              "S'IDENTIFIER",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

// Define a final variable for the drawer of the app
final drawer = Drawer(
  // Set the background color of the drawer to proxigoBlue
  backgroundColor: proxigoBlue,
  // The child of the drawer is a Stack containing two children
  child: Stack(
    children: [
      // The first child is a ListView with zero padding and several children widgets
      ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // The first child is a DrawerHeader with specific decoration and child properties
          const DrawerHeader(
            decoration: BoxDecoration(
              color: proxigoBlue,
            ),
            child: Text(
              'MENU',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          // The second child is a Builder that returns a ListTile for login
          Builder(builder: (context) {
            return ListTile(
              title: const Text(
                'SE CONNECTER',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // On tap, navigate to the Login screen using MaterialPageRoute
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Login();
                    },
                  ),
                );
              },
            );
          }),
          // The third child is a ListTile for registration
          ListTile(
            title: const Text(
              'S\'ENREGISTRER',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          // The fourth child is a ListTile for services
          ListTile(
            title: const Text(
              'SERVICES',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          // The fifth child is a ListTile for FAQ
          ListTile(
            title: const Text(
              'FAQ',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
        ],
      ),
      // The second child is a Positioned widget containing an IconButton for logout
      Positioned(
        // Position the IconButton at the bottom right of the Stack
        bottom: 16,
        right: 16,
        child: IconButton(
          // Set the icon of the IconButton to be Icons.logout
          icon: Icon(Icons.logout),
          // Set the color of the icon to be white
          color: Colors.white,
          // Set the size of the icon to be 50
          iconSize: 50,
          onPressed: () {
            // Add logic here for logging out of your application
          },
        ),
      ),
    ],
  ),
);

// Define a MyScaffold class that extends StatelessWidget and takes required named parameters for body and drawer
class MyScaffold extends StatelessWidget {
  final Widget body;
  final Drawer drawer;

  const MyScaffold({Key? key, required this.body, required this.drawer})
      : super(key: key);

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return a BlocProvider that provides a BottomNavigationBloc to its descendants
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      // Use BlocBuilder to build a Scaffold based on the state of BottomNavigationBloc
      child: BlocBuilder<BottomNavigationBloc, List<String>>(
        builder: (context, state) {
          return Scaffold(
            // Set properties of the Scaffold, including appBar, backgroundColor, drawer, body, and bottomNavigationBar
            appBar: appBarProxigo,
            backgroundColor: backgroundProxigo,
            drawer: drawer,
            body: body,
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: proxigoBlue,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                items: state
                    .map((e) => BottomNavigationBarItem(
                        icon: Icon(Icons.home, color: Colors.white), label: e))
                    .toList(),
                onTap: (index) {
                  context
                      .read<BottomNavigationBloc>()
                      .updatePage(state[index], context);
                }),
          );
        },
      ),
    );
  }
}
