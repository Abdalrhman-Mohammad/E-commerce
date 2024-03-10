import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:ecommerce/views/pages/address_page.dart';
import 'package:ecommerce/views/widgets/address_widget.dart';
import 'package:ecommerce/views/widgets/checkout_product.dart';
import 'package:ecommerce/views/widgets/checkout_titles.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:ecommerce/views/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    final size = MediaQuery.of(context).size;
    String? paymentWay;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          bloc: checkoutCubit,
          buildWhen: (previous, current) =>
              current is CheckoutPageError ||
              current is CheckoutPageLoaded ||
              current is CheckoutPageLoading,
          builder: (context, state) {
            if (state is CheckoutPageError) {
              return Center(child: Text(state.error));
            } else if (state is CheckoutPageLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is CheckoutPageLoaded) {
              final orders = state.orders;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckOutTitles(
                    title: "Address",
                    editFunction: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider.value(
                              value: checkoutCubit,
                              child: AddressPage(),
                            );
                          },
                        ),
                      ).then(
                        (value) => checkoutCubit.getPageData(),
                      );
                    },
                  ),
                  AddressWidget(address: state.address),
                  CheckOutTitles(
                    title: "Products",
                    numberOfItems: 3,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return CheckoutProduct(order: orders[index]);
                    },
                  ),
                  const CheckOutTitles(title: "Payment Method"),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColors.white,
                          constraints: BoxConstraints(
                            maxHeight: (size.height / 3) * 2,
                            minHeight: size.height / 3,
                            minWidth: size.width,
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment Method",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  SizedBox(height: 24),
                                  ...state.paymentMethods.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: InkWell(
                                        onTap: () {
                                          paymentWay = e.name;
                                          Navigator.pop(context);
                                        },
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              color: AppColors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  child: Image.network(
                                                    e.imgUrl,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 12),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      e.code,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .grey),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            );
                          },
                        ).then((value) {
                          checkoutCubit.setPaymentMethod(paymentWay);
                          checkoutCubit.getPageData();
                        });
                      },
                      child: PaymentMethodWidget(
                          paymentMethod: state.prefferedPayment)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey,
                            ),
                      ),
                      Text(
                        "\$ ${state.subTotal + state.shipping}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MainButton(
                      title: "Checkout Now",
                      onPressed: () {},
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: Text("Error Page"));
            }
          },
        ),
      ),
    );
  }
}
