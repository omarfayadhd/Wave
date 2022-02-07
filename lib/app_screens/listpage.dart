import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/picking.dart';
import 'package:audioplayers/audioplayers.dart';

FirebaseStorage storage = FirebaseStorage.instance;
var audio = AudioPlayer();
bool isPlaying = false;
bool isPaused = false;

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
                /* IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),*/
                IconButton(
                  icon: Icon(Icons.blur_on, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.upload, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
              ],
            ),
          )),
      body: Column(children: <Widget>[
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

                    return Card(
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
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ]),
    );
  }
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
      icon: Icon(Icons.favorite_outlined),
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
