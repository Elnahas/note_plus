import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String startTime;
  @HiveField(5)
  final String endTime;
  @HiveField(6)
  final bool isCompleted;
  @HiveField(7)
  final int color;

  TaskModel( {
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });

  //Dumy data

  static List<TaskModel> taskList = [
    TaskModel(
      id: '1',
      title: 'Task 1',
      note: 'Note 1',
      date: '2022-01-01',
      startTime: '09:00 AM',
      endTime: '10:00 AM',
      isCompleted: false,
      color: 1
    ),
    TaskModel(
      id: '2', 
      title: 'Task 2',
      note: 'Note 2',
      date: '2022-01-02',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      isCompleted: true,
      color: 1
    ),
  ];
}
