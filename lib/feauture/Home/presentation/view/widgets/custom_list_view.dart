import 'package:bookly/feauture/Home/data/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../book_details_view.dart';

class CustomListViewItem extends StatelessWidget {
   CustomListViewItem(this.items,{Key? key}) : super(key: key);

  final Items items;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsView(
              items: items,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            //height: 200,
            fit: BoxFit.fill,
            imageUrl: items.volumeInfo!.imageLinks!.thumbnail!,
            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
           ),
        ),
      ),
    );
  }
}
// Container(
// decoration: BoxDecoration(
//
// image: DecorationImage(
// fit: BoxFit.fill,
// image: NetworkImage())),
// )
