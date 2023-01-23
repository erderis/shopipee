// Mocks generated by Mockito 5.3.2 from annotations
// in portfolio/test/features/category/data/repositories/category_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:portfolio/core/network/network_info.dart' as _i5;
import 'package:portfolio/features/category/data/datasources/category_local.dart'
    as _i3;
import 'package:portfolio/features/category/data/datasources/category_remote.dart'
    as _i6;
import 'package:portfolio/features/category/data/models/category_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCategoryModel_0 extends _i1.SmartFake implements _i2.CategoryModel {
  _FakeCategoryModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CategoryLocal].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryLocal extends _i1.Mock implements _i3.CategoryLocal {
  MockCategoryLocal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.CategoryModel>> getLastCategory() => (super.noSuchMethod(
        Invocation.method(
          #getLastCategory,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.CategoryModel>>.value(<_i2.CategoryModel>[]),
      ) as _i4.Future<List<_i2.CategoryModel>>);
  @override
  _i4.Future<void> cacheListCategory(
          List<_i2.CategoryModel>? listCategoryToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheListCategory,
          [listCategoryToCache],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [CategoryRemote].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryRemote extends _i1.Mock implements _i6.CategoryRemote {
  @override
  _i4.Future<List<_i2.CategoryModel>> getCategory() => (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.CategoryModel>>.value(<_i2.CategoryModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.CategoryModel>>.value(<_i2.CategoryModel>[]),
      ) as _i4.Future<List<_i2.CategoryModel>>);
  @override
  _i4.Future<_i2.CategoryModel> addCategory(_i2.CategoryModel? dataCategory) =>
      (super.noSuchMethod(
        Invocation.method(
          #addCategory,
          [dataCategory],
        ),
        returnValue: _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #addCategory,
            [dataCategory],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #addCategory,
            [dataCategory],
          ),
        )),
      ) as _i4.Future<_i2.CategoryModel>);
  @override
  _i4.Future<_i2.CategoryModel> updateCategory(
          _i2.CategoryModel? dataCategory) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCategory,
          [dataCategory],
        ),
        returnValue: _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #updateCategory,
            [dataCategory],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #updateCategory,
            [dataCategory],
          ),
        )),
      ) as _i4.Future<_i2.CategoryModel>);
  @override
  _i4.Future<_i2.CategoryModel> deleteCategory(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteCategory,
          [id],
        ),
        returnValue: _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #deleteCategory,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.CategoryModel>.value(_FakeCategoryModel_0(
          this,
          Invocation.method(
            #deleteCategory,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.CategoryModel>);
}
