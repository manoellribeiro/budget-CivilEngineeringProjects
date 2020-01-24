// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetoArquitetonico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoArquitetonicoController on _ProjetoArquitetonicoBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm))
          .value;

  final _$areaValueAtom = Atom(name: '_ProjetoArquitetonicoBase.areaValue');

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

  final _$hintTextAtom = Atom(name: '_ProjetoArquitetonicoBase.hintText');

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

  final _$quantitativeOfMaterialsAtom =
      Atom(name: '_ProjetoArquitetonicoBase.quantitativeOfMaterials');

  @override
  bool get quantitativeOfMaterials {
    _$quantitativeOfMaterialsAtom.context
        .enforceReadPolicy(_$quantitativeOfMaterialsAtom);
    _$quantitativeOfMaterialsAtom.reportObserved();
    return super.quantitativeOfMaterials;
  }

  @override
  set quantitativeOfMaterials(bool value) {
    _$quantitativeOfMaterialsAtom.context.conditionallyRunInAction(() {
      super.quantitativeOfMaterials = value;
      _$quantitativeOfMaterialsAtom.reportChanged();
    }, _$quantitativeOfMaterialsAtom,
        name: '${_$quantitativeOfMaterialsAtom.name}_set');
  }

  final _$hintText2Atom = Atom(name: '_ProjetoArquitetonicoBase.hintText2');

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

  final _$infoTextAtom = Atom(name: '_ProjetoArquitetonicoBase.infoText');

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

  final _$_ProjetoArquitetonicoBaseActionController =
      ActionController(name: '_ProjetoArquitetonicoBase');

  @override
  dynamic changeArea(String value) {
    final _$actionInfo =
        _$_ProjetoArquitetonicoBaseActionController.startAction();
    try {
      return super.changeArea(value);
    } finally {
      _$_ProjetoArquitetonicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void floorIndexMethod() {
    final _$actionInfo =
        _$_ProjetoArquitetonicoBaseActionController.startAction();
    try {
      return super.floorIndexMethod();
    } finally {
      _$_ProjetoArquitetonicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeQuantitative(bool value) {
    final _$actionInfo =
        _$_ProjetoArquitetonicoBaseActionController.startAction();
    try {
      return super.changeQuantitative(value);
    } finally {
      _$_ProjetoArquitetonicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void standardIndexMethod() {
    final _$actionInfo =
        _$_ProjetoArquitetonicoBaseActionController.startAction();
    try {
      return super.standardIndexMethod();
    } finally {
      _$_ProjetoArquitetonicoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePrice() {
    final _$actionInfo =
        _$_ProjetoArquitetonicoBaseActionController.startAction();
    try {
      return super.calculatePrice();
    } finally {
      _$_ProjetoArquitetonicoBaseActionController.endAction(_$actionInfo);
    }
  }
}
