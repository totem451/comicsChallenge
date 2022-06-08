import 'package:comics_challenge/data/models/comics_model.dart';
import 'package:comics_challenge/data/models/detail_model.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key, required this.details}) : super(key: key);

  final Results details;

  generateCharacters(Results details) {
    List<Widget> list = [Container()];
    details.characterCredits.forEach((element) {
      list.add(
        Text(element.name),
      );
    });
    return list;
  }

  generateTeams(Results details) {
    List<Widget> list = [Container()];
    details.teamCredits.forEach((element) {
      list.add(
        Text(element["name"]),
        // Text(element[2]),
      );
    });
    return list;
  }

  generateLocations(Results details) {
    List<Widget> list = [Container()];
    details.locationCredits.forEach((element) {
      list.add(
        Text(element.name),
      );
    });
    return list;
  }

  generateConcepts(Results details) {
    List<Widget> list = [Container()];
    details.conceptCredits.forEach((element) {
      list.add(
        Text(element.name),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 300,
            width: 300,
            child: Image.network(
              details.image.originalUrl,
              width: 300,
              height: 300,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                    child: Center(child: CircularProgressIndicator()));
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Text('Some errors occurred!'),
            )),
        SizedBox(
          height: 20,
        ),
        Text("  Characters"),
        Divider(
          indent: 3,
          endIndent: 3,
          height: 1.5,
          color: Colors.blue,
        ),
        Column(
          children: generateCharacters(details),
        ),
        SizedBox(
          height: 20,
        ),
        Text("  Teams"),
        Divider(
          indent: 3,
          endIndent: 3,
          height: 1.5,
          color: Colors.blue,
        ),
        Column(
          children: generateTeams(details),
        ),
        SizedBox(
          height: 20,
        ),
        Text("  Locations"),
        Divider(
          indent: 3,
          endIndent: 3,
          height: 1.5,
          color: Colors.blue,
        ),
        Column(
          children: generateLocations(details),
        ),
        SizedBox(
          height: 20,
        ),
        Text("  Concepts"),
        Divider(
          indent: 3,
          endIndent: 3,
          height: 1.5,
          color: Colors.blue,
        ),
        Column(
          children: generateConcepts(details),
        ),
      ],
    );
  }
}
