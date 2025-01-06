import 'dart:ui';


class Seat {
  final int row;
  final int column;
  final int seatIndex;
  final String label;
  Color? color;
  double price = 0;
  SeatStatus status;

  Seat({
    required num categoryId,
    required this.row,
    required this.column,
    required this.seatIndex,
    required this.status,
    required this.label,
    required num ticketSeatId,
  });
}

enum SeatStatus {
  available,
  booked,
  selected,
}
