import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class Pin extends StatefulWidget {
  @override
  _PinState createState() => _PinState();
}

//  <p class="phead">สหกรณ์ออมทรัพย์ครูสมุทรสงคราม จำกัด</p>
//   <p class="phead1">Samutsongkhram Saving Teacher Co-operative Ltd.</p>
class _PinState extends State<Pin> {
  final _colorheader = Colors.green;

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: _colorheader,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/imgs/icon.png',
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: ClipPath(
                    clipper: DiagonalPathClipperTwo(),
                    child: Container(
                      height: 70,
                      color: _colorheader,
                      // child: Center(child: Text("DiagonalPathClipper()")),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         mainAxisSize: MainAxisSize.max,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "สหกรณ์ออมทรัพย์ครูสมุทรสงคราม จำกัด",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          "Samutsongkhram Saving Teacher Co-operative Ltd.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[Text("กรุณาใส่ pin code"), Text("xxxxxx")],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(40),
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                // childAspectRatio: 1.0,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                      child: new Text("1"),
                      onPressed: () {
                        print("1");
                      },
                      borderSide: BorderSide(
                        color: _colorheader,
                        // // style: BorderStyle.solid,
                        // width: 4.8,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(200.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("2"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("3"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("4"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                            color: _colorheader,
                            // style: BorderStyle.solid,
                            // width: 4.8,
                            ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("5"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("6"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("7"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                            color: _colorheader,
                            // style: BorderStyle.solid,
                            // width: 4.8,
                            ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("8"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("9"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("ลืมpin"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                            color: _colorheader,
                            // style: BorderStyle.solid,
                            // width: 4.8,
                            ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("0"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: new OutlineButton(
                        child: new Text("ลบ"),
                        onPressed: () {
                          print("1");
                        },
                        borderSide: BorderSide(
                          color: _colorheader,
                          // style: BorderStyle.solid,
                          // width: 4.8,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(200.0))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
