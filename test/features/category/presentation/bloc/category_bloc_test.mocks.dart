// Mocks generated by Mockito 5.3.2 from annotations
// in portfolio/test/features/category/presentation/bloc/category_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:portfolio/core/error/failures.dart' as _i7;
import 'package:portfolio/core/usecases/usecase.dart' as _i9;
import 'package:portfolio/features/category/domain/entities/category.dart'
    as _i8;
import 'package:portfolio/features/category/domain/repositories/category_image_repository.dart'
    as _i4;
import 'package:portfolio/features/category/domain/repositories/category_repository.dart'
    as _i2;
import 'package:portfolio/features/category/domain/usecases/add_category.dart'
    as _i10;
import 'package:portfolio/features/category/domain/usecases/delete_category.dart'
    as _i12;
import 'package:portfolio/features/category/domain/usecases/get_category.dart'
    as _i5;
import 'package:portfolio/features/category/domain/usecases/update_category.dart'
    as _i11;
import 'package:portfolio/features/category/domain/usecases/upload_category_image.dart'
    as _i13;

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

class _FakeCategoryRepository_0 extends _i1.SmartFake
    implements _i2.CategoryRepository {
  _FakeCategoryRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCategoryImageRepository_2 extends _i1.SmartFake
    implements _i4.CategoryImageRepository {
  _FakeCategoryImageRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCategory extends _i1.Mock implements _i5.GetCategory {
  @override
  _i2.CategoryRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CategoryRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i8.Category>>> call(
          _i9.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.Failure, List<_i8.Category>>>.value(
                _FakeEither_1<_i7.Failure, List<_i8.Category>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, List<_i8.Category>>>.value(
                _FakeEither_1<_i7.Failure, List<_i8.Category>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i8.Category>>>);
}

/// A class which mocks [AddCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddCategory extends _i1.Mock implements _i10.AddCategory {
  @override
  _i2.CategoryRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CategoryRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, void>> call(
          _i10.AddCategoryParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, void>>.value(
            _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, void>>.value(
                _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, void>>);
}

/// A class which mocks [UpdateCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateCategory extends _i1.Mock implements _i11.UpdateCategory {
  @override
  _i2.CategoryRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CategoryRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, void>> call(
          _i11.UpdateCategoryParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, void>>.value(
            _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, void>>.value(
                _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, void>>);
}

/// A class which mocks [DeleteCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteCategory extends _i1.Mock implements _i12.DeleteCategory {
  @override
  _i2.CategoryRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCategoryRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CategoryRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, void>> call(
          _i12.DeleteCategoryParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, void>>.value(
            _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, void>>.value(
                _FakeEither_1<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, void>>);
}

/// A class which mocks [UploadCategoryImage].
///
/// See the documentation for Mockito's code generation for more information.
class MockUploadCategoryImage extends _i1.Mock
    implements _i13.UploadCategoryImage {
  @override
  _i4.CategoryImageRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCategoryImageRepository_2(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCategoryImageRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.CategoryImageRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> call(
          _i13.UploadCategoriImageParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, String>>.value(
            _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, String>>.value(
                _FakeEither_1<_i7.Failure, String>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, String>>);
}
