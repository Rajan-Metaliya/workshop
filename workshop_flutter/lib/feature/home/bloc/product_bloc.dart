import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:workshop_client/workshop_client.dart';

import '../../../data/repo/repo.dart';
import '../../../data/service/service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductFetchEvent>((event, emit) async {
      if (!event.isRefresh) {
        emit(ProductLoadingState());
      }

      try {
        final products =
            await productRepo.getProductList(authService.user.userId);
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });

    on<ProductAddToCartEvent>((event, emit) async {
      final currentState = state as ProductLoadedState;

      try {
        EasyLoading.show(status: 'Adding item to cart');
        var cartItem = Cart(
          cartId: Faker().guid.guid(),
          userId: authService.user.userId,
          productId: event.product.productId,
          productName: event.product.name,
          quantity: event.quantity,
          productAmount: event.product.price,
          totalAmount: event.product.price * event.quantity,
        );

        await cartRepo.addCart(cartItem);
        emit(ProductShowMessageState("Product added to cart"));
      } catch (e) {
        emit(ProductShowMessageState(e.toString()));
      } finally {
        EasyLoading.dismiss();
      }
      add(ProductFetchEvent());
    });

    on<ProductAddProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        EasyLoading.show(status: 'Adding item to cart');
        var product = Product(
          productId: Faker().guid.guid(),
          name: faker.company.person.name(),
          price: faker.randomGenerator.amount((_) => 11.0, 1, min: 1).first,
          description: faker.lorem.sentence(),
          image: faker.image.image(),
        );

        await productRepo.addProduct(product);
        emit(ProductShowMessageState("Product added"));
      } catch (e) {
        emit(ProductShowMessageState(e.toString()));
      } finally {
        EasyLoading.dismiss();
      }
      add(ProductFetchEvent());
    });
  }
}
