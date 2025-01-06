import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_states.dart';
import '../../domain/models/seat_model.dart';
import '../core/seats_map_controller.dart';

class VenueSeatsBloc extends Cubit<AppStates> {
  /// The ticket categories came from the event details
  /// it will be used to map the colors and prices of the seats
  /// ============================================================
  VenueSeatsBloc({required this.eventId, required this.venueId}) : super(LoadingState());
  //=====================================
  //===================================== Variables
  //=====================================
  final int eventId;
  final int venueId;
  SeatsMapController? seatsMapController;

  //=====================================
  //===================================== Functions
  //=====================================
  void _processData() => seatsMapController!.mapSeats();

  SeatsMapController _getSeats() => SeatsMapController(
        columnCount: 3,
        rowCount: 1,
        seats: [
          [
            Seat(
              categoryId: 1,
              status: SeatStatus.available,
              row: 0,
              column: 0,
              seatIndex: 1,
              label: 'A1',
              ticketSeatId: 1,
            ),
            Seat(
              categoryId: 2,
              status: SeatStatus.available,
              row: 0,
              column: 1,
              seatIndex: 2,
              label: 'A2',
              ticketSeatId: 2,
            ),
            Seat(
              categoryId: 3,
              status: SeatStatus.available,
              row: 0,
              column: 2,
              seatIndex: 3,
              label: 'A3',
              ticketSeatId: 3,
            ),
          ]
        ],
      );

  //=====================================
  //===================================== Events
  //=====================================
  void getSeats() async {
    try {
      emit(LoadingState());
      seatsMapController = _getSeats();
      _processData();
      seatsMapController!.seats.isEmpty ? emit(EmptyState()) : emit(LoadedState(""));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void selectSeat(int rowIndex, int columnIndex, SeatStatus status) {
    seatsMapController!.selectSeat(rowIndex, columnIndex, status);
    emit(LoadedState(""));
  }
}
