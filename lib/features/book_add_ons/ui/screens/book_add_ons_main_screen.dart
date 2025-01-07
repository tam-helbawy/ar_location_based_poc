import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/book_add_ons/ui/screens/add_ons_menu_view.dart';
import 'package:base/features/book_add_ons/ui/screens/payment_invoice_view.dart';
import 'package:base/features/book_add_ons/ui/widgets/successfull_dialog.dart';
import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widgets/icon_handler.dart';
import '../../../../configurations/app_events.dart';
import '../viewmodel/book_add_ons_bloc.dart';

class BookAddOnsMainScreen extends StatelessWidget {
  const BookAddOnsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookAddOnsBloc, AppStates>(
        builder: (context, state) {
          var bloc = BlocProvider.of<BookAddOnsBloc>(context);
          return Column(
            children: [
              //=======================================
              //======================================= Page App Bar
              //=======================================
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top:24,right: 24,left: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(

                  children: [
                    InkWell(
                      onTap: () {
                        if(bloc.currentPageIndex == 0){
                          Navigator.pop(context);
                        }
                        else bloc.add(GoToPreviousPage());
                      },
                      child: drawSvgIcon("line_arrow_back", iconColor: Colors.black, doRotate: SettingsCubit.instance.isEnglish),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Book Add-Ons",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 4,
                      color: Colors.grey,
                    ),
                    Positioned(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),

                        width: MediaQuery.of(context).size.width * bloc.progressValue,
                        height: 4,
                        color: context.theme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              //=======================================
              //======================================= Page Body
              //=======================================
              Expanded(
                child: PageView(
                  controller: bloc.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AddOnsMenuView(),
                    PaymentInvoiceView(),
                  ],
                ),
              ),
              //=======================================
              //======================================= Page Summary
              //=======================================
              Container(
                padding: EdgeInsets.all(24),
                color: Colors.white,
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "",
                    //       style: TextStyle(
                    //         fontSize: SettingsCubit.instance.isTablet ? 18 : 16,
                    //         fontWeight: SettingsCubit.instance.isTablet ? FontWeight.w600 : FontWeight.w400,
                    //       ),
                    //     ),
                    //     Text(
                    //       "",
                    //       style: TextStyle(
                    //         fontSize: SettingsCubit.instance.isTablet ? 20 : 18,
                    //         fontWeight: FontWeight.w700,
                    //         color: context.theme.primary,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 24),
                    BlocBuilder<BookAddOnsBloc, AppStates>(
                      builder: (context, blocState) {
                        var bloc = BlocProvider.of<BookAddOnsBloc>(context);

                        return SizedBox(
                          height: 56,
                          child: (blocState is LoadingState && blocState.type == "pay")
                              ? Center(child: CircularProgressIndicator())
                              : FilledButton(
                                  onPressed: () async {
                                    bloc.add(GoToNextPage());
                                    if(bloc.currentPageIndex == 1){
                                      showSuccessDialog(context: context);
                                    }
                                  },
                                  style: FilledButton.styleFrom(
                                    backgroundColor: context.theme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      bloc.currentPageIndex == 1?"Book Now":"Next",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
