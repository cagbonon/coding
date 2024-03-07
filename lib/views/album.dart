import 'package:coding/model/album.dart';
import 'package:coding/service/album.dart';
import 'package:coding/service/getAllData.dart';
import 'package:coding/views/detail.dart';
import 'package:flutter/material.dart';

class AlbuumScreen extends StatefulWidget {
  const AlbuumScreen({super.key});

  @override
  State<AlbuumScreen> createState() => _AlbuumScreenState();
}

class _AlbuumScreenState extends State<AlbuumScreen> {
  Future<List<Album>> getAlbums() async {
    List<dynamic> albumsDynamic = await getALlData("albums");
   
    List<Album> albums = await getAllAlbums(albumsDynamic);
    return albums;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Albums")),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: FutureBuilder<List<Album>>(
            future: getAlbums(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album> data = snapshot.requireData;
             
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailAlbums(album: data[index],),
                            ),
                          );
                          },
                                child: Text(data[index].title!), 

                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
