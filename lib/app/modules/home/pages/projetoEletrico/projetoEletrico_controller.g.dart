// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetoEletrico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoEletricoController on _ProjetoEletricoBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm))
          .value;

  final _$areaValueAtom = Atom(name: '_ProjetoEletricoBase.areaValue');

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

  final _$hintTextAtom = Atom(name: '_ProjetoEletricoBase.hintText');

  @override
  String get hintText {
    _$hintTextAtom.context.enforceReadPolicy(_$hintTextAtom);
    _$hintTextAtom.reportObserved();
    return super.hintText;
  }

  @override
  set hintText(String value) {
    _$hintTextAtom.context.conditionallyRunInAction(() {
      super.hintText = value;
      _$hintTextAtom.reportChanged();
    }, _$hintTextAtom, name: '${_$hintTextAtom.name}_set');
  }

  final _$hintText2Atom = Atom(name: '_ProjetoEletricoBase.hintText2');

  @override
  String get hintText2 {
    _$hintText2Atom.context.enforceReadPolicy(_$hintText2Atom);
    _$hintText2Atom.reportObserved();
    return super.hintText2;
  }

  @override
  set hintText2(String value) {
    _$hintText2Atom.context.conditionallyRunInAction(() {
      super.hintText2 = value;
      _$hintText2Atom.reportChanged();
    }, _$hintText2Atom, name: '${_$hintText2Atom.name}_set');
  }

  final _$thereIsFloorPlanAtom =
      Atom(name: '_ProjetoEletricoBase.thereIsFloorPlan');

  @override
  bool get thereIsFloorPlan {
    _$thereIsFloorPlanAtom.context.enforceReadPolicy(_$thereIsFloorPlanAtom);
    _$thereIsFloorPlanAtom.reportObserved();
    return super.thereIsFloorPlan;
  }

  @override
  set thereIsFloorPlan(bool value) {
    _$thereIsFloorPlanAtom.context.conditionallyRunInAction(() {
      super.thereIsFloorPlan = value;
      _$thereIsFloorPlanAtom.reportChanged();
    }, _$thereIsFloorPlanAtom, name: '${_$thereIsFloorPlanAtom.name}_set');
  }

  final _$_ProjetoEletricoBaseActionController =
      ActionController(name: '_ProjetoEletricoBase');

  @override
  dynamic changeArea(String value) {
    final _$actionInfo = _$_ProjetoEletricoBaseActionController.startAction();
    try {
      return super.changeArea(value);
    } finally {
      _$_ProjetoEletricoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void howMuchDistributionPanels() {
    final _$actionInfo = _$_ProjetoEletricoBaseActionController.startAction();
    try {
      return super.howMuchDistributionPanels();
    } finally {
      _$_ProjetoEletricoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void standardIndexMethod() {
    final _$actionInfo = _$_ProjetoEletricoBaseActionController.startAction();
    try {
      return super.standardIndexMethod();
    } finally {
      _$_ProjetoEletricoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThereIsFloorPlan(bool value) {
    final _$actionInfo = _$_ProjetoEletricoBaseActionController.startAction();
    try {
      return super.changeThereIsFloorPlan(value);
    } finally {
      _$_ProjetoEletricoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePrice() {
    final _$actionInfo = _$_ProjetoEletricoBaseActionController.startAction();
    try {
      return super.calculatePrice();
    } finally {
      _$_ProjetoEletricoBaseActionController.endAction(_$actionInfo);
    }
  }
}
