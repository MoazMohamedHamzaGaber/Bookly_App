import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/api_service.dart';
import '../../../data/models/home_model.dart';
import 'newset_states.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksStates>
{
  NewSetBooksCubit() :super(InitialNewSetBooksStates());
  NewSetBooksCubit get(context)=>BlocProvider.of(context);

  BookModel? bookModel;
  void getData()
  {
    emit(LoadingNewSetBooksStates());
    ApiService.get(
      url: 'volumes',
      query: {
        'q':'image proccessing',
      },
    ).then((value)
    {
      bookModel=BookModel.fromJson(value.data);
      print(bookModel);
      emit(SuccessNewSetBooksStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ErrorNewSetBooksStates(error.toString()));
    }
    );
  }
}