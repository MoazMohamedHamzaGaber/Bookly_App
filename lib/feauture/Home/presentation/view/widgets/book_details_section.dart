import 'package:bookly/feauture/Home/data/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/style.dart';
import 'book_action_botton.dart';
import 'book_rating.dart';

class BookDetailsSection extends StatelessWidget {
   BookDetailsSection({Key? key, required this.items}) : super(key: key);
   Items items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
          ),
          child: Container(
            width: 165,
            height: 245,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(items.volumeInfo!.imageLinks!.thumbnail!))),
          ),
        ),
         Text(items.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: Style.textStyle30,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(items.volumeInfo!.authors![0],
          style: Style.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xff707070),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
         BookRating(
           items: items,
         ),
         BookActionBottom(
           items: items,
         ),
      ],
    );
  }
}
