import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/api_service.dart';
import '../../../data/models/home_model.dart';
import 'similar_book_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates>
{
  SimilarBooksCubit() :super(InitialSimilarBooksStates());
  SimilarBooksCubit get(context)=>BlocProvider.of(context);

  BookModel? bookModel;
  void getData()
  {
    emit(LoadingSimilarBooksStates());
    ApiService.get(
      url: 'volumes',
      query: {
        'q':'programming',
      },
    ).then((value)
    {
      bookModel=BookModel.fromJson(value.data);
      print(bookModel);
      emit(SuccessSimilarBooksStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ErrorSimilarBooksStates(error.toString()));
    }
    );
  }
}