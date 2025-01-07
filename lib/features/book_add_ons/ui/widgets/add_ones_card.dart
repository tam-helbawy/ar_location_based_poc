import 'package:base/features/book_add_ons/ui/viewmodel/book_add_ons_bloc.dart';
import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widgets/network_cashed_image.dart';
import '../../domain/models/addon.dart';

class AdditionCard extends StatefulWidget {
  const AdditionCard({required this.addition, required this.additionsCount});

  final Addon addition;
  final int additionsCount;
  @override
  State<AdditionCard> createState() => _AdditionCardState();
}

class _AdditionCardState extends State<AdditionCard> {

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BookAddOnsBloc>(context);
    return Row(
      children: [
        CustomNetworkImage.containerNewWorkImage(
          image: widget.addition.imageUrl,
          fit: BoxFit.cover,
          width: 48,
          height: 48,
          radius: 8,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.addition.name,maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              SizedBox(height: 4),
              Text("${widget.addition.priceWithVat} ${"RES"}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: context.theme.primary)),

            ],
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: () {
            if (widget.additionsCount > 0) {
              bloc.removeAddition(widget.addition.name);
            }
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.grey[300]!),
            ),
            child: Center(
              child: Icon(Icons.remove, size: 16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(widget.additionsCount.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ),
        InkWell(
          onTap: () {
            bloc.addAddition(widget.addition);
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.grey[300]!),
            ),
            child: Center(
              child: Icon(Icons.add, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
