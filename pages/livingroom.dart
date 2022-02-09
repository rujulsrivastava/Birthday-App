import 'package:flutter/material.dart';
import 'package:birthday_app/pages/videoplayer.dart';

String text1 = 'happy birthday';

Widget _buildPopupDialog(BuildContext context, String title, String text) {
  return AlertDialog(
    title: Text(title),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.redAccent)),
            backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
        child: const Text('X'),
      ),
    ],
  );
}

class LivingRoom extends StatefulWidget {
  const LivingRoom({Key? key}) : super(key: key);

  @override
  _LivingRoomState createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Living Room', textAlign: TextAlign.center,),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 20,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/livingroom.jpg"),
            opacity: 120.0,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Column(children: <Widget> [
                SizedBox(
                  width: MediaQuery.of(context).size.width*85/100,
                  child: const Text("*tring tring*\nMails have come! Open them up!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.brown,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      showDialog(context: context, builder: (BuildContext context)=> _buildPopupDialog(
                          context, 'Dear Recipient', text1),
                      );
                    });
                  },
                  icon: const Icon (Icons.email),
                  label: const Text('A Text Message'),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen()));
                    });
                  },
                  icon: const Icon (Icons.email),
                  label: const Text('A Video Message'),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      showDialog(context: context, builder: (BuildContext context)=> AlertDialog(title: const Text('Here is an image'), content: Container(child: const Image(image: AssetImage("images/roseplant.jpg"))),)
                      );
                    });
                  },
                  icon: const Icon (Icons.email),
                  label: const Text('An Image Message'),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                  ),
                ),
              ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
