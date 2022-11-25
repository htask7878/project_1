import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project_1/second.dart';
import 'package:sqflite/sqflite.dart';

class first extends StatefulWidget {
  @override
  State<first> createState() => _firstState();
}
class _firstState extends State<first> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Database? database;

  @override
  void initState() {
    super.initState();
    view();
  }

  view() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'ht.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE contact (id INTEGER PRIMARY KEY, name TEXT, email TEXT, gender TEXT)');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,

      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.pinkAccent
                    // image: DecorationImage(
                      //     image: AssetImage("image/u1.png"), scale: 3)
                        ),
                ),
              )),
          SizedBox(
            height: 60,
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.teal,
                    controller: t1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter your user name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.teal,
                    controller: t2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter your passoword",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (t1.text != "" || t2.text != "") {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return second(database);
                          },
                        ));
                      } 
                      t1.text="";
                      t2.text="";
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                      decoration: BoxDecoration(
                          color: Color(0xff047361),
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      height: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
