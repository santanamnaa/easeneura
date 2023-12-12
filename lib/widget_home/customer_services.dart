import 'package:flutter/material.dart';

class CustServ extends StatelessWidget {
  const CustServ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
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
                'Customer Service',
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

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SixBoxes(),
          FAQline(),
        ],
      ),
    );
  }
}

class SixBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Adjust the padding as needed
        child: Container(
          color: const Color.fromARGB(
              255, 255, 255, 255), // Set your desired background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Help & Support',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito-Bold',
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/CSBox.png', // Replace with the actual path to your image
                fit: BoxFit.contain, // Adjust the BoxFit property as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQline extends StatefulWidget {
  @override
  _FAQlineState createState() => _FAQlineState();
}

class _FAQlineState extends State<FAQline> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqItems.length,
          itemBuilder: (context, index) => ExpansionTile(
            title: Text(
              faqItems[index].question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  faqItems[index].description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is Easeneura?',
      description:
          'Easeneura is a cutting-edge mental health application designed to empower individuals on their journey to emotional well-being. Our platform offers a range of tools and resources to help users manage stress, anxiety, and other mental health concerns through personalized strategies and evidence-based techniques.',
    ),
    FAQItem(
      question: 'How does Easeneura help with mental health?',
      description:
          'Easeneura employs a holistic approach to mental health, combining scientifically-backed methodologies with innovative technology. Our application provides users with guided meditation exercises, mood tracking features, and personalized coping strategies. We also offer expertly crafted content, such as articles and audio resources, to educate and support users in their mental health journey.',
    ),
    FAQItem(
      question: 'Is Easeneura suitable for everyone?',
      description:
          'Absolutely! Easeneura is designed to be inclusive and accessible to individuals from all walks of life. Whether you\'re new to mental health practices or an experienced practitioner, our platform tailors its recommendations to meet your unique needs and preferences.',
    ),
    FAQItem(
      question: 'Can I track my progress with Easeneura?',
      description:
          'Yes, tracking progress is a key feature of Easeneura. Our application allows users to monitor their emotional well-being over time, providing insights into trends and areas for improvement. This feature helps users stay motivated and engaged in their mental health journey.',
    ),
    FAQItem(
      question: 'Are there privacy and security measures in place?',
      description:
          'We take privacy and security seriously at Easeneura. All user data is encrypted and stored securely, adhering to the highest industry standards. We are committed to ensuring the confidentiality and privacy of our users\' information.',
    ),
    FAQItem(
      question:
          'What types of meditation exercises are available in Easeneura?',
      description:
          'Easeneura provides a diverse range of meditation exercises, catering to various preferences and needs. Users can choose from guided mindfulness meditations, relaxation techniques, and specialized sessions targeting specific areas like stress reduction, sleep improvement, and emotional resilience. Our content is curated by mental health professionals to ensure its effectiveness and relevance.',
    ),
  ];
}

class FAQItem {
  final String question;
  final String description;

  FAQItem({required this.question, required this.description});
}
