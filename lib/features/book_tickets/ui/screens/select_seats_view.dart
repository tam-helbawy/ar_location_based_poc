import 'package:base/app/bloc/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/widgets/icon_handler.dart';
import '../../../../configurations/app_states.dart';
import '../viewmodel/venue_seats_bloc.dart';
import '../widgets/booking_seats_widget.dart';

class VenueSeatsSelector extends StatefulWidget {
  const VenueSeatsSelector();

  @override
  State<VenueSeatsSelector> createState() => _VenueSeatsSelectorState();
}

class _VenueSeatsSelectorState extends State<VenueSeatsSelector> {
  @override
  Widget build(BuildContext context) {
    var seatsBloc = BlocProvider.of<VenueSeatsBloc>(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              BlocBuilder<VenueSeatsBloc, AppStates>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return BookingSeatsWidget(
                    seatsList: seatsBloc.seatsMapController!.seats,
                    rowCount: seatsBloc.seatsMapController!.rowCount,
                    zoomLevel: seatsBloc.seatsMapController!.zoomLevel,
                    onBook: (seat) {
                      seatsBloc.selectSeat(seat.row, seat.column, seat.status);
                      // bloc.addTicket(seat.ticket);
                    },
                    onUnBook: (seat) {
                      seatsBloc.selectSeat(seat.row, seat.column, seat.status);
                      // bloc.removeTicket(seat.ticket);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: SettingsCubit.instance.isEnglish ? null : 16,
          left: SettingsCubit.instance.isEnglish ? 16 : null,
          child: Column(
            children: [
              IconButton(
                icon: drawSvgIcon("zoom_in"),
                style: IconButton.styleFrom(
                  shape: CircleBorder(),
                  fixedSize: Size(44, 44),
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: Color(0xff909090).withOpacity(.25),
                ),
                onPressed: () {
                  seatsBloc.seatsMapController!.zoomIn();
                  setState(() {});
                },
              ),
              SizedBox(height: 8),
              IconButton(
                icon: drawSvgIcon("zoom_out"),
                style: IconButton.styleFrom(
                  shape: CircleBorder(),
                  fixedSize: Size(44, 44),
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: Color(0xff909090).withOpacity(.25),
                ),
                onPressed: () {
                  seatsBloc.seatsMapController!.zoomOut();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
