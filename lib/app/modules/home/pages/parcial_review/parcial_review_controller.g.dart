// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcial_review_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParcialReviewController on _ParcialReviewBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm))
          .value;

  final _$clientNameAtom = Atom(name: '_ParcialReviewBase.clientName');

  @override
  String get clientName {
    _$clientNameAtom.context.enforceReadPolicy(_$clientNameAtom);
    _$clientNameAtom.reportObserved();
    return super.clientName;
  }

  @override
  set clientName(String value) {
    _$clientNameAtom.context.conditionallyRunInAction(() {
      super.clientName = value;
      _$clientNameAtom.reportChanged();
    }, _$clientNameAtom, name: '${_$clientNameAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_ParcialReviewBase.list');

  @override
  ObservableList<BudgetModel> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<BudgetModel> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$_ParcialReviewBaseActionController =
      ActionController(name: '_ParcialReviewBase');

  @override
  dynamic changeClientName(String value) {
    final _$actionInfo = _$_ParcialReviewBaseActionController.startAction();
    try {
      return super.changeClientName(value);
    } finally {
      _$_ParcialReviewBaseActionController.endAction(_$actionInfo);
    }
  }
}
