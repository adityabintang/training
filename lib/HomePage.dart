import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trainingbasicflutter/constant.dart';
import 'package:trainingbasicflutter/homescreen.dart';
import 'package:trainingbasicflutter/res/resBerita.dart';
import 'package:http/http.dart' as http;
import 'ui/detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Home Page";

  List? image = [
    'assets/budisawah.png',
    'assets/budisawah.png',
    'assets/budisawah.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int currentIndex = 0;

  List<Article> _listBerita = [];

  Future<Article?> getListBerita() async {
    var res = await http.get(Uri.parse(getBerita),
    );
    List<Article>? data = resBeritaFromJson(res.body).articles;
    setState(() {
      _listBerita = data!;
    });
  }

  @override
  void initState() {
    getListBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _listBerita.length,
          itemBuilder: (context, index) {
            Article data = _listBerita[index];
            return InkWell(
              onTap: () {
                //Detail
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPage(data)));
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Image.network(
                                    "${data.urlToImage}",
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Container(
                                          child: Text(
                                            "${data.title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Container(
                                          child: Text(
                                            "Tanggal: ${data.publishedAt}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text(
                                "Sumber: ${data.source?.name ?? ""}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Stack(
      //         children: [
      //           CarouselSlider(
      //             items: image?.map((e) {
      //               return Builder(builder: (BuildContext context) {
      //                 return Container(
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image: AssetImage("assets/budisawah.png"),
      //                     ),
      //                   ),
      //                 );
      //               });
      //             }).toList(),
      //             options: CarouselOptions(
      //                 height: 200,
      //                 initialPage: 0,
      //                 autoPlay: true,
      //                 autoPlayAnimationDuration: Duration(milliseconds: 500),
      //                 viewportFraction: 1,
      //                 onPageChanged: (index, _) {
      //                   setState(() {
      //                     currentIndex = index;
      //                   });
      //                 }),
      //           ),
      //           Positioned(
      //             bottom: 10,
      //             left: 0,
      //             right: 0,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: map(image ?? [], (index, _) {
      //                 return Container(
      //                   width: 8,
      //                   height: 8,
      //                   margin: EdgeInsets.symmetric(
      //                     vertical: 10,
      //                     horizontal: 2,
      //                   ),
      //                   decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: currentIndex == index
      //                           ? Colors.black
      //                           : Colors.white),
      //                 );
      //               }),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 20,),
      //       Text("Ini Gambar buah"),
      //       Image.asset("assets/budisawah.png"),
      //       MaterialButton(
      //         onPressed: () {},
      //         child: Text(
      //           "BUtton",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         color: Colors.black,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Container(
      //             child: MaterialButton(
      //               onPressed: () {
      //                 Navigator.push(context,
      //                     MaterialPageRoute(builder: (context) => HomeScreen()));
      //               },
      //               child: Text("Button 2"),
      //               color: Colors.blue,
      //             ),
      //           ),
      //           Padding(padding: EdgeInsets.all(8)),
      //           Container(
      //             child: MaterialButton(
      //               onPressed: () {
      //                 showAlertDialog(context);
      //               },
      //               child: Text("Button 2"),
      //               color: Colors.blue,
      //             ),
      //           ),
      //           Padding(padding: EdgeInsets.all(8)),
      //           Container(
      //             child: MaterialButton(
      //               onPressed: () {},
      //               child: Text("Button 2"),
      //               color: Colors.blue,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Center(
      //         child: RichText(
      //           text: TextSpan(
      //               text: "Don't have account?",
      //               style: TextStyle(color: Colors.black),
      //               children: [
      //                 TextSpan(
      //                     text: 'SignUp',
      //                     style: TextStyle(color: Colors.red),
      //                     recognizer: TapGestureRecognizer()
      //                       ..onTap = () {
      //                         //navigator kemana?
      //                       }),
      //               ]),
      //         ),
      //       ),
      //       Container(
      //         child: MaterialButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => HomeScreen()));
      //           },
      //           child: Text("Button 2"),
      //           color: Colors.blue,
      //         ),
      //       ),
      //       Container(
      //         child: MaterialButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => HomeScreen()));
      //           },
      //           child: Text("Button 2"),
      //           color: Colors.blue,
      //         ),
      //       ),
      //       Container(
      //         child: MaterialButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => HomeScreen()));
      //           },
      //           child: Text("Button 2"),
      //           color: Colors.blue,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: AssetImage("assets/pp.jpg"),
      //               radius: 40,
      //             ),
      //             Text("Nama"),
      //             Text("Email"),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         trailing: Icon(Icons.arrow_forward_ios_outlined),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         title: Text('About'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         trailing: Icon(Icons.arrow_forward_ios_outlined),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Setting'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         trailing: Icon(Icons.arrow_forward_ios_outlined),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Pengumuman"),
          content: Text("You are awesome!\n"
              "HAloo asad\n"
              "Hallo ini baris ketiga"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
