import 'package:comics_challenge/data/models/comics_model.dart';
import 'package:comics_challenge/data/models/detail_model.dart';
import 'package:comics_challenge/data/services/comics/comics_service.dart';
import 'package:comics_challenge/ui/views/comicDetail/widgets/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicDetails extends StatefulWidget {
  const ComicDetails(
      {Key? key,
      required this.title,
      required this.comic,
      required this.details})
      : super(key: key);

  final String title;
  final Comic comic;
  final Results details;
  @override
  State<ComicDetails> createState() => _ComicDetailsState();
}

class _ComicDetailsState extends State<ComicDetails> {
  final comicsService = ComicsService();

  //@override
  //void dispose() {
  //setState(() {
  //  Get. .off(() => ComicDetails(
  //      title: widget.title, comic: widget.comic, details: widget.details));
  //});
  //super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: DetailWidget(details: widget.details),
      ),
    );
  }
}
