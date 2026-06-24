class JapCounterModel {

  final String mantra;
  final String godName;
  int count;
  final int target;

  JapCounterModel({
    required this.mantra,
    required this.godName,
    this.count = 0,
    this.target = 108,
  });
}