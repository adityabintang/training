import 'package:flutter/material.dart';
import 'package:trainingbasicflutter/HomePage.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Detail"),

        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomePage()));
        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text("Hallo ini detail"),
            ),
            MaterialButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Sending Message"),
                ));
              },
              child: Text("Toast"),
            )
          ],
        ),
      ),
    );
  }


}
