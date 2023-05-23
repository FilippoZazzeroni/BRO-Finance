class NotificationCenter {
  //MARK: inits

  NotificationCenter._init();

  //MARK: properties

  static final shared = NotificationCenter._init();

  final Map<String, Map<Object, Function(Object?)>> _observers = {};

  //MARK: methods

  /// Registers the class as observer with the provided callback and notification name.
  void addObserver({required Object object, required String notificationName, required Function(Object?) callback}) {
    if (_observers[notificationName] == null) {
      _observers[notificationName] = {};
    }
    _observers[notificationName]?.addEntries({object: callback}.entries);
  }

  void removeObserver({required Object object}) {
    _observers.forEach((key, value) {
      if (value[object] != null) {
        value.remove(object);
      }
    });
  }

  void post({required String notificationName, Object? data}) {
    _observers[notificationName]?.forEach((key, value) {
      value(data);
    });
  }
}
