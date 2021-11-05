import 'package:flutter/material.dart';
import 'package:trainingbasicflutter/data/dataglobal.dart';

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun Profile"),
      ),
      body: ListView(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: dataGlobal.user?.userImage == null ||
                  dataGlobal.user?.userImage == "" ? null : NetworkImage(
                  "${dataGlobal.user?.userImage}")
            ),
          ),
          Container(
            child: Text("${dataGlobal.user?.userEmail}"),

          ),
          Container(
            child: Text("${dataGlobal.user?.userNama}"),

          ),
        ],
      ),
    );
  }
}
