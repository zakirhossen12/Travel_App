// profile.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'), // Replace with your image URL
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Md Zakir Hossen',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 5),
                            Text('Edit'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Interests:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 10,
                children: [
                  Chip(label: Text('Environment')),
                  Chip(label: Text('Animal')),
                  Chip(label: Text('Social')),
                  Chip(label: Text('Health')),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'General:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Full Name'),
                subtitle: Text('Md Zakir Hossen'),
              ),
              ListTile(
                title: Text('Class Roll'),
                subtitle: Text('20CSE037'),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text('zakirhossen@gmail.com'),
              ),
              ListTile(
                title: Text('Phone'),
                subtitle: Text('017433333'),
              ),
              SizedBox(height: 5),
              Text(
                'Additional:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1),
              Text('Zakir is a good boy.'),
            ],
          ),
        ),
      ),
    );
  }
}
