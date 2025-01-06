import 'package:base/app/models/select_option.dart';
import 'package:base/features/book_add_ons/domain/models/addon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class BookTicketBloc extends Bloc<AppEvents, AppStates> {
  BookTicketBloc() : super(InitialState()) {
    on<GoToNextPage>(_goToNextPageEvent);
    on<GoToPreviousPage>(_goToPreviousPageEvent);
    on<RefreshEvent>(_refresh);
  }

  //=======================================
  //======================================= Variables
  //=======================================
  final PageController pageController = PageController();
  int currentPageIndex = 0;
  SelectOption? selectedAddonCategory;

  double get progressValue => (currentPageIndex + 1) / 2;

  //=======================================
  //======================================= Functions
  //=======================================
  Future<void> _goToNextPage() async {
    currentPageIndex++;
    pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
  }

  Future<void> _goToPreviousPage() async {
    currentPageIndex--;
    pageController.previousPage(duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
  }

  //=======================================
  //======================================= Events
  //=======================================
  _goToNextPageEvent(GoToNextPage event, Emitter emit) async {
    bool canGoToNextPage = false;
    switch (currentPageIndex) {
      case 1:
        canGoToNextPage = false;
        break;
      default:
        canGoToNextPage = true;
        break;
    }
    if (canGoToNextPage) {
      await _goToNextPage();
      emit(InitialState());
    }
  }

  _goToPreviousPageEvent(GoToPreviousPage event, Emitter emit) async {
    await _goToPreviousPage();
    emit(InitialState());
  }

  _refresh(RefreshEvent event, Emitter emit) => emit(InitialState());
}
