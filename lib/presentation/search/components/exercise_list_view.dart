part of '../search_screen.dart';
class _ExerciseListView extends StatelessWidget {
  final String query;
  final List<Map<String, dynamic>> exercises = const [
    {
      'image': 'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg',
      'title': 'Wide hand push ups',
      'reps': 16,
      'time': 10,
      'calories': 340,
      'equipment': 'None',
      'bodyPart': 'Belly',
      'difficulty': 'Heavy',
      'tags': ['Arm', 'Heavy'],
      'benefits': [
        'Improves upper body strength.',
        'Contributes to core stability and strength.',
        'May improve cardiovascular health.',
        'Improves sports performance.',
        'Works multiple muscles simultaneously.',
        'May help support bone health.',
      ],
    },
    {
      'image': 'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg',
      'title': 'Squats',
      'reps': 20,
      'time': 12,
      'calories': 400,
      'equipment': 'None',
      'bodyPart': 'Leg',
      'difficulty': 'Medium',
      'tags': ['Leg', 'Medium'],
      'benefits': [
        'Strengthens lower body muscles.',
        'Improves flexibility and balance.',
        'Boosts athletic performance.',
      ],
    },
    {
      'image': 'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg',
      'title': 'Dumbbell curls',
      'reps': 12,
      'time': 8,
      'calories': 220,
      'equipment': 'Dumbbells',
      'bodyPart': 'Arm',
      'difficulty': 'Easy',
      'tags': ['Arm', 'Easy'],
      'benefits': [
        'Builds biceps strength.',
        'Improves muscle endurance.',
      ],
    },
  ];

  const _ExerciseListView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final filteredExercises = query.isEmpty
        ? exercises
        : exercises.where((e) => e['title'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    if (filteredExercises.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18, fontFamily: 'Outfit'),
        ),
      );
    }
    return ListView.separated(
      itemCount: filteredExercises.length,
      separatorBuilder: (_, __) => SizedBox(height: 14),
      itemBuilder: (context, i) {
        final ex = filteredExercises[i];
        return GestureDetector(
          onTap: () {
            context.push(
              '/workout-detail',
              extra: {
                'imageUrl': ex['image'],
                'title': ex['title'],
                'difficulty': ex['difficulty'],
                'time': ex['time'],
                'calories': ex['calories'],
                'equipment': ex['equipment'],
                'tags': ex['tags'],
                'benefits': ex['benefits'],
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2D393A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    ex['image'],
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ex['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 15),
                            SizedBox(width: 3),
                            Text('${ex['time']} min', style: TextStyle(color: Colors.white, fontSize: 12)),
                            SizedBox(width: 10),
                            Icon(Icons.local_fire_department, color: Colors.white.withOpacity(0.7), size: 15),
                            SizedBox(width: 3),
                            Text('${ex['calories']}', style: TextStyle(color: Colors.white, fontSize: 12)),
                            SizedBox(width: 10),
                            Icon(Icons.fitness_center, color: Colors.white.withOpacity(0.7), size: 15),
                            SizedBox(width: 3),
                            Text(ex['equipment'], style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8BF0E6).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            ex['bodyPart'],
                            style: TextStyle(
                              color: const Color(0xFF8BF0E6),
                              fontSize: 13,
                              fontFamily: 'Outfit',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
