import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      flexibleSpace: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.only(top: 60, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 11,
                  fontFamily: 'Nunito-Regular',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Consultation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito-Bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WhatDoYouNeed(),
          SizedBox(height: 20),
          ThreeBoxes(),
          SizedBox(height: 20), // Add some spacing
          ArticlesWidget(), // Include the ArticlesWidget here
          SizedBox(height: 20), // Add some spacing
          CustomTabBar(), // Include the CustomTabBar here
          SizedBox(height: 20), // Add some spacing

          // Add a new widget for the API connection box
          ApiConnectionBoxtoArticles(),

          // Include the articles1 widget
        ],
      ),
    );
  }
}

class WhatDoYouNeed extends StatelessWidget {
  const WhatDoYouNeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(19),
          image: const DecorationImage(
            image: AssetImage('assets/images/x.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'What do you need?',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 16.7489, // Adjusted font size
                letterSpacing: -0.022,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThreeBoxes extends StatelessWidget {
  const ThreeBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.95,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildBox1(),
            const SizedBox(width: 10),
            buildBox2(),
            const SizedBox(width: 10),
            buildBox3(),
            // Add more boxes as needed
          ],
        ),
      ),
    );
  }
}

Widget buildBox1() {
  return InkWell(
    child: Stack(
      children: [
        Container(
          width: 182,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background_widget.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'Appointment',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBox2() {
  return InkWell(
    child: Stack(
      children: [
        Container(
          width: 182,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background_widget.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'Medicine',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBox3() {
  return InkWell(
    child: Stack(
      children: [
        Container(
          width: 182,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 1,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background_widget.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'confide',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, top: 4),
      child: Text(
        'Articles',
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 17 / 14.7489, // Set the line height
          letterSpacing: -0.022,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, top: 0),
      height: 33,
      width: 429.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildTab('Family', const Color.fromARGB(255, 255, 255, 255), 0),
            buildTab('Self esteem', const Color.fromARGB(255, 0, 0, 0), 1),
            buildTab('Sleep', const Color.fromARGB(255, 255, 255, 255), 2),
            buildTab('Social', const Color.fromARGB(255, 255, 255, 255), 3),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String label, Color backgroundColor, int order) {
    return Container(
      margin: EdgeInsets.only(right: 9.43),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(93.5714),
        border: Border.all(
            color: Colors.black.withOpacity(0.942857), width: 0.942857),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.42857, horizontal: 20.2),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            fontSize: 15.0857,
            color: backgroundColor == Colors.white
                ? Colors.black
                : Colors.white.withOpacity(0.942857),
          ),
        ),
      ),
    );
  }
}

class ApiConnectionBoxtoArticles extends StatelessWidget {
  Future<List<String>> fetchWebsites() async {
    final response = await http.get(
        Uri.parse('https://www.mentalhelp.net/self-esteem/why-its-important/'));

    if (response.statusCode == 200) {
      // If the API call is successful, parse the JSON response
      final List<dynamic> data = json.decode(response.body);

      // Convert data to List<String> (e.g., take the title)
      List<String> titles =
          data.map((item) => item['title'].toString()).toList();

      return titles;
    } else {
      // If the API call fails, throw an exception or return an empty list
      throw Exception('Failed to load websites');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(1),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          FutureBuilder<List<String>>(
            future: fetchWebsites(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Text('No data available');
              } else {
                // Tampilkan daftar website di sini
                List<String> websites = snapshot.data!;
                return Column(
                  children: websites.map((website) => Text(website)).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ConsultationScreen(),
  ));
}
