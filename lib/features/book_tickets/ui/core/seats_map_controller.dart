

import 'package:base/configurations/app_theme.dart';
import 'package:base/utilities/extensions.dart';

import '../../domain/models/seat_model.dart';

class SeatsMapController {
  int columnCount;
  int rowCount;
  List<List<Seat?>> seats = [];
  int zoomLevel = 0;

  SeatsMapController({
    required this.columnCount,
    required this.rowCount,
    required this.seats,
  });

  void zoomIn() {
    if (zoomLevel < 3) {
      zoomLevel++;
    }
  }

  void zoomOut() {
    if (zoomLevel > 0) {
      zoomLevel--;
    }
  }

  void mapSeats() {
    _mapColors();
    _mapPrice();
  }

  void selectSeat(int rowIndex, int columnIndex, SeatStatus status) => seats[rowIndex][columnIndex]!.status = status;

  void _mapColors() {
    seats.forEach((element) {
      element.forEach((seat) {
        if (seat != null) seat.color = stcTheme.primary;
      });
    });
  }

  void _mapPrice() {
    seats.forEach((element) {
      element.forEach((seat) {
        if (seat != null) {
          seat.price = 50;
        }
      });
    });
  }


}