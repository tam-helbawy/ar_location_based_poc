import 'package:base/configurations/app_events.dart';
import 'package:base/features/book_add_ons/domain/models/addon.dart';
import 'package:base/features/book_add_ons/ui/viewmodel/book_add_ons_bloc.dart';
import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/models/select_option.dart';
import '../../../../app/widgets/icon_handler.dart';
import '../widgets/add_ones_card.dart';
import '../widgets/addons_categories_bottom_sheet.dart';

class AddOnsMenuView extends StatelessWidget {
  const AddOnsMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BookAddOnsBloc>(context);
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text("Select Add-Ons", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              Spacer(),
              SizedBox(
                height: 40,
                child: FilledButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddonCategoriesBottomSheet(
                          options: [SelectOption(-1, "All"), SelectOption(1, "Category 1"), SelectOption(2, "Category 2")],
                          selectedOption: bloc.selectedAddonCategory,
                          onSelect: (option) {
                            if(option.value != -1) {
                              bloc.selectedAddonCategory = option;
                            } else {
                              bloc.selectedAddonCategory = null;
                            }
                            bloc.add(RefreshEvent());
                          },
                        );
                      },
                    );
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        bloc.selectedAddonCategory!=null?bloc.selectedAddonCategory!.label:"All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: bloc.selectedAddonCategory!=null ? FontWeight.w700 : FontWeight.w500,
                          color: bloc.selectedAddonCategory!=null?context.theme.primary:Colors.grey[600],
                        ),
                      ),

                      SizedBox(width: 8),
                      drawSvgIcon("arrow_down_ios", width: 16, height: 16, iconColor: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: Colors.grey[300]!),
              ),
              child: AdditionCard(
                addition: BlocProvider.of<BookAddOnsBloc>(context).addOnsDummyData[index],
                additionsCount: BlocProvider.of<BookAddOnsBloc>(context).getAdditionCountFor(BlocProvider.of<BookAddOnsBloc>(context).addOnsDummyData[index].name),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: BlocProvider.of<BookAddOnsBloc>(context).addOnsDummyData.length,
          ),
        ),
      ],
    );
  }
}
