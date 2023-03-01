import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mentes_brillantes/pages/reproductor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class RSSReader extends StatefulWidget {
  RSSReader() : super();
  final String title = 'Mentes Brillantes';

  @override
  State<RSSReader> createState() => _RSSReaderState();
}

class _RSSReaderState extends State<RSSReader> {
  static const String FEED_URL = "https://anchor.fm/s/11929d50/podcast/rss";
  Uri FEED_URI = Uri.https('anchor.fm',
  's/11929d50/podcast/rss');
  RssFeed _feed = RssFeed();
  String _title = '';

  // Notification Strings
  static const String loadingMessage = 'Loading Feed...';
  static const String feedLoadErrorMessage = 'Error Loading Feed.';
  static const String feedOpenErrorMessage = 'Error Opening Feed.';

  GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  /*Future<void> openFeed(String url) async {
    if (await canLaunchUrl(Uri.parse(url)
    )) {
      await launchUrl(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMessage);
  }*/

  // TODO 11: Create a method to load the RSS data.
  // Method to load the RSS data.
  load() async {
    updateTitle(loadingMessage);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        // Notify user of error.
        updateTitle(feedLoadErrorMessage);
        return;
      }
      // If there is no error, load the RSS data into the _feed object.
      updateFeed(result);
      // Reset the title.hgb
      updateTitle("Mentes Brillantes");
    });
  }

  // TODO 12: Create a method to grab the RSS data from the provided URL.
  // Method to get the RSS data from the provided URL in the FEED_URL variable.
  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URI);
      return RssFeed.parse(response.body);
    } catch (e) {
      // handle any exceptions here
    }
    return RssFeed();
  }

  // TODO 13: Override the initState() method and setup the _refreshKey variable, update the title, and call the load() method.
  // When the app is initialized, we setup our GlobalKey, set our title, and
  // call the load() method which loads the RSS feed and UI.
  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  // TODO 14: Create a method to check if the RSS feed is empty.
  // Method to check if the RSS feed is empty.
  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  // TODO 15: Create method to load the UI and RSS data.
  // Method for the pull to refresh indicator and the actual ListView UI/Data.
  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(

        //title: Text(_title),
        //backgroundColor: Colors.black,
        //),
        body: body(),
      ),
    );
  }

  // TODO 16: Create the UI for the ListView and plug in the retrieved RSS data.
  // ==================== ListView Components ====================

  // ListView
  // Consists of two main widgets. A Container Widget displaying info about the
  // RSS feed and the ListView containing the RSS Data. Both contained in a
  // Column Widget.

  list() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Container displaying RSS feed info.
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              //  decoration: customBoxDecoration(),
              decoration: BoxDecoration(
                  image: new DecorationImage(
                image: AssetImage("assets/images/fondo.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                  ),
                  Text(
                    _feed.title.replaceFirst(' ', '\n'),
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    _feed.author,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),

                ],
              ),
            ),
          ),
          // ListView that displays the RSS data.
          Expanded(
            flex: 3,
            child: Card(
              child: ListView.builder(
                padding: EdgeInsets.all(5.0),
                itemCount: _feed.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _feed.items[index];
                  return Card(
                    elevation: 30.0,
                    margin: EdgeInsets.only(
                      bottom: 4.0,
                    ),
                    //decoration: customBoxDecoration(),
                    child: ListTile(
                      title: title(item.title ),
                      subtitle: subtitle(item.pubDate),
                      trailing: rightIcon(),
                      leading: Icon(
                        Icons.play_circle,
             //           color: DateTime.parse(item.pubDate).difference(DateTime.now()).inDays<10 ? Colors.green:Colors.grey,
                        color: parseDate(item.pubDate).difference(DateTime.now()).inDays.abs() < 10 ? Colors.green:Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(5.0),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Reproductor(item) )

                      )//openFeed(item.enclosure.url),
                    ),
                  );
                },
              ),
            ),
          ),
        ]);
  }

  // Method that returns the Text Widget for the title of our RSS data.
  title(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  //Method that returns the datetime parsed from a text
  DateTime parseDate(String date)
  {
    var dateArray = date.split(',')[1].split(' ');
    var day = dateArray[1];
    var tMonth =dateArray[2];
    var year = dateArray[3];
    var month = Month.keys.firstWhere(
            (k) => Month[k] == tMonth, orElse: () => '01');


    return DateTime.parse(year.toString()+'-'+month.toString()+'-'+day.toString());

  }
  // Method that returns the Text Widget for the subtitle of our RSS data.
  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w300, color: Colors.black),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
  Map<String,String> Month={
    '01':'Jan',
    '02':'Feb',
    '03':'Mar',
    '04':'Apr',
    '05':'May',
    '06':'Jun',
    '07':'Jul',
    '08':'Aug',
    '09':'Sep',
    '10':'Oct',
    '11':'Nov',
    '12':'Dec'
  };

  // Method that returns Icon Widget.
  rightIcon() {
    return Icon(
      Icons.more_vert,
      color: Colors.grey.shade400,
      size: 30.0,
    );
  }

  // Custom box decoration for the Container Widgets.
  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.green.shade800, // border color
        width: 1.0,
      ),
    );
  }

// ====================  End ListView Components ====================

}
