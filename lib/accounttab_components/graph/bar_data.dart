import 'package:fokkkus/accounttab_components/graph/individual_bar.dart';

class BarData {
  final int sunTime;
  final int monTime;
  final int tueTime;
  final int wedTime;
  final int thurTime;
  final int friTime;
  final int satTime;

  BarData(
      {required this.sunTime,
      required this.monTime,
      required this.tueTime,
      required this.wedTime,
      required this.thurTime,
      required this.friTime,
      required this.satTime});

  List<IndividualBar> barData = [];
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunTime),
      IndividualBar(x: 1, y: monTime),
      IndividualBar(x: 2, y: tueTime),
      IndividualBar(x: 3, y: wedTime),
      IndividualBar(x: 4, y: thurTime),
      IndividualBar(x: 5, y: friTime),
      IndividualBar(x: 6, y: satTime),
    ];
  }
}
