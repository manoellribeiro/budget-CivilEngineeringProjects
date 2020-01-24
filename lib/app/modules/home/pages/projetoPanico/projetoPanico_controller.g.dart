// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetoPanico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoPanicoController on _ProjetoPanicoBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm))
          .value;

  final _$areaValueAtom = Atom(name: '_ProjetoPanicoBase.areaValue');

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

  final _$hintTextAtom = Atom(name: '_ProjetoPanicoBase.hintText');

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

  final _$thereIsFloorPlanAtom =
      Atom(name: '_ProjetoPanicoBase.thereIsFloorPlan');

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

  final _$projectOfSPDAAtom = Atom(name: '_ProjetoPanicoBase.projectOfSPDA');

  @override
  bool get projectOfSPDA {
    _$projectOfSPDAAtom.context.enforceReadPolicy(_$projectOfSPDAAtom);
    _$projectOfSPDAAtom.reportObserved();
    return super.projectOfSPDA;
  }

  @override
  set projectOfSPDA(bool value) {
    _$projectOfSPDAAtom.context.conditionallyRunInAction(() {
      super.projectOfSPDA = value;
      _$projectOfSPDAAtom.reportChanged();
    }, _$projectOfSPDAAtom, name: '${_$projectOfSPDAAtom.name}_set');
  }

  final _$thereIsQuantityAtom =
      Atom(name: '_ProjetoPanicoBase.thereIsQuantity');

  @override
  bool get thereIsQuantity {
    _$thereIsQuantityAtom.context.enforceReadPolicy(_$thereIsQuantityAtom);
    _$thereIsQuantityAtom.reportObserved();
    return super.thereIsQuantity;
  }

  @override
  set thereIsQuantity(bool value) {
    _$thereIsQuantityAtom.context.conditionallyRunInAction(() {
      super.thereIsQuantity = value;
      _$thereIsQuantityAtom.reportChanged();
    }, _$thereIsQuantityAtom, name: '${_$thereIsQuantityAtom.name}_set');
  }

  final _$infoTextAtom = Atom(name: '_ProjetoPanicoBase.infoText');

  @override
  String get infoText {
    _$infoTextAtom.context.enforceReadPolicy(_$infoTextAtom);
    _$infoTextAtom.reportObserved();
    return super.infoText;
  }

  @override
  set infoText(String value) {
    _$infoTextAtom.context.conditionallyRunInAction(() {
      super.infoText = value;
      _$infoTextAtom.reportChanged();
    }, _$infoTextAtom, name: '${_$infoTextAtom.name}_set');
  }

  final _$_ProjetoPanicoBaseActionController =
      ActionController(name: '_ProjetoPanicoBase');

  @override
  dynamic changeArea(String value) {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.changeArea(value);
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void whatIsThePropertyStandard() {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.whatIsThePropertyStandard();
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThereIsFloorPlan(bool value) {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.changeThereIsFloorPlan(value);
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeProjectOfSPDA(bool value) {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.changeProjectOfSPDA(value);
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThereIsQuantity(bool value) {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.changeThereIsQuantity(value);
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePrice() {
    final _$actionInfo = _$_ProjetoPanicoBaseActionController.startAction();
    try {
      return super.calculatePrice();
    } finally {
      _$_ProjetoPanicoBaseActionController.endAction(_$actionInfo);
    }
  }
}
