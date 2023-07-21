import 'package:bookly/core/errors/custom_error_vwdget.dart';
import 'package:bookly/feauture/Home/presentation/manage/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/feauture/Home/presentation/manage/feature_books_cubit/feature_books_states.dart';
import 'package:bookly/feauture/Home/presentation/view/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit,FeatureBooksStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=FeatureBooksCubit().get(context);
        if(state is SuccessFeatureBooksStates)
          {
            return Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *.28,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>  CustomListViewItem(
                    cubit.bookModel!.items![index],
                  ),
                  separatorBuilder: (context,index)=>const SizedBox(
                    width: 15,
                  ),
                  itemCount: cubit.bookModel!.items!.length,
                ),
              ),
            );
          }
        else if(state is ErrorFeatureBooksStates)
          {
            return CustomErrorWidget(text: state.error,);
          }
        else
          {
            return const Center(child: CircularProgressIndicator());
          }
      },
    );
  }
}
