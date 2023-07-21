import 'package:bookly/core/utiles/api_service.dart';
import 'package:bookly/feauture/Home/data/models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature_books_states.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksStates>
{
  FeatureBooksCubit() :super(InitialFeatureBooksStates());
  FeatureBooksCubit get(context)=>BlocProvider.of(context);

   BookModel? bookModel;
  void getData()
  {
    emit(LoadingFeatureBooksStates());
    ApiService.get(
        url: 'volumes?q=programming&Sorting=relevace&Filtering=free-ebooks',
      // query: {
      //   'q':'programming',
      // },
    ).then((value)
    {
      bookModel=BookModel.fromJson(value.data);
      emit(SuccessFeatureBooksStates());
    }
    ).catchError((error)
    {
      emit(ErrorFeatureBooksStates(error.toString()));
    }
    );
  }
  // final HomeRepository homeRepo;
  // late BookModel bookModel;
  // void fetchFeatureBooks()async
  // {
  //   emit(LoadingFeatureBooksStates());
  //   var result=await homeRepo.fetchFeaturesBooks();
  //  var bookModel= result.fold((failure)
  //       {
  //         emit(ErrorFeatureBooksStates(failure.toString()));
  //       }, (books)
  //   {
  //     emit(SuccessFeatureBooksStates(
  //       books
  //     ));
  //   }
  //   );
  // }
}