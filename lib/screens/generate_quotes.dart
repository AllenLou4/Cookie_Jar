import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CookieJar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuoteGenerator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({Key? key}) : super(key: key);

  @override
  _QuoteGeneratorState createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final String quoteURL = "https://api.adviceslip.com/advice";
  String quote = '';

  Future<void> generateQuote() async {
    try {
      var response = await http.get(Uri.parse(quoteURL));
      var result = jsonDecode(response.body);
      setState(() {
        quote = result["slip"]["advice"];
      });
    } catch (e) {
      print("Error fetching quote: $e");
      // Handle error gracefully, e.g., show a snackbar or a toast
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Cookie Jar.jpg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.7), // Cookie palette color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  quote,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  generateQuote();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color(0xFFDAA520); // Hover color (Goldenrod)
                      }
                      return Color.fromARGB(
                          255, 255, 106, 0); // Default color (SaddleBrown)
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(
                        255, 255, 251, 248), // Text color (Chocolate)
                  ),
                  elevation: MaterialStateProperty.all<double>(5),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text('Grab a Cookie!'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
