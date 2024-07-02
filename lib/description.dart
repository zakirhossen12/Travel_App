import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'bottom_nav_bar.dart';
import 'hotel.dart'; // Import the HotelPage here

class DescriptionPage extends StatelessWidget {
  final String placeName;
  final String imageUrl;
  final String description;

  DescriptionPage(
      {required this.placeName,
      required this.imageUrl,
      required this.description});

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
              placeName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(imageUrl, fit: BoxFit.cover),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOption(context, 'Hotel', Icons.hotel, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelPage()),
                  );
                }),
                _buildOption(context, 'Bank', Icons.account_balance, () {}),
                _buildOption(
                    context, 'Car Parking', Icons.local_parking, () {}),
                _buildOption(context, 'Event', Icons.event, () {}),
              ],
            ),
            SizedBox(height: 20),
            Text(
              description,
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
                    SizedBox(height: 8),
                    _buildInfoBox('80 dol/days'),
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
                0, // Set the initial index here or dynamically based on your logic
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: Colors.green),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.green)),
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
