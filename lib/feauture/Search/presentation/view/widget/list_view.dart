import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/custom_error_vwdget.dart';
import '../../../../Home/presentation/view/widgets/best_seller_list_view_item.dart';
import '../../manage/search_cubit/search_cubit.dart';
import '../../manage/search_cubit/search_states.dart';

class ListViews extends StatelessWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit,SearchBooksStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=SearchBooksCubit().get(context);
        if(state is LoadingSearchBooksStates)
          {
            return const LinearProgressIndicator();
          }
        if(state is SuccessSearchBooksStates) {
          return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder:(context,index)=>BestSellerListViewItem(
            items: cubit.bookModel!.items![index],
          ),
          itemCount:cubit.bookModel!.items!.length,
        );
        }
        else if(state is ErrorSearchBooksStates)
        {
          return CustomErrorWidget(text: state.error);
        }
        else
        {
          return Container();
        }
      },
    );
  }
}
