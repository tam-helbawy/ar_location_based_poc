abstract class AppEvents {}

class FetchDataEvent extends AppEvents {}
class SaveEvent extends AppEvents {
  final dynamic data;
  SaveEvent(this.data);
}
class UpdateEvent extends AppEvents {
  final dynamic data;
  UpdateEvent(this.data);
}
class DeleteEvent extends AppEvents {
  final dynamic data;
  DeleteEvent(this.data);
}
class ClickEvent extends AppEvents {
  final dynamic data;
  ClickEvent({this.data});
}
class RefreshEvent extends AppEvents {
  final dynamic data;
  RefreshEvent({this.data});
}
class PayEvent extends AppEvents {
  final dynamic data;
  PayEvent({this.data});
}
class GoToNextPage extends AppEvents {
  final dynamic data;
  GoToNextPage({this.data});
}
class GoToPreviousPage extends AppEvents {
  final dynamic data;
  GoToPreviousPage({this.data});
}
