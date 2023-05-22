import 'package:equatable/equatable.dart';

class ViewModel<T> extends Equatable {
  const ViewModel({this.isLoading = false, this.model, this.error});

  final T? model;
  final bool isLoading;
  final String? error;

  @override
  List<Object?> get props => [model, isLoading, error];
}
