import 'dart:convert';

class AiGeneratedWorkOutPlans {
    final List<Day> days;
    final Status status;

    AiGeneratedWorkOutPlans({
        required this.days,
        required this.status,
    });

    factory AiGeneratedWorkOutPlans.fromRawJson(String str) => AiGeneratedWorkOutPlans.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AiGeneratedWorkOutPlans.fromJson(Map<String, dynamic> json) => AiGeneratedWorkOutPlans(
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "status": status.toJson(),
    };
}

class Day {
    final int id;
    final String title;
    final String titleSpanish;
    final String tags;
    final String tagsSpanish;
    final DateTime date;
    final bool completed;
    final String day;
    final String weekday;
    final int totalMinutes;
    final double totalCaloriesBurned;

    Day({
        required this.id,
        required this.title,
        required this.titleSpanish,
        required this.tags,
        required this.tagsSpanish,
        required this.date,
        required this.completed,
        required this.day,
        required this.weekday,
        required this.totalMinutes,
        required this.totalCaloriesBurned,
    });

    factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        title: json["title"],
        titleSpanish: json["title_spanish"],
        tags: json["tags"],
        tagsSpanish: json["tags_spanish"],
        date: DateTime.parse(json["date"]),
        completed: json["completed"],
        day: json["day"],
        weekday: json["weekday"],
        totalMinutes: json["total_minutes"],
        totalCaloriesBurned: json["total_calories_burned"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title_spanish": titleSpanish,
        "tags": tags,
        "tags_spanish": tagsSpanish,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "completed": completed,
        "day": day,
        "weekday": weekday,
        "total_minutes": totalMinutes,
        "total_calories_burned": totalCaloriesBurned,
    };
}

class Status {
    final int totalDays;
    final double averageTime;
    final int totalWorkouts;

    Status({
        required this.totalDays,
        required this.averageTime,
        required this.totalWorkouts,
    });

    factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        totalDays: json["total_days"],
        averageTime: json["average_time"]?.toDouble(),
        totalWorkouts: json["total_workouts"],
    );

    Map<String, dynamic> toJson() => {
        "total_days": totalDays,
        "average_time": averageTime,
        "total_workouts": totalWorkouts,
    };
}
