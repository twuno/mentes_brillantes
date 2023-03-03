// @dart=2.9
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:mentes_brillantes/services/service_locator.dart';

import 'rss_reader.dart';

/*Future<void> main()  async => runApp(
     RssApp());*/

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(RssApp());
}

class RssApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RSSReader(),
    );
  }
}

/*
class SchoolApp  extends StatelessWidget {
 // const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School App",
      home: cols(

          Ttitle: "Driver App"
      ),
    );

  }
}
*/

/*
class cols extends StatefulWidget {
  const cols({Key? key,required this.Ttitle}) : super(key: key);
  final String Ttitle;
  @override
  State<cols> createState() => _colsState();
}


*/

/*
class _colsState extends State<cols> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Ttitle),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            //alignment: Alignment.center,
            //width: MediaQuery.of(context).size.width,
            child: Text("Nino 1"),
          ),

        Text("Nino 2"),
        Text("Nino 3")
      ],),
    );
  }
}
*/
/*
class Inicio extends StatefulWidget {
  //const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Driver App",
        style: TextStyle(
          color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold
        ),
        ),

        backgroundColor: Colors.limeAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(28.0),
            child:Image.network("https://lh3.googleusercontent.com/7ytrbvXkGvLreH_CZLzlqqJGs69P4VoflRY8ZEz2LAAIM1LHPxG0nbap1DDA36bwTT1ERFQ58pDUQIuAXYvp1nMkXSxRkfWXaMXxT2EiI0q9YuIF7n8D24cURtfPKbfA_j05kb_23FQ6BIcbH8BWRdfFhezhKCieUCLiZ05LEjP601jJRH11lpiauIoocH0foanwgSsGL3ejLbZuvJBemO1ve5EzhpiypXRCiQLmDfmbeZ2ug-BlKzq3BcQaXApBTndP4In7jOfpaDzAlDlUyHBdVUduy3Gl-9QwUf8MyvkbtozeJ-gTQ831bUkjnDeC9F1kJzj9KFX1jDbM087Ysigr6A8nC1mL2Vz9BjK-w6myfZjPnH7KVNXIQPKEtjlYQmEHY2BKcoK-x3oAd9K9lUxc_9HT6gDcZyY8anMBl69UpqtB3iG8mZoZrzYCCko-Cl9-EVpiv0d7nxVCWW2tRXEXGBUblx4W1nsKUFiH4gX_V3J0_B8LEwiE9MfBNSlQDALSnw26t6n0VTgyinHJhvZw09r2NDxXS0iiubH3OFRRDjmnrwd3NAXYDA8vx96cAx2cLyhvnWcn5fN5skumwbzPPBb8WegRoTMeMY3v9KsIb0MpN2rTyI4kFqfYfgmWfKQfBLLfTCXS8EgeUkwXcp0ca254pxSiSl3EZdRMdR28N1RUw_J-SlxaWhN5ddKRVXZosBsgIBuBsZoeHHn8cmYRnr3RLsJs0rQ9hmskaCUoysOH7NwBqXBcL-ssSYXQk2bQiiYoT2kB5_mQk7V4GGby017fkPM1cvnYuaEFLqcFM05hFnt2HP9K6zAczYTLzXjxWInilHHC65Xf4vbZhFLVJxCKJIokhLJVpRYefE9NPkUZRBfFV_hyG5Byoa_Sw1Ke5UO5eBAC3rRQS7yqEq9x4Y4jgwWQ1AIQfIo2MHhONxbx1u6ONcEXMXtkPOsd8j78HGtZ-JN7Qw=w1263-h947-no?authuser=0"),

          ),

        ],
      )

    );





  }
}
*/

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,

      ),
      home: const MyHomePage(title: 'Driver Home Page '),
    );
  }
}
*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
