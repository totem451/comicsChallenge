import 'package:comics_challenge/data/models/comics_model.dart';
import 'package:comics_challenge/data/services/comics/comics_service.dart';
import 'package:comics_challenge/ui/views/lastComics/widgets/comicsList_widget.dart';
import 'package:flutter/material.dart';

class LastComics extends StatefulWidget {
  const LastComics({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LastComics> createState() => _LastComicsState();
}

class _LastComicsState extends State<LastComics> {
  final comicsService = ComicsService();

  Future<List<Comic>> getComics() async {
    final comics = await comicsService.listComics();
    return comics;
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<Comic>> stream = Stream.fromFuture(getComics());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text('  Lastest Issues'),
          Divider(
              thickness: 1, color: Colors.blueAccent, indent: 4, endIndent: 4),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          StreamBuilder(
              stream: stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          ComicsList(comics: snapshot.data),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(), heightFactor: 15);
              }),
        ],
      ),
    );
  }
}
