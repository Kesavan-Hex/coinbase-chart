class QuickModel {
  MaticNetwork? maticNetwork;

  QuickModel({this.maticNetwork});

  QuickModel.fromJson(Map<String, dynamic> json) {
    maticNetwork = json['matic-network'] != null
        ? new MaticNetwork.fromJson(json['matic-network'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.maticNetwork != null) {
      data['matic-network'] = this.maticNetwork!.toJson();
    }
    return data;
  }
}

class MaticNetwork {
  double? inr;

  MaticNetwork({this.inr});

  MaticNetwork.fromJson(Map<String, dynamic> json) {
    inr = json['inr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inr'] = this.inr;
    return data;
  }
}
