import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/cubit/main_page_states.dart';
import 'package:ict_hub_session/model/product.dart';

class MainPageCubit extends Cubit<MainPageStates> {
  MainPageCubit() : super(MainPageInitialState());

  static MainPageCubit get(context) => BlocProvider.of(context);

  final Dio _dio = Dio();

  void fetchProducts() async {
    emit(MainPageLoadingState());

    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> products =
            data.map((json) => Product.fromJson(json)).toList();
        emit(MainPageSuccessState(products));
      }
    } catch (e) {
      emit(MainPageErrorState('Failed to fetch products: $e'));
    }
  }
}
