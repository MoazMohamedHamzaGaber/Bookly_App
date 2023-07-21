import 'package:bookly/feauture/Home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/home_model.dart';

class BookDetailsView extends StatelessWidget {
   BookDetailsView({Key? key, required this.items}) : super(key: key);

  Items items;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(
        items: items,
      ),
    );
  }
}
