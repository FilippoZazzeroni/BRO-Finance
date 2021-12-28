
mixin Loadable {

  bool isLoading = false;

  void setStateOfLoading(Function setState) {
    isLoading = !isLoading;
    setState((){});
  }


}