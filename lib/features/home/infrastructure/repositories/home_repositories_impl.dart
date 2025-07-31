import 'package:hairbook_app/features/home/domain/datasources/home_datasource.dart';
import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';
import 'package:hairbook_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl({required this.homeDatasource});

  @override
  Future<List<Salon>> getSalons() {
    return homeDatasource.getSalons();
  }

  @override
  Future<Salon> getSalonById(String salonId) {
    return homeDatasource.getSalonById(salonId);
  }
}
