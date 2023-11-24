import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'package:floor/floor.dart';
import 'dao/article_dao.dart';
import '../../models/article_model.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
