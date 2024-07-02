import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'bottom_nav_bar.dart';
import 'country.dart'; // Import the country.dart file

class CategoryPage extends StatelessWidget {
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
              'Discover',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
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
            _buildSubtitle('Country'),
            SizedBox(height: 10),
            _buildCountryList(context), // Pass context to the method
            SizedBox(height: 20),
            _buildSubtitle('Popular'),
            SizedBox(height: 10),
            _buildPopularList(context), // Pass context to the method
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
        'name': 'Bangladesh',
        'image':
            'https://www.shutterstock.com/image-photo/stock-photo-colorful-wooden-fishing-600nw-1713901126.jpg',
        'rating': '4.5',
      },
      {
        'name': 'India',
        'image':
            'https://www.thetimes.com/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fd816db6f-2e6a-4f1f-8830-6b38a70d5ee5.jpg?crop=1320%2C880%2C440%2C0',
        'rating': '4.8',
      },
      {
        'name': 'Thailand',
        'image':
            'https://fanclubthailand.co.uk/wp-content/uploads/2022/12/Thailand-Travel-Advice_Grand-Palace-Bangkok-1600.jpg',
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
                  builder: (context) => CountryPage(
                    countryName: countries[index]['name'],
                    imageUrl: countries[index]['image'],
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

  Widget _buildPopularList(BuildContext context) {
    // Replace with your implementation of popular countries list
    return Column(
      children: [
        _buildPopularListItem(
          context,
          'Singapore',
          'https://cdn.insuremytrip.com/resources/40781/singapore_travel_insurance_marina_bay.jpg',
          'Ensure a smooth sailing travel.',
        ),
        Divider(),
        _buildPopularListItem(
          context,
          'India',
          'https://www.thetimes.com/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fd816db6f-2e6a-4f1f-8830-6b38a70d5ee5.jpg?crop=1320%2C880%2C440%2C0',
          'Explore Indian culture',
        ),
        Divider(),
        _buildPopularListItem(
          context,
          'Bangladesh',
          'https://www.shutterstock.com/image-photo/stock-photo-colorful-wooden-fishing-600nw-1713901126.jpg',
          'Visit Bangladesh nature',
        ),
        Divider(), // Add more ListTile as needed
      ],
    );
  }

  Widget _buildPopularListItem(
      BuildContext context, String title, String imageUrl, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryPage(
              countryName: title,
              imageUrl: imageUrl,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          tileColor: Colors.white, // Use white or any other color you prefer
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(title),
          subtitle: Text(description),
          trailing: Icon(Icons.location_on, color: Colors.green),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void main() {
  runApp(MaterialApp(
    home: CategoryPage(),
  ));
}
