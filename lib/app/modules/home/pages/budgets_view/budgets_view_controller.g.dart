// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BudgetsViewController on _BudgetsViewBase, Store {
  final _$isVisibleAtom = Atom(name: '_BudgetsViewBase.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.context.enforceReadPolicy(_$isVisibleAtom);
    _$isVisibleAtom.reportObserved();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.context.conditionallyRunInAction(() {
      super.isVisible = value;
      _$isVisibleAtom.reportChanged();
    }, _$isVisibleAtom, name: '${_$isVisibleAtom.name}_set');
  }

  final _$_BudgetsViewBaseActionController =
      ActionController(name: '_BudgetsViewBase');

  @override
  void changeIsVisible() {
    final _$actionInfo = _$_BudgetsViewBaseActionController.startAction();
    try {
      return super.changeIsVisible();
    } finally {
      _$_BudgetsViewBaseActionController.endAction(_$actionInfo);
    }
  }
}
