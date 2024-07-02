import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'bottom_nav_bar.dart';
import 'description.dart'; // Import the description.dart file

class CountryPage extends StatelessWidget {
  final String countryName;
  final String imageUrl;
  final String description;

  CountryPage(
      {required this.countryName,
      required this.imageUrl,
      this.description = ''});

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
            Center(
              child: Text(
                countryName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOption('All', Icons.category),
                _buildOption('Destinations', Icons.place),
                _buildOption('Cities', Icons.location_city),
                _buildOption('Experiences', Icons.explore),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Place',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 16),
            _buildCountryList(context),
            SizedBox(height: 20),
            _buildSubtitle('Recommended'),
            SizedBox(height: 10),
            _buildRecommendedList(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex:
            0, // Set the initial index here or dynamically based on your logic
      ),
    );
  }

  Widget _buildOption(String title, IconData icon) {
    return Column(
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
    );
  }

  Widget _buildSubtitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.green, fontSize: 18),
    );
  }

  Widget _buildCountryList(BuildContext context) {
    // Example data for country names and ratings
    List<Map<String, dynamic>> countries = [
      {
        'name': 'cox bazar',
        'image':
            'https://images.prothomalo.com/prothomalo-english%2Fimport%2Fmedia%2F2019%2F10%2F29%2F4c567690cd3663ddb127dc60c27e5ae6-Tourism-1.jpeg?rect=133%2C0%2C1020%2C680&auto=format%2Ccompress&fmt=webp&dpr=1.0&format=webp&w=480',
        'rating': '4.5',
      },
      {
        'name': '60 Gombuj',
        'image':
            'https://media.licdn.com/dms/image/D4E12AQGtpZo170yJQg/article-cover_image-shrink_600_2000/0/1692609120860?e=2147483647&v=beta&t=YmDkL_g-5GmG5FcJICLml-vJL5SWc88QKHEGdNFK5kk',
        'rating': '4.8',
      },
      {
        'name': 'Ahsan manjil',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlYbSzVCuFZGFOHQSBUyukukncGeh_TWygzw&s',
        'rating': '4.3',
      },
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionPage(
                    placeName: countries[index]['name'],
                    imageUrl: countries[index]['image'],
                    description:
                        'Cox Bazar is a city, fishing port, tourism center, and district headquarters in southeastern Bangladesh. It is famous mostly for its long natural sandy beach, and it is infamous for the largest refugee camp in the world. It is located 150 km (93 mi) south of the divisional headquarter city of Chittagong. ${countries[index]['name']}', // Replace with actual description
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(countries[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Color(0xff39d05f), size: 16),
                        SizedBox(width: 4),
                        Text(countries[index]['name'],
                            style: TextStyle(color: Colors.white)),
                        Spacer(),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(countries[index]['rating'],
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendedList(BuildContext context) {
    // Example data for recommended places
    List<Map<String, dynamic>> recommended = [
      {
        'name': 'Ahsan manjil',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlYbSzVCuFZGFOHQSBUyukukncGeh_TWygzw&s',
        'rating': '4.3',
      },
      {
        'name': 'cox bazar',
        'image':
            'https://images.prothomalo.com/prothomalo-english%2Fimport%2Fmedia%2F2019%2F10%2F29%2F4c567690cd3663ddb127dc60c27e5ae6-Tourism-1.jpeg?rect=133%2C0%2C1020%2C680&auto=format%2Ccompress&fmt=webp&dpr=1.0&format=webp&w=480',
        'rating': '4.5',
      },
      {
        'name': '60 Gombuj',
        'image':
            'https://media.licdn.com/dms/image/D4E12AQGtpZo170yJQg/article-cover_image-shrink_600_2000/0/1692609120860?e=2147483647&v=beta&t=YmDkL_g-5GmG5FcJICLml-vJL5SWc88QKHEGdNFK5kk',
        'rating': '4.8',
      },
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionPage(
                    placeName: recommended[index]['name'],
                    imageUrl: recommended[index]['image'],
                    description: recommended[index]['description'],
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(recommended[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Color(0xff39d05f), size: 16),
                        SizedBox(width: 4),
                        Text(recommended[index]['name'],
                            style: TextStyle(color: Colors.white)),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CountryPage(
      countryName: 'Bangladesh',
      imageUrl:
          'https://www.shutterstock.com/image-photo/stock-photo-colorful-wooden-fishing-600nw-1713901126.jpg',
      description: 'Beautiful place in Bangladesh',
    ),
  ));
}
