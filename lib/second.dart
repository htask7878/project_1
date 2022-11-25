import 'package:flutter/material.dart';
import 'package:project_1/third.dart';
import 'package:sqflite/sqflite.dart';

class second extends StatefulWidget {
  Database? database;

  second(this.database);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List name = [];
  List email = [];
  List gen = [];

  Future data() async {
    String s = "select * from contact";
    List<Map> ml = [];

    ml = await widget.database!.rawQuery(s) as List<Map>;
    return ml;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.black26,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 30),
        backgroundColor: Color(0xff047361),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return third(widget.database);
            },
          ));
        },
      ),
      body: SafeArea(
          child: Container(
        child: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Map>? test = [];
              if (snapshot.hasData) {
                test = snapshot.data as List<Map>?;
                test!.forEach((element) {
                  name.add(element['name']);
                  email.add(element['email']);
                  gen.add(element['gender']);
                });
              }
              return ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${name[index]}"),
                    subtitle: Text("${email[index]}"),
                    trailing: Text("${gen[index]}"),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
    );
  }
}
