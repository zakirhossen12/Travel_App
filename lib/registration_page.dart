import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_page.dart'; // Import the LoginPage

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _photoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(
            'https://task-management-backend-vhcq.onrender.com/api/v1/registration'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'mobile': _mobileController.text,
          'photo': _photoController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(), // Navigate to LoginPage
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Registration success')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.statusCode}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: _emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter email';
                  } else if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _firstNameController,
                labelText: 'First Name',
                validator: (value) =>
                    value!.isEmpty ? 'Enter first name' : null,
              ),
              _buildTextField(
                controller: _lastNameController,
                labelText: 'Last Name',
                validator: (value) => value!.isEmpty ? 'Enter last name' : null,
              ),
              _buildTextField(
                controller: _mobileController,
                labelText: 'Mobile',
                validator: (value) =>
                    value!.isEmpty ? 'Enter mobile number' : null,
              ),
              _buildTextField(
                controller: _photoController,
                labelText: 'Photo URL',
                validator: (value) => value!.isEmpty ? 'Enter photo URL' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Set the background color to green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Already have an account? Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
