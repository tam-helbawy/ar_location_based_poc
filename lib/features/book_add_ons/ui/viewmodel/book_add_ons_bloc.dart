import 'package:base/app/models/select_option.dart';
import 'package:base/features/book_add_ons/domain/models/addon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class BookAddOnsBloc extends Bloc<AppEvents, AppStates> {
  BookAddOnsBloc() : super(InitialState()) {
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
  List<Addon> selectedAddOns = [];
  List<Addon> addOnsDummyData = [
    Addon(id: 1, name: "Salad 1", price: 10, priceWithVat: 10, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 1),
    Addon(id: 2, name: "Salad 2", price: 20, priceWithVat: 20, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 1),
    Addon(id: 3, name: "Salad 3", price: 30, priceWithVat: 30, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 2),
    Addon(id: 4, name: "Salad 4", price: 40, priceWithVat: 40, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 2),
    Addon(id: 5, name: "Salad 5", price: 50, priceWithVat: 50, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 3),
    Addon(id: 6, name: "Salad 6", price: 60, priceWithVat: 60, imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", categoryId: 3),
  ];
  int get totalAdditions => selectedAddOns.length;
  double get progressValue => (currentPageIndex + 1) / 2;
  double get totalAdditionsPrice {
    double total = 0;
    selectedAddOns.forEach((element) {
      total += element.price;
    });
    return total;
  }

  double get totalAdditionsPriceWithTax {
    double total = 0;
    selectedAddOns.forEach((element) {
      total += element.priceWithVat;
    });
    return total;
  }

  double get totalInvoicePrice => totalAdditionsPrice;

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

  addAddition(Addon addition) {
    selectedAddOns.add(addition);
    add(RefreshEvent());
  }

  removeAddition(String name) {
    selectedAddOns.remove(selectedAddOns.firstWhere((element) => element.name == name));
    add(RefreshEvent());
  }

  int getAdditionCountFor(String name) {
    return selectedAddOns.where((addition) => addition.name == name).length;
  }

  //=======================================
  //======================================= Events
  //=======================================
  _goToNextPageEvent(GoToNextPage event, Emitter emit) async {
    bool canGoToNextPage = false;
    switch (currentPageIndex) {
      case 0:
        canGoToNextPage = selectedAddOns.isNotEmpty;
        break;
      default:
        canGoToNextPage = false;
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
