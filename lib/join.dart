import 'package:flutter/material.dart';
import 'signUp.dart';
import 'home.dart';

class JoinFacebook extends StatelessWidget {
  const JoinFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Spacer(),
            // Facebook Logo
            // Center(
            //   child: Image.asset(
            //     'assets/images/facebook_logo.png', // Replace with your logo path
            //     height: 80,
            //   ),
            // ),
            const Spacer(),
            // User Profile
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const MyAppHome(),
                  ),
                );
              },
              leading: const Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 30, // Profile picture size
                  ),
                ],
              ),
              title: const Text(
                'Sanjay Shendy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Handle more actions here
                },
              ),
            ),
            const SizedBox(height: 16),
            // Links
            const ListTile(
              leading: Icon(Icons.add_circle_outline, color: Colors.blue),
              title: Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.search, color: Colors.blue),
              title: Text(
                "Search Account",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            // Create New Account Button with Gradient
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1877F2), Color(0xFF1C9DF2)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 18),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
