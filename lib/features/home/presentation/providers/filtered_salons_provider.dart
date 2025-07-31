import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';
import 'package:hairbook_app/features/home/presentation/providers/home_provider.dart';
import 'package:hairbook_app/features/home/presentation/providers/salon_filter_provider.dart';

part 'filtered_salons_provider.g.dart';

@riverpod
List<Salon> filteredSalons(Ref ref) {
  final filter = ref.watch(salonFilterProvider);
  final salonsAsync = ref.watch(salonsProvider);

  return salonsAsync.when(
    data: (salons) {
      if (filter == null) return salons;
      return salons.where((salon) => salon.type == filter).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
}
