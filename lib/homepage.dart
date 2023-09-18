import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome message
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Welcome to the photo gallery!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Search photos...'),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  // Replace this with the URL of your network image
                  final imageUrl = 'https://example.com/images/image$index.jpg';

                  return GestureDetector(
                    onTap: () {
                      // Show a Snackbar when the image is clicked
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Image $index clicked!'),
                        ),
                      );
                    },
                    child: Card(
                        child: Image.network(imageUrl)
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
