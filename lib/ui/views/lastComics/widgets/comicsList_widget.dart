import 'package:comics_challenge/data/models/comics_model.dart';
import 'package:comics_challenge/data/models/detail_model.dart';
import 'package:comics_challenge/data/services/comics/comics_service.dart';
import 'package:comics_challenge/ui/views/comicDetail/comicDetail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicsList extends StatelessWidget {
  const ComicsList({Key? key, required this.comics}) : super(key: key);
  final List<Comic> comics;

  List<Widget> generateComics() {
    final comicsService = ComicsService();
    List<Widget> list = [];
    comics.forEach((element) {
      list.add(Center(
        child: InkWell(
          onTap: () async {
            Results details =
                await getDetails(element.apiDetailUrl, comicsService);
            Get.to(() => ComicDetails(
                  title: "Comics book",
                  comic: element,
                  details: details,
                ));
          },
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      element.image.originalUrl,
                      width: 100,
                      height: 100,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const Center(
                            child: Center(child: CircularProgressIndicator()));
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Text('Some errors occurred!'),
                    )),
                Column(children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      element.name != null ? element.name! : 'without name',
                    ),
                  ),
                  SizedBox(
                      width: 200, child: Text(element.dateAdded.toString())),
                ]),
              ]),
              SizedBox(height: 10)
            ],
          ),
        ),
      ));
    });
    return list;
  }

  Future<Results> getDetails(url, comicsService) async {
    final Results details = await comicsService.comicDetail(url);
    return details;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: generateComics());
  }
}
