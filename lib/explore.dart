import 'package:flutter/material.dart';
import 'category.dart';
import 'custom_app_bar.dart'; // Import the CustomAppBar

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use CustomAppBar here
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://img.freepik.com/free-photo/traveling-concept-with-landmarks_23-2149153261.jpg', // Replace with your photo URL
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Add horizontal padding
                child: Text(
                  'Explore\nTravel\nInspire',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff21c6b0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Add horizontal padding
                child: Text(
                  'Life is all about journey\nFind yours',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xb35495ea),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Set button background color to green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Get Started',
                            style: TextStyle(
                                color:
                                    Colors.white)), // Set text color to white
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward,
                            color: Colors.white), // Set icon color to white
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
