import 'dart:developer';

import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import '../../domain/models/seat_model.dart';

class BookingSeatsWidget extends StatefulWidget {
  const BookingSeatsWidget({required this.onBook, required this.onUnBook, required this.seatsList, required this.rowCount, this.zoomLevel = 0});

  final Function(Seat seat) onBook;
  final Function(Seat seat) onUnBook;
  final List<List<Seat?>> seatsList;
  final int rowCount;
  final int zoomLevel;

  @override
  State<BookingSeatsWidget> createState() => _BookingSeatsWidgetState();
}

class _BookingSeatsWidgetState extends State<BookingSeatsWidget> {
  // final int rows;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16),
            child: Column(
              children: List.generate(
                widget.rowCount,
                (rowIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: List.generate(
                      widget.seatsList[rowIndex].length,
                      (columnIndex) => widget.seatsList[rowIndex][columnIndex] == null
                          ? SizedBox(width: 38, height: 30)
                          : Padding(
                              padding: EdgeInsets.only(left: columnIndex != 0 ? 8 : 0),
                              child: SeatWidget(
                                size: 30 + (10 * widget.zoomLevel.toDouble()),
                                seat: widget.seatsList[rowIndex][columnIndex]!,
                                onTap: (seat) {
                                  widget.seatsList[rowIndex][columnIndex] = seat;
                                  if (seat.status == SeatStatus.selected)
                                    widget.onBook(seat);
                                  else
                                    widget.onUnBook(seat);
                                },
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SeatWidget extends StatefulWidget {
  const SeatWidget({required this.seat, required this.onTap, this.size = 30});

  final Seat seat;
  final Function(Seat) onTap;
  final double size;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  Color get _mapStatusColor {
    switch (widget.seat.status) {
      case SeatStatus.available:
        return widget.seat.color ?? Colors.red;
      case SeatStatus.booked:
        return Color(0xffD2D2D2);
      case SeatStatus.selected:
        return stcTheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.seat.status != SeatStatus.booked) {
          widget.seat.status = widget.seat.status == SeatStatus.available ? SeatStatus.selected : SeatStatus.available;
          widget.onTap(widget.seat);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: _mapStatusColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.seat.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
