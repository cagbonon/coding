import 'package:coding/model/album.dart';
import 'package:coding/model/photo.dart';
import 'package:coding/service/getAllData.dart';
import 'package:coding/service/photo.dart';
import 'package:flutter/material.dart';

class DetailAlbums extends StatefulWidget {
  final Album? album;
  DetailAlbums({super.key, this.album});

  @override
  State<DetailAlbums> createState() => _DetailAlbumsState();
}

class _DetailAlbumsState extends State<DetailAlbums> {
  Future<List<Photo>> getAlbums() async {
    List<Photo> photos = [];
    List<dynamic> albumsDynamic = await getALlData("photos");

    List<Photo> albums = await getAllPhotos(albumsDynamic);
    for (Photo photo in albums) {
      if (photo.albumId == widget.album!.id) {
        photos.add(photo);
      }
    }
    return albums;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("${widget.album!.id}")),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: FutureBuilder<List<Photo>>(
            future: getAlbums(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Photo> data = snapshot.requireData;
             
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(data[index].thumbnailUrl!),
                        trailing: Text(data[index].title!),
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
