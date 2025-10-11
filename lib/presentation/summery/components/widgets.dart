part of '../summery.dart';

// Remove screen utils properties

// Assuming you are using fl_chart

class _WeightChartCard extends StatelessWidget {
  final List<double> weightsList;
  final String title;

  const _WeightChartCard({required this.weightsList, required this.title});

  @override
  Widget build(BuildContext context) {
    // Generate chart data from weights list
    final spots = weightsList.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value);
    }).toList();
    print('Chart Spots: $spots');

    // Calculate min and max for Y-axis
    final minWeight = weightsList.isEmpty
        ? 30.0
        : (weightsList.reduce((a, b) => a < b ? a : b) - 5).clamp(30.0, 150.0);
    final maxWeight = weightsList.isEmpty
        ? 150.0
        : (weightsList.reduce((a, b) => a > b ? a : b) + 5).clamp(30.0, 150.0);
    print('Chart Y-Axis - Min: $minWeight kg, Max: $maxWeight kg');
    print('=== END WEIGHT CHART DATA ===');

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF2D393A),
              // Replaced .r with direct double value for radius
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            // Replaced .w with direct double value for padding
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Replaced .sp with direct double value for size
                    const Icon(Icons.scale, color: Colors.white, size: 20.0),
                    // Replaced .w with direct double value for SizedBox width
                    const SizedBox(width: 8.0),
                    Text(
                    title,
                      style: const TextStyle(
                        color: Colors.white,
                        // Replaced .sp with direct double value for fontSize
                        fontSize: 20.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                // Replaced .h with direct double value for SizedBox height
                const SizedBox(height: 12.0),
                // Replaced .h with direct double value for SizedBox height
                SizedBox(
                  height: 220.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (index) => Padding(
                            // Replaced .h with direct double value for vertical padding
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '${(maxWeight - (index * (maxWeight - minWeight) / 4)).toStringAsFixed(0)}kg',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                // Replaced .sp with direct double value for fontSize
                                fontSize: 12.0,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Replaced .w with direct double value for SizedBox width
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: weightsList.isEmpty
                            ? Center(
                                child: Text(
                                  'No weight data available',
                                  style: TextStyle(
                                    color: const Color(0xFFA0A0A6),
                                    // Replaced .sp with direct double value for fontSize
                                    fontSize: 14.0,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            : LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: false),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  minY: minWeight,
                                  maxY: maxWeight,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: spots,
                                      isCurved: false,
                                      color: const Color(0xFFBFC2C7),
                                      barWidth: 4,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.cyan.withOpacity(0.5),
                                            Colors.cyan.withOpacity(0.0),
                                          ],
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
                if (weightsList.isNotEmpty)
                  Padding(
                    // Replaced .w and .h with direct double values
                    padding: const EdgeInsets.only(left: 40.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        weightsList.length > 8 ? 8 : weightsList.length,
                        (index) => Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            // Replaced .sp with direct double value for fontSize
                            fontSize: 11.0,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Skinfold graph card
class _SkinfoldGraphCard extends StatelessWidget {
  final Achievement achievement; // Keep as dynamic or use the correct class

  const _SkinfoldGraphCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.summaryTranslation;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        // Replaced .r with direct double value for radius
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      // Replaced .w with direct double value for padding
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📊  ${translator.skinfoldChanges}',
            style: const TextStyle(
              color: Colors.white,
              // Replaced .sp with direct double value for fontSize
              fontSize: 16.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
          ),
          // Replaced .h with direct double value for SizedBox height
          const SizedBox(height: 16.0),
          _SkinfoldBar(
            color: const Color(0xFF3E1C96),
            label: translator.abdominal,
            percent: _calculatePercent(achievement.abdominalChange),
            value: _formatValue(achievement.abdominalChange),
            pattern: achievement.abdominalIncrease,
          ),
          // Replaced .h with direct double value for SizedBox height
          const SizedBox(height: 8.0),
          _SkinfoldBar(
            color: const Color(0xFF6F1877),
            label: translator.subscapularis,
            percent: _calculatePercent(achievement.subscapularisChange),
            value: _formatValue(achievement.subscapularisChange),
            pattern: achievement.subscapularisIncrease,
          ),
          // Replaced .h with direct double value for SizedBox height
          const SizedBox(height: 8.0),
          _SkinfoldBar(
            color: const Color(0xFF194185),
            label: translator.sacroiliac,
            percent: _calculatePercent(achievement.sacrolicChange),
            value: _formatValue(achievement.sacrolicChange),
            pattern: achievement.sacrolicIncrease,
          ),
          // Replaced .h with direct double value for SizedBox height
          const SizedBox(height: 8.0),
          _SkinfoldBar(
            color: const Color(0xFF134E48),
            label: translator.triceps,
            percent: _calculatePercent(achievement.tricepsChange),
            value: _formatValue(achievement.tricepsChange),
            pattern: achievement.tricepsIncrease,
          ),
        ],
      ),
    );
  }

  double _calculatePercent(String change) {
    final value = double.tryParse(change) ?? 0.0;
    return (value / 100).clamp(0.0, 1.0);
  }

  String _formatValue(String change) {
    final value = double.tryParse(change) ?? 0.0;
    // Format to show one decimal place and ensure it's on one line
    // Remove any trailing zeros for cleaner display
    String formatted = value.toStringAsFixed(1);
    if (formatted.endsWith('.0')) {
      formatted = value.toInt().toString();
    }
    return '${formatted}%';
  }
}

class _SkinfoldBar extends StatelessWidget {
  final Color color;
  final String label;
  final double percent;
  final String value;
  final bool pattern;

  const _SkinfoldBar({
    required this.color,
    required this.label,
    required this.percent,
    required this.value,
    this.pattern = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              // Replaced .w and .h with direct double values
              width:
                  220 * percent +
                  60.0, // Increased width to accommodate full text
              height: 40.0,
              decoration: BoxDecoration(
                color: color,
                // Replaced .r with direct double value for radius
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(4.0),
                ),
              ),
              alignment: Alignment.centerLeft,
              // Replaced .w with direct double value for horizontal padding
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ), // Increased padding
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  // Replaced .sp with direct double value for fontSize
                  fontSize: 14.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left, // Changed to left align
                maxLines: 1,
                overflow: TextOverflow
                    .visible, // Changed to visible to show full text
              ),
            ),
            if (pattern)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    // Replaced .r with direct double value for radius
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(4.0),
                    ),
                    border: Border.all(color: color, width: 1.5),
                  ),
                ),
              ),
          ],
        ),
        // Replaced .w with direct double value for SizedBox width
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              // Replaced .sp with direct double value for fontSize
              fontSize: 14.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _AdherenceCard extends StatelessWidget {
  final String title;
  final double percent;
  final String valueText;

  const _AdherenceCard({
    required this.title,
    required this.percent,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📊  $title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${(percent * 100).toStringAsFixed(0)} %',
                style: TextStyle(
                  color: const Color(0xFFA0A0A6),
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: percent,
                    minHeight: 12,
                    backgroundColor: const Color(0x49979797),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color(0xFF222A2C),
                    ),
                  ),
                ),
              ),
            ],
          ),
          vPad10,
          Text(
            valueText,
            style: TextStyle(
              color: const Color(0xFFA0A0A6),
              fontSize: 12,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
