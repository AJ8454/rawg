class AppStrings {
  static const String appName = "Architech Todo App";

  static const String cacheUserKey = "cacheUserKey";
  static const cacheUserLoggedKey = "CACHED_USERLOGGED";

  static const String todoDataBase = "todo.db";
  static const String authTable = "authentication";
  static const String todoTable = "todos";
  static const String userPrefId = "UserId";

  // ------ db types =----------
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String boolType = 'BOOLEAN NOT NULL';
  static const String integerType = 'INTEGER NOT NULL';

  // ---------------------------app_failure_messsages------------------------------------------------------
  static const String serverFailureMessage = 'Please try again later .';
  static const String emptyCacheFailureMessage = 'No Data';
  static const String offlineFailureMessage =
      'Please Check your Internet Connection';
}
