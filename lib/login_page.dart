import 'package:flutter/material.dart';
import 'package:gamification_maybe/sign_up.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showNeurodiversitySelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Your Neurodiversity Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionWithLogo(context, 'ADHD', 'assets/ADHD.png'),
              _buildOptionWithLogo(context, 'Autism', 'assets/AUTISM.png'),
              _buildOptionWithLogo(context, 'Dyslexia', 'assets/DYSLEXIS.png'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionWithLogo(BuildContext context, String option, String logoPath) {
    return Column(
      children: [
        Image.asset(logoPath, height: 60), // Display logo above the button
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text(option, style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Icon(Icons.psychology, size: 80, color: Colors.teal),
                    SizedBox(height: 16),
                    Text(
                      'Neurodiverse Support',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Personalized education and employment support',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Please enter your email';
                          if (!value.contains('@')) return 'Please enter a valid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                      ),
                      SizedBox(height: 8),

                      // Remember me & Forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) => setState(() => _rememberMe = value ?? false),
                              ),
                              Text('Remember me'),
                            ],
                          ),
                          TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Login button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showNeurodiversitySelection(context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 24),

                      // Sign up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                            },
                            child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Continue as guest
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Text('Continue as Guest'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
