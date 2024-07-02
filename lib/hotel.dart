import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'bottom_nav_bar.dart';

class HotelPage extends StatelessWidget {
  final String hotelName;
  final String hotelImageUrl;
  final String hotelDescription;

  HotelPage(
      {this.hotelName = "Luxury Hotel",
      this.hotelImageUrl =
          "https://www.pearlhotelbd.com/images/premier-twin/premier-twin-bedroom-daylight.jpg",
      this.hotelDescription =
          "This is a description of the luxury hotel. It has world-class amenities and services to ensure your stay is comfortable and enjoyable."});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              hotelName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(hotelImageUrl, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              hotelDescription,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildInfoBox('5★'),
                    SizedBox(width: 8),
                    _buildInfoBox('80 dol/day'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // background color
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(
            currentIndex:
                1, // Set the initial index here or dynamically based on your logic
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.green, fontSize: 16),
      ),
    );
  }
}
