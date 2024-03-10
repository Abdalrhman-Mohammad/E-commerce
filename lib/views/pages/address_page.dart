import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    final size = MediaQuery.of(context).size;
    String choosenAddress;
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              choosenAddress = state.addresses[0].title;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your location",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Let's find your unforgettable event. Choose a location below to get started.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  SizedBox(height: 16),
                  DropdownMenu(
                    width: size.width / 2,
                    dropdownMenuEntries: state.addresses
                        .map<DropdownMenuEntry>(
                          (e) => DropdownMenuEntry(value: e, label: e.title),
                        )
                        .toList(),
                    onSelected: (value) {
                      AddressModel address = value;
                      choosenAddress = address.title;
                    },
                    initialSelection: Text(choosenAddress),
                    // label: Text(choosenAddress),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MainButton(
                      title: "Confirm",
                      onPressed: () async {
                        await checkoutCubit.setAddress(choosenAddress);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
            } else {
              return Text("Error Page");
            }
          },
        ),
      ),
    );
  }
}
