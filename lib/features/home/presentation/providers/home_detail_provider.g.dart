// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeDetailHash() => r'689cef7dc71a3a45841bd6d59b90b955381c677c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [homeDetail].
@ProviderFor(homeDetail)
const homeDetailProvider = HomeDetailFamily();

/// See also [homeDetail].
class HomeDetailFamily extends Family<AsyncValue<Salon>> {
  /// See also [homeDetail].
  const HomeDetailFamily();

  /// See also [homeDetail].
  HomeDetailProvider call(String salonId) {
    return HomeDetailProvider(salonId);
  }

  @override
  HomeDetailProvider getProviderOverride(
    covariant HomeDetailProvider provider,
  ) {
    return call(provider.salonId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homeDetailProvider';
}

/// See also [homeDetail].
class HomeDetailProvider extends AutoDisposeFutureProvider<Salon> {
  /// See also [homeDetail].
  HomeDetailProvider(String salonId)
    : this._internal(
        (ref) => homeDetail(ref as HomeDetailRef, salonId),
        from: homeDetailProvider,
        name: r'homeDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$homeDetailHash,
        dependencies: HomeDetailFamily._dependencies,
        allTransitiveDependencies: HomeDetailFamily._allTransitiveDependencies,
        salonId: salonId,
      );

  HomeDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salonId,
  }) : super.internal();

  final String salonId;

  @override
  Override overrideWith(
    FutureOr<Salon> Function(HomeDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HomeDetailProvider._internal(
        (ref) => create(ref as HomeDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salonId: salonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Salon> createElement() {
    return _HomeDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeDetailProvider && other.salonId == salonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HomeDetailRef on AutoDisposeFutureProviderRef<Salon> {
  /// The parameter `salonId` of this provider.
  String get salonId;
}

class _HomeDetailProviderElement extends AutoDisposeFutureProviderElement<Salon>
    with HomeDetailRef {
  _HomeDetailProviderElement(super.provider);

  @override
  String get salonId => (origin as HomeDetailProvider).salonId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
