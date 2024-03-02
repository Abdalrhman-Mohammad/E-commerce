// import 'package:ecommerce/models/cart_order_model.dart';
// import 'package:ecommerce/view_models/product_details_cubit/product_details_cubit.dart';
// import 'package:ecommerce/views/widgets/completed_cart_order_item.dart';
// import 'package:ecommerce/views/widgets/on_progress_cart_order_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderPage extends StatefulWidget {
//   const OrderPage({super.key});

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   @override
//   Widget build(BuildContext context) {
//     final ProductDetailsCubit productDetailsCubit =
//         BlocProvider.of<ProductDetailsCubit>(context);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "My Order",
//           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(Icons.shopping_cart),
//           )
//         ],
//       ),
//       body: DefaultTabController(
//         length: 2,
//         child: Column(
//           children: [
//             const TabBar(
//               tabs: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
//                   child: Text("My Order"),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
//                   child: Text("History"),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TabBarView(
//                   children: [
//                     BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
//                       bloc: productDetailsCubit,
//                       buildWhen: (previous, current) =>
//                           current is GetFromCartError ||
//                           current is GetFromCartLoaded ||
//                           current is GetFromCartLoading,
//                       builder: (context, state) {
//                         if (state is GetFromCartError) {
//                           return Center(
//                             child: Text(state.error),
//                           );
//                         }
//                         if (state is GetFromCartLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator.adaptive(),
//                           );
//                         }
//                         if (state is GetFromCartLoaded) {
//                           return ListView.builder(
//                             itemCount: dummyCartOrders.length,
//                             itemBuilder: (context, index) {
//                               return OnProgressCardOrderItem(
//                                   order: dummyCartOrders[index]);
//                             },
//                           );
//                         } else {
//                           return const SizedBox();
//                         }
//                       },
//                     ),
//                     ListView.builder(
//                       itemCount: dummyCartOrdersCompleted.length,
//                       itemBuilder: (context, index) {
//                         return CompletedCardOrderItem(
//                             order: dummyCartOrdersCompleted[index]);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
