import 'package:bookly/core/errors/custom_error_vwdget.dart';
import 'package:bookly/feauture/Home/presentation/manage/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly/feauture/Home/presentation/manage/similar_book_cubit/similar_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_list_view.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SimilarBooksCubit()..getData(),
      child: BlocConsumer<SimilarBooksCubit,SimilarBooksStates>(
          listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=SimilarBooksCubit().get(context);
        if(state is SuccessSimilarBooksStates)
          {
            return SizedBox(
              height: MediaQuery.of(context).size.height *.15,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomListViewItem(
                  cubit.bookModel!.items![index],
                ) ,
                separatorBuilder: (context,index)=>const SizedBox(
                  width: 15,
                ),
                itemCount: cubit.bookModel!.items!.length,
              ),
            );
          }
        else if(state is ErrorSimilarBooksStates)
          {
            return CustomErrorWidget(text: state.error);
          }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      }
      ),
    );
  }
}
