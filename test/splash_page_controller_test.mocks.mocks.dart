// Mocks generated by Mockito 5.4.4 from annotations
// in smart_recycling/test/splash_page_controller_test.mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smart_recycling/src/modules/views/splash/splash_page_controller.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SplashPageController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashPageController extends _i1.Mock
    implements _i2.SplashPageController {
  MockSplashPageController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> validatePrefs() => (super.noSuchMethod(
        Invocation.method(
          #validatePrefs,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
