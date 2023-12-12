import 'package:weather_app/features/weather_info/domain/entities/condition_entity/condition_entity.dart';

class ConditionModel extends ConditionEntity {
  const ConditionModel({
    required super.text,
    required super.icon,
    required super.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}
