class ViewModel<T> {
  ViewModel({this.isLoading = false, this.model, this.error});

  final T? model;
  final bool isLoading;
  final String? error;
}
