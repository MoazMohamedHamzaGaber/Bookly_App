import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/api_service.dart';
import '../../../../Home/data/models/home_model.dart';
import 'search_states.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates>
{
  SearchBooksCubit() :super(InitialSearchBooksStates());
  SearchBooksCubit get(context)=>BlocProvider.of(context);

  BookModel? bookModel;

  //List<BookModel>search=[];
  void getSearch(String value)
  {
    emit(LoadingSearchBooksStates());
    //search=[];
    ApiService.get(
      url: 'volumes',
      query: {
        'q':value,
      },
    ).then((value)
    {
      //search=value.data['items']['volumeInfo'];
      bookModel=BookModel.fromJson(value.data);
      print(bookModel);
      emit(SuccessSearchBooksStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ErrorSearchBooksStates(error.toString()));
    }
    );
  }
}