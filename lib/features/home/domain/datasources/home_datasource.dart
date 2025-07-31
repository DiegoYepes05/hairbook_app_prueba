import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';

abstract class HomeDatasource {
  Future<List<Salon>> getSalons();
  Future<Salon> getSalonById(String salonId);
}
