import 'package:flutter/material.dart';
import 'package:knowledge_space3/pages/detail/widgets/book_cover.dart';
import 'package:knowledge_space3/pages/detail/widgets/book_detail.dart';
import 'package:knowledge_space3/pages/detail/widgets/book_review.dart';

import '../../constants/colors.dart';
import '../../models/book.dart';
import '../../models/screen_reader.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // les composants globales de la page d'affichage du book
            BookDetail(book),
            BookCover(book),
            // BookResume(book),
            BookReview(book),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenReader(book)));
                    },
                    style: ButtonStyle(
                        foregroundColor: getColor(Colors.white, Colors.white),
                        backgroundColor:
                            getColor(hexStringToColor("c73618"), Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                    child: const Text("Read Book (PDF)"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: getColor(Colors.white, Colors.white),
                        backgroundColor:
                            getColor(hexStringToColor("c73618"), Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                    child: const Text("Buy Book"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: kFont,
          )),
      actions: [
        IconButton(
            padding: const EdgeInsets.only(right: 25.0),
            onPressed: () {},
            icon: const Icon(
              Icons.library_add_outlined,
              color: kFont,
              size: 29,
            )),
      ],
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  // ignore: prefer_function_declarations_over_variables
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
