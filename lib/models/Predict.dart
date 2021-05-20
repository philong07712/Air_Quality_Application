class Predict {
  int f1 = 30;
  int f8 = 30;
  int f24 = 30;
  Predict();
  factory Predict.fromJson(Map<String, dynamic> json) {
    if (json == null) return Predict();
    Predict predict = Predict();
    predict.f1 = json['f1'];
    predict.f8 = json['f8'];
    predict.f24 = json['f24'];
    return predict;
  }
}