library jaguar.generator.info;

import 'package:jaguar/generator/parser/interceptor/import.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
export 'package:jaguar/generator/parser/route/import.dart';
export 'package:jaguar/generator/parser/group/import.dart';
export 'package:jaguar/generator/parser/interceptor/import.dart';

/// Holds information about a single input to an interceptor method or function
class InputInfo {
  /// Results of which interceptor must be injected to this input
  final InterceptorType resultFrom;

  final String id;

  InputInfo(this.resultFrom, this.id);

  String toString() => genName;

  String get genName => 'r' + resultFrom.displayName + (id??'');
}

InputInfo instantiateInputAnnotation(ElementAnnotation annot) {
  final ParameterizedType type = annot.constantValue.type;
  if(type.displayName != "Input") {
    return null;
  }

  if(type.element.library.displayName != "jaguar.src.annotations") {
    return null;
  }

  InterfaceType resultFrom = annot.constantValue.getField('resultFrom').toTypeValue();

  String id = annot.constantValue.getField('id').toStringValue();

  return new InputInfo(new InterceptorType.FromDartType(resultFrom), id);
}
