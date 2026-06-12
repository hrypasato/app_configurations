// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppAnimationController)
const appAnimationControllerProvider = AppAnimationControllerProvider._();

final class AppAnimationControllerProvider
    extends $NotifierProvider<AppAnimationController, bool> {
  const AppAnimationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appAnimationControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appAnimationControllerHash();

  @$internal
  @override
  AppAnimationController create() => AppAnimationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appAnimationControllerHash() =>
    r'260991f167fe9f980b0f67cf2258289680cfe148';

abstract class _$AppAnimationController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
