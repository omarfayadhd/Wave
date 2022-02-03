import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/picking.dart';

FirebaseStorage storage = FirebaseStorage.instance;

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
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.favorite_border,
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
/*
final makeBody = Container(
    child: Expanded(
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
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.white24))),
                                child:
                                    Icon(Icons.autorenew, color: Colors.white),
                              ),
                              title: Text(
                                image['url'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              subtitle: Row(
                                children: <Widget>[
                                  Icon(Icons.linear_scale,
                                      color: Colors.yellowAccent),
                                  Text(" Intermediate",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 30.0)),
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
//final makeCard =
*/
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

/*ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ), */
