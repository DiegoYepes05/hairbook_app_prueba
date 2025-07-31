import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'salon_filter_provider.g.dart';

@riverpod
class SalonFilter extends _$SalonFilter {
  @override
  String? build() => null;

  void setFilter(String? type) {
    state = type;
  }

  void clearFilter() {
    state = null;
  }
}
