import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop_client/workshop_client.dart';

import '../../../data/repo/repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductFetchEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await productRepo.getProductList();
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });

    on<ProductAddToCartEvent>((event, emit) async {
      final currentState = state as ProductLoadedState;

      emit(ProductLoadingState());
      try {
        var cartItem = Cart(
          userId: 1,
          productId: event.product.id ?? 0,
          productName: event.product.name,
          quantity: 1,
          totalAmount: event.product.price,
        );

        await cartRepo.addCart(cartItem);
        emit(ProductShowMessageState("Product added to cart"));
      } catch (e) {
        emit(ProductShowMessageState(e.toString()));
      }
      emit(currentState);
    });
  }
}
