import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';

abstract class HomeRepository {
  Future<List<Salon>> getSalons();
  Future<Salon> getSalonById(String salonId);
}
