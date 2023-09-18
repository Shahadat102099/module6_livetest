import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to our Photo Gallery App!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText:"Search For Photos",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Image $index clicked'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                    child: Column(
                      children: [
                        Image.network(
                          "https://media.istockphoto.com/id/1310331783/photo/fluffy-friends-a-corgi-dog-and-a-tabby-cat-sit-together-in-a-sunny-spring-meadow.jpg?s=612x612&w=0&k=20&c=zkGrCtOa8-62aIbkIHtIwDr0gqmiexk5-kWX7VRzo6A=",
                          height: 110, width: 110,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('Image $index'),
                        ),
                      ],
                    ),
                );
              },
            ),
            Container(
              child: ListTile(
                leading: Image.network("https://forallanimals.org/wp-content/uploads/2016/09/Comm-Cat-circle.png"),
                title: Text('Photo 1'),
                subtitle: Text('Description Photo For 1'),
              ),
            ),
            ListTile(
              leading: Image.network("https://forallanimals.org/wp-content/uploads/2016/09/Comm-Cat-circle.png"),
              title: Text('Photo 2'),
              subtitle: Text('Description For Photo 2'),
            ),
            ListTile(
              leading: Image.network("https://forallanimals.org/wp-content/uploads/2016/09/Comm-Cat-circle.png"),
              title: Text('Photo 3'),
              subtitle: Text('Description For Photo 3'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  var snackBar = SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Icon(Icons.upload_rounded,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}