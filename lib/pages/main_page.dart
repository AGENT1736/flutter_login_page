import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/cubit/main_page_cubit.dart';
import 'package:ict_hub_session/cubit/main_page_states.dart';
//import 'package:ict_hub_session/model/product.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit()..fetchProducts(),
      child: Scaffold(
        //this is the app bar of the application
        appBar: AppBar(
          title: const Text(
            "Products",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        //this is where the body of the application will be
        body: BlocBuilder<MainPageCubit, MainPageStates>(
            builder: (context, state) {
          if (state is MainPageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MainPageSuccessState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                  ),
                );
              },
            );
          } else if (state is MainPageErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text('No data available!'),
          );
        }),
      ),
    );
  }
}
