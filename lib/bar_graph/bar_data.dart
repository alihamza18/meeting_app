import 'package:alpha_ui/bar_graph/individual_bar.dart';

class BarData{
  final double MonAmount;
  final double  TueAmount;
  final double  wedAmount;
  final double  thurAmount;
  final double  friAmount;
  final double  satAmount;
  final double sunAmount;

  BarData({
    required this.MonAmount,
    required this.TueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
});

  List<IndividualBar> barData=[];

//   initialize Bar data

  void initializeBarData(){
    barData=[
    //   mon
      IndividualBar(x: 0, y: MonAmount),
      //   Tue
      IndividualBar(x: 1, y: TueAmount),
      //   wed
      IndividualBar(x: 2, y: wedAmount),
      //   thur
      IndividualBar(x: 3, y: thurAmount),
      //   fri
      IndividualBar(x: 4, y: friAmount),
      //   sat
      IndividualBar(x: 5, y: satAmount),
      //   sun
      IndividualBar(x: 6, y: sunAmount)
    ];
  }
}