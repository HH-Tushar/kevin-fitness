part of 'plan_data.dart';

class _DataSource {
  // Define equipment categories

  final fitnessLevelData = ['Beginners', 'Basic', 'Intermediate', 'High'];
  final trainingLocationData = ['At home', 'At gym', 'Other sports'];
  final chestEquipment = [
    'Flat Chest Press Machine',
    'Incline Converging Chest Press',
    'Pec Deck (Chest Fly Machine)',
    'Decline Chest Press Machine',
    'Adjustable Converging Chest Press',
    'Assisted Dips Machine (also works chest and triceps)',
  ];

  final backEquipment = [
    'Lat Pulldown',
    'Converging Lat Pulldown',
    'Behind-the-Neck Pulldown',
    'Seated Row Machine',
    'Unilateral Converging Row',
    'Hammer Strength Row Machine',
    'Assisted Pull-Ups Machine',
    'Pullover Machine',
  ];

  final shouldersEquipment = [
    'Converging Shoulder Press',
    'Lateral Raises Machine',
    'Unilateral Lateral Raise Machine',
    'Reverse Pec Deck (Rear Delt Fly)',
    'Shrug Machine (Trap Raises)',
  ];

  final bicepsEquipment = [
    'Biceps Curl Machine',
    'Preacher Curl Machine',
    'Low Pulley Curl',
  ];

  final tricepsEquipment = [
    'Triceps Extension Machine',
    'Assisted Dips',
    'High Pulley Triceps Extension',
    'Close-Grip Press Machine',
  ];

  final quadricepsEquipment = [
    'Horizontal / Inclined Leg Press',
    'Hack Squat Machine',
    'Pendulum Squat',
    'Leg Extension Machine',
  ];

  final hamstringsEquipment = [
    'Lying Leg Curl',
    'Seated Leg Curl',
    'Standing Unilateral Leg Curl',
  ];

  final glutesEquipment = [
    'Glute Kickback Machine',
    'Seated Hip Abduction Machine',
    'Standing Hip Abduction Machine',
    'Hip Thrust Machine',
  ];

  final calvesEquipment = [
    'Standing Calf Raise',
    'Seated Calf Raise',
    'Calf Raises on Leg Press',
  ];

  final adductorsEquipment = ['Adductor Machine'];

  final lowerBackEquipment = ['Hyperextension Bench', 'Back Extension Machine'];

  String fitnessLevel = "Basic";
  String trainingLocation = "At gym";
  String workoutDuration = "30";
  String injuries = "No";
  List<String> chest = [];
  List<String> back = [];
  List<String> shoulders = [];
  List<String> biceps = [];
  List<String> triceps = [];
  List<String> quadriceps = [];
  List<String> hamstrings = [];
  List<String> glutes = [];
  List<String> calves = [];
  List<String> adductors = [];
  List<String> lower_back = [];

  Map<String, Object> _makeModel() {
    final workoutData = {
      'fitness_level': fitnessLevel,
      'train': trainingLocation,
      'daily_duration_minutes': int.parse(workoutDuration),
      'injuries_discomfort': injuries.isEmpty ? 'None' : injuries,
      'chest': chest,
      'back': back,
      'shoulders': shoulders,
      'biceps': biceps,
      'triceps': triceps,
      'quadriceps': quadriceps,
      'hamstrings': hamstrings,
      'glutes': glutes,
      'calves': calves,
      'adductors': adductors,
      'lower_back': lower_back,
    };

    return workoutData;
  }





}
