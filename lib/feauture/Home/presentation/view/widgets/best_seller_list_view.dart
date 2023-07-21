import 'package:bookly/core/errors/custom_error_vwdget.dart';
import 'package:bookly/feauture/Home/presentation/manage/newset_cubit/newset_cubit.dart';
import 'package:bookly/feauture/Home/presentation/manage/newset_cubit/newset_states.dart';
import 'package:bookly/feauture/Home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewSetBooksCubit,NewSetBooksStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=NewSetBooksCubit().get(context);
        if(state is SuccessNewSetBooksStates)
          {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder:(context,index)=>BestSellerListViewItem(
                items: cubit.bookModel!.items![index],
              ),
              itemCount:cubit.bookModel!.items!.length,
            );
          }
        else if(state is ErrorNewSetBooksStates)
          {
            return CustomErrorWidget(text: state.error);
          }
        else
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    );
  }
}
