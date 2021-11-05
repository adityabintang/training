import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingbasicflutter/res/resBerita.dart';

class DetailPage extends StatefulWidget {
  final Article data;
  const DetailPage(this.data, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.network(
                        "${widget.data.urlToImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  "${widget.data.source?.name ?? ""}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              "${widget.data.title}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              "Deskripsi",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFf2f2f2),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Text(
                                "${widget.data.description}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
