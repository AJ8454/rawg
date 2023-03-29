class AppStrings {
  static const String apiKey = "be0766b927464872b2bbea66b7c8c3f4";

  static const String appName = "Raw Games";
  static const String rubiesqueFont = "rubiesque";
  static const String rexotickFont = "rexotick";

  static const String cacheUserKey = "cacheUserKey";
  static const cacheUserLoggedKey = "CACHED_USERLOGGED";
  static const cacheGenresKey = "CACHED_GENRES";

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
