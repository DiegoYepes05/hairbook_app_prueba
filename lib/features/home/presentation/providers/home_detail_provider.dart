import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';
import 'package:hairbook_app/features/home/presentation/providers/home_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_detail_provider.g.dart';

@riverpod
FutureOr<Salon> homeDetail(Ref ref, String salonId) {
  final repository = ref.watch(homeRepositoryProvider);
  return repository.getSalonById(salonId);
}
