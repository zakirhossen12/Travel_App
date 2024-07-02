// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.network(
          'https://cdn.icon-icons.com/icons2/2582/PNG/512/menu_icon_153999.png',
        ), // Replace with your menu icon URL
        onPressed: () {
          // Handle menu icon press
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.pikpng.com/pngl/b/442-4423833_airport-icon-illustration-clipart.pnghttps://c1.klipartz.com/pngpicture/366/691/sticker-png-airplane-logo-airport-transport-aircraft-travel-aviation-turquoise-air-travel-thumbnail.png',
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            'Travel mate',
            style: TextStyle(color: Colors.green, fontSize: 18),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white, // Adjust color as needed
      actions: [
        IconButton(
          icon: Icon(Icons.person, color: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ],
    );
  }
}
