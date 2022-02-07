
class Event {
  final String title;
  final bool gb;
  Event({required this.title, required this.gb});

  @override
  String toString() => this.title;
  bool tobool() => this.gb;

}