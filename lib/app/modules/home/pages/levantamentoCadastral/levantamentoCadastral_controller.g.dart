// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levantamentoCadastral_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LevantamentoCadastralController on _LevantamentoCadastralBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm))
          .value;

  final _$areaValueAtom = Atom(name: '_LevantamentoCadastralBase.areaValue');

  @override
  String get areaValue {
    _$areaValueAtom.context.enforceReadPolicy(_$areaValueAtom);
    _$areaValueAtom.reportObserved();
    return super.areaValue;
  }

  @override
  set areaValue(String value) {
    _$areaValueAtom.context.conditionallyRunInAction(() {
      super.areaValue = value;
      _$areaValueAtom.reportChanged();
    }, _$areaValueAtom, name: '${_$areaValueAtom.name}_set');
  }

  final _$_LevantamentoCadastralBaseActionController =
      ActionController(name: '_LevantamentoCadastralBase');

  @override
  dynamic changeArea(String value) {
    final _$actionInfo =
        _$_LevantamentoCadastralBaseActionController.startAction();
    try {
      return super.changeArea(value);
    } finally {
      _$_LevantamentoCadastralBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePrice(BuildContext context) {
    final _$actionInfo =
        _$_LevantamentoCadastralBaseActionController.startAction();
    try {
      return super.calculatePrice(context);
    } finally {
      _$_LevantamentoCadastralBaseActionController.endAction(_$actionInfo);
    }
  }
}
