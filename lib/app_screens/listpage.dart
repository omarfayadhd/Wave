import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/Profile.dart';
import 'package:wave_dev/app_screens/audio_page.dart';
import 'package:wave_dev/app_screens/picking.dart';
import 'package:audioplayers/audioplayers.dart';
import 'bottomsheet.dart';
import 'login.dart';

FirebaseStorage storage = FirebaseStorage.instance;
var audio = AudioPlayer();
bool isPlaying = false;
bool isPaused = false;
var _bottom = Bottom();

class ListPage extends StatefulWidget {
  ListPage({
    Key? key,
  }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: Container(
          height: 55.0,
          child: BottomAppBar(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  iconSize: 30,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  color: Colors.blue,
                  alignment: Alignment.bottomRight,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.celebration_rounded),
                  color: Colors.red,
                  iconSize: 30,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    _popup(context);
                  },
                  icon: Icon(Icons.menu_open),
                  color: Colors.yellow,
                  iconSize: 30,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  alignment: Alignment.topRight,
                ),
                /*IconButton(
                  icon: Icon(Icons.upload, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),*/
              ],
            ),
          )),
      body: Container(
          child: Column(children: <Widget>[
        Expanded(
          child: FutureBuilder(
            future: _loadImages(),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> image = snapshot.data![index];

                    return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            //tileColor: Colors.blueAccent,
                            dense: false,
                            //leading: Image.network(image['url']),
                            title: Text(image['name']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => {_playing(image['url'])},
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ));
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        Row(textDirection: TextDirection.rtl, children: <Widget>[
          IconButton(
            alignment: Alignment.bottomLeft,
            icon: Icon(Icons.upload, color: Colors.white, size: 30.0),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ])
      ])),
    );
  }

  void _popup(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: MediaQuery.of(context).size.height * .30,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.person_outline,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profileView()));
                            },
                            child: Text("My Account",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Lora',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text("Settings",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.info,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text("About",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.logout,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              logout(context);
                            },
                          ),
                          ActionChip(
                            label: Text("Logout",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () {
                              logout(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  )));
        });
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}

final topAppBar = AppBar(
  leading: IconButton(
    onPressed: () {},
    icon: Icon(Icons.home),
  ),
  title: const Text(
    'Drop',
    style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
  ),
  elevation: 0.1,
  backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.favorite),
      onPressed: () {},
    )
  ],
);

Future<List<Map<String, dynamic>>> _loadImages() async {
  List<Map<String, dynamic>> files = [];

  final ListResult result = await storage.ref('files').list();
  final List<Reference> allFiles = result.items;

  await Future.forEach<Reference>(allFiles, (file) async {
    final String fileUrl = await file.getDownloadURL();
    final FullMetadata fileMeta = await file.getMetadata();

    files.add({
      "url": fileUrl,
      "path": file.fullPath,
      "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
      "description":
          fileMeta.customMetadata?['description'] ?? 'No description',
      "name": file.name
    });
  });

  return files;
}

_playing(String url) async {
  if (isPlaying == false) {
    audio.play(url);
    isPlaying = true;
  }
}
