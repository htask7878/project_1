import 'package:flutter/material.dart';
import 'package:project_1/second.dart';
import 'package:sqflite/sqflite.dart';

class third extends StatefulWidget {
  Database? database;

  third(this.database);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text("Add User",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w500))),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.name,
              cursorColor: Colors.teal,
              controller: t3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Enter Name.",
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
              cursorColor: Colors.teal,
              controller: t4,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Enter Email",
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
              cursorColor: Colors.teal,
              controller: t5,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Enter Gender",
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
              onTap: () async {
                String s3, s4, s5;
                s3 = t3.text;
                s4 = t4.text;
                s5 = t5.text;

                String sql =
                    "insert into contact values(null,'$s3', '$s4', '$s5')";
                int r_in = await widget.database!.rawInsert(sql);
                if (r_in > 0) {
                  print("$r_in is insert");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => second(widget.database),
                      ));
                } else {
                  print("Data is Not insert");
                }
                t3.text = "";
                t4.text = "";
                t5.text = "";
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
                decoration: BoxDecoration(
                    color: Color(0xff047361),
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                height: 50,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
// return second(database);
// },));
