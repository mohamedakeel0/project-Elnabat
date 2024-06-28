
import 'package:final_project/layout/domain/entities/ProcessImageEntity.dart';

class ProcessImageModel extends ProcessImageEntity {
  const ProcessImageModel({
    required super.predictedDisease,
  });

  factory ProcessImageModel.fromJson(Map<String, dynamic> json) {
    return ProcessImageModel(
      predictedDisease: json['predicted_disease'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'predicted_disease': predictedDisease,
    };
  }
}
