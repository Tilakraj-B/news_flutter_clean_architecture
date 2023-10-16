import 'dart:async';

import 'package:floor/floor.dart';
import 'package:newsflutter/features/data/local/DAO/article_dao.dart';
import 'package:newsflutter/features/data/local/article_type_converter.dart';
import 'package:newsflutter/features/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([ArticleTypeConverter])
@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
