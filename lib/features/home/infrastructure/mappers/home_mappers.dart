import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';

class HomeMapper {
  static Salon fromJson(Map<String, dynamic> json) => Salon(
    id: json['id'],
    name: json['name'],
    location: json['location'],
    description: json['description'],
    creditCost: json['creditCost'].toInt() ?? 0,
    image: json['image'],
    type: json['type'],
  );
}
