import 'package:flutter/material.dart';
import 'package:birthday_app/pages/livingroom.dart';
import 'package:birthday_app/pages/gallery.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go anywhere!', textAlign: TextAlign.center,),
        backgroundColor: Colors.lightBlue[800],
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 20,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home.jpg"),
            opacity: 120.0,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: <Widget> [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LivingRoom()));
                        });
                      },
                      child: const Text("Living Room"),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(1),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0)),
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Gallery()));
                        });
                      },
                      child: const Text("Gallery"),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0)),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                      ),
                    )
                  ]
                  ),
            ],
          )
          ),
        ),
    );
  }
}

