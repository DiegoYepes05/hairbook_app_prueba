import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hairbook_app/features/home/domain/repositories/home_repository.dart';
import 'package:hairbook_app/features/home/infrastructure/datasources/home_datasource_impl.dart';
import 'package:hairbook_app/features/home/infrastructure/repositories/home_repositories_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_repository_provider.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(homeDatasource: HomeDataSourceImpl());
}
