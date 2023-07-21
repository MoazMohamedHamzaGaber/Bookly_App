import 'package:bookly/feauture/Home/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utiles/style.dart';

class BookRating extends StatelessWidget {
   BookRating({Key? key,  required this.items}) : super(key: key);

  // final dynamic rating;
  // final dynamic count;

   Items items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(
          width: 6.3,
        ),
         Text(
          '${items.volumeInfo!.averageRating ??0}',
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          '(${items.volumeInfo!.ratingsCount ??0})',
          style: Style.textStyle14.copyWith(
            color:const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
