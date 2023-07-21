import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Home/data/models/home_model.dart';
import '../../manage/search_cubit/search_cubit.dart';
import '../../manage/search_cubit/search_states.dart';
import 'list_view.dart';

class SearchViewBody extends StatelessWidget {
   SearchViewBody({Key? key}) : super(key: key);

   Items? items;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit,SearchBooksStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=SearchBooksCubit().get(context);
          return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value)
                      {
                        cubit.getSearch(value);
                      },
                      onChanged: (value)
                      {
                        cubit.getSearch(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: const Icon(Icons.search)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListViews(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
