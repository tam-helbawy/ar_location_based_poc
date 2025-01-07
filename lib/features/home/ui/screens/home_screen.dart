import 'package:base/features/book_tickets/ui/screens/book_tickets_main_screen.dart';
import 'package:base/features/book_tickets/ui/viewmodel/book_ticket_bloc.dart';
import 'package:base/features/book_tickets/ui/viewmodel/venue_seats_bloc.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../book_add_ons/ui/screens/book_add_ons_main_screen.dart';
import '../../../book_add_ons/ui/viewmodel/book_add_ons_bloc.dart';
import '../../../book_add_ons/ui/viewmodel/payment_session_bloc.dart';
import '../widgets/service_card_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          ServiceCardView(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.main);
            },
            title: 'AR View',
          ),
          SizedBox(height: 16),
          ServiceCardView(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.seatView360);
            },
            title: 'Seat View 360',
          ),
          SizedBox(height: 16),
          ServiceCardView(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => BookAddOnsBloc()),
                      BlocProvider(create: (context) => PaymentSessionBloc()..startPaymentSession()),
                    ],
                    child: const BookAddOnsMainScreen(),
                  ),
                ),
              );
            },
            title: 'Book Add-Ons',
          ),
          SizedBox(height: 16),
          ServiceCardView(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => BookTicketBloc()),
                      BlocProvider(
                        create: (context) => VenueSeatsBloc(eventId: 1, venueId: 2)..getSeats(),
                      ),
                    ],
                    child: const BookTicketsMainScreen(),
                  ),
                ),
              );

            },
            title: 'Book Tickets',
          ),
        ]),
      ),
    );
  }
}
