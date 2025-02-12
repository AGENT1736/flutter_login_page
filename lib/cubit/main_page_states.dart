import 'package:ict_hub_session/model/product.dart';

abstract class MainPageStates {}

class MainPageInitialState extends MainPageStates {}

class MainPageLoadingState extends MainPageStates {}

class MainPageSuccessState extends MainPageStates {
  final List<Product> products;
  MainPageSuccessState(this.products);
}

class MainPageErrorState extends MainPageStates {
  final String error;
  MainPageErrorState(this.error);
}
