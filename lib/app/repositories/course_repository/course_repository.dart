import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CourseRepository {
  Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "meu_cronograma.db");
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS TB_CURSO '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'nome TEXT, '
          'descricao TEXT, '
          'link TEXT, '
          'imagePath TEXT'
          ')');
      await db.execute('CREATE TABLE IF NOT EXISTS TB_ATIVIDADE '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'nome TEXT, '
          'feito TEXT, '
          'curso INTEGER'
          ')');
    });
  }

  var courses = <CourseModel>[
    // CourseModel(
    //   name: "Teste Curso 1".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 2".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 3".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 4".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 5".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 6".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 7".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 8".obs,
    //   description: "Teste descrição".obs,
    // ),
    // CourseModel(
    //   name: "Teste Curso 9".obs,
    //   description: "Teste descrição".obs,
    // ),
  ].obs;

  void save(CourseModel course, RxList<CourseModel> courseList) async {
    // if (!courseList.contains(course)) {
    //   courseList.add(course);
    // }
    final db = await getDatabase();
    if (courses.contains(course)) {
      await db.update('TB_CURSO', course.toMap(),
          where: 'id = ?', whereArgs: [course.id]);
      //courses.remove(course);
    } else {
      await db.insert("TB_CURSO", course.toMap());
      courses.add(course);
    }

    db.close();
  }

  void remove(CourseModel course, RxList<CourseModel> courseList) async {
    final db = await getDatabase();
    courseList.remove(course);
    await db.delete("TB_CURSO", where: 'id = ?', whereArgs: [course.id]);

    db.close();
  }

  Future<RxList<CourseModel>> findAllCourses() async {
    if (courses.isEmpty) {
      courses = await getCoursesDb();

      return courses;
    }
    return courses;
  }

  Future<RxList<CourseModel>> getCoursesDb() async {
    final db = await getDatabase();
    List<Map> list = await db.rawQuery("SELECT * FROM TB_CURSO");
    return list.map((e) => CourseModel.fromDb(e)).toList().obs;
  }

  // RxList<CourseModel> findAllCourses() {
  //   return courses;
  // }
}
