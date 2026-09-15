import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../task_models.dart';
import '../theme.dart';

const _seriesColors = [AppColors.green, AppColors.orange, Color(0xFF5B9DF5)];

String _formatNumber(double v) {
  if (v == v.roundToDouble()) return v.toInt().toString();
  return v.toStringAsFixed(1).replaceAll('.', ',');
}

/// Rysuje materiał źródłowy zadania: tabelę, wykres, rodowód lub elektroforegram.
class TaskVisualView extends StatelessWidget {
  final TaskVisual visual;

  const TaskVisualView({super.key, required this.visual});

  @override
  Widget build(BuildContext context) {
    final v = visual;
    if (v is TableVisual) return _TableView(v);
    if (v is LineChartVisual) return _LineChartView(v);
    if (v is BarChartVisual) return _BarChartView(v);
    if (v is PedigreeVisual) return _PedigreeView(v);
    if (v is GelVisual) return _GelView(v);
    return const SizedBox.shrink();
  }
}

bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

class _AxisLabel extends StatelessWidget {
  final String text;
  final TextAlign align;

  const _AxisLabel(this.text, {this.align = TextAlign.left});

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: align,
        style: const TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600),
      );
}

class _TableView extends StatelessWidget {
  final TableVisual table;

  const _TableView(this.table);

  @override
  Widget build(BuildContext context) {
    final border = _isDark(context) ? AppColors.darkBorder : AppColors.lightBorder;
    final widths = <int, TableColumnWidth>{
      for (var i = 0; i < table.headers.length; i++) i: FlexColumnWidth(i == 0 ? 1.5 : 1),
    };
    return Table(
      columnWidths: widths,
      border: TableBorder.all(color: border, borderRadius: BorderRadius.circular(8)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppColors.green.withValues(alpha: 0.14)),
          children: [
            for (final h in table.headers)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(h, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
              ),
          ],
        ),
        for (final row in table.rows)
          TableRow(children: [
            for (var i = 0; i < row.length; i++)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(row[i], style: TextStyle(fontSize: 13, fontWeight: i == 0 ? FontWeight.w600 : FontWeight.normal)),
              ),
          ]),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final List<String> names;

  const _Legend(this.names);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 6,
      children: [
        for (var i = 0; i < names.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 4,
                decoration: BoxDecoration(color: _seriesColors[i % _seriesColors.length], borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(width: 6),
              Text(names[i], style: const TextStyle(fontSize: 12)),
            ],
          ),
      ],
    );
  }
}

FlTitlesData _titles({
  required double xInterval,
  required double yInterval,
  required Widget Function(double value) bottom,
}) {
  return FlTitlesData(
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 38,
        interval: yInterval,
        getTitlesWidget: (value, meta) => Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(_formatNumber(value),
              textAlign: TextAlign.right, style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
        ),
      ),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 24,
        interval: xInterval,
        getTitlesWidget: (value, meta) => Padding(padding: const EdgeInsets.only(top: 5), child: bottom(value)),
      ),
    ),
  );
}

class _LineChartView extends StatelessWidget {
  final LineChartVisual chart;

  const _LineChartView(this.chart);

  @override
  Widget build(BuildContext context) {
    final grid = _isDark(context) ? AppColors.darkBorder : AppColors.lightBorder;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AxisLabel(chart.yLabel),
        const SizedBox(height: 10),
        SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: LineChart(
              LineChartData(
                minX: chart.minX,
                maxX: chart.maxX,
                minY: chart.minY,
                maxY: chart.maxY,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: chart.yInterval,
                  verticalInterval: chart.xInterval,
                  getDrawingHorizontalLine: (_) => FlLine(color: grid, strokeWidth: 0.7),
                  getDrawingVerticalLine: (_) => FlLine(color: grid, strokeWidth: 0.7),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(color: AppColors.textMuted),
                    bottom: BorderSide(color: AppColors.textMuted),
                  ),
                ),
                titlesData: _titles(
                  xInterval: chart.xInterval,
                  yInterval: chart.yInterval,
                  bottom: (v) => Text(_formatNumber(v), style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                ),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => AppColors.darkCardAlt,
                    getTooltipItems: (spots) => [
                      for (final s in spots)
                        LineTooltipItem(
                          '${chart.series[s.barIndex].name}\n${_formatNumber(s.x)} → ${_formatNumber(s.y)}',
                          TextStyle(color: _seriesColors[s.barIndex % _seriesColors.length], fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
                lineBarsData: [
                  for (var i = 0; i < chart.series.length; i++)
                    LineChartBarData(
                      spots: [for (final p in chart.series[i].points) FlSpot(p.x, p.y)],
                      isCurved: !chart.straight,
                      curveSmoothness: 0.2,
                      preventCurveOverShooting: true,
                      color: _seriesColors[i % _seriesColors.length],
                      barWidth: 2.5,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) =>
                            FlDotCirclePainter(radius: 3, color: _seriesColors[i % _seriesColors.length], strokeWidth: 0),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Align(alignment: Alignment.centerRight, child: _AxisLabel(chart.xLabel, align: TextAlign.right)),
        if (chart.series.length > 1) ...[
          const SizedBox(height: 10),
          _Legend([for (final s in chart.series) s.name]),
        ],
      ],
    );
  }
}

class _BarChartView extends StatelessWidget {
  final BarChartVisual chart;

  const _BarChartView(this.chart);

  @override
  Widget build(BuildContext context) {
    final grid = _isDark(context) ? AppColors.darkBorder : AppColors.lightBorder;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AxisLabel(chart.yLabel),
        const SizedBox(height: 10),
        SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: chart.maxY,
                alignment: BarChartAlignment.spaceAround,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: chart.yInterval,
                  getDrawingHorizontalLine: (_) => FlLine(color: grid, strokeWidth: 0.7),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(color: AppColors.textMuted),
                    bottom: BorderSide(color: AppColors.textMuted),
                  ),
                ),
                titlesData: _titles(
                  xInterval: 1,
                  yInterval: chart.yInterval,
                  bottom: (v) {
                    final i = v.toInt();
                    if (i < 0 || i >= chart.bars.length || i != v) return const SizedBox.shrink();
                    return Text(chart.bars[i].label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
                  },
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => AppColors.darkCardAlt,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
                      _formatNumber(rod.toY),
                      const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
                barGroups: [
                  for (var i = 0; i < chart.bars.length; i++)
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: chart.bars[i].value,
                          color: AppColors.green,
                          width: 24,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        for (final bar in chart.bars)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text.rich(TextSpan(children: [
              TextSpan(text: '${bar.label} — ', style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '${bar.description}: ${_formatNumber(bar.value)}'),
            ]), style: const TextStyle(fontSize: 12.5)),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- rodowód

const double _symbolSize = 22;
const double _rowHeight = 84;
const double _topPadding = 16;

class _PedigreeView extends StatelessWidget {
  final PedigreeVisual pedigree;

  const _PedigreeView(this.pedigree);

  @override
  Widget build(BuildContext context) {
    final ink = _isDark(context) ? Colors.white : Colors.black87;
    final generations = pedigree.people.map((p) => p.generation).fold<int>(0, math.max) + 1;
    final height = _topPadding + (generations - 1) * _rowHeight + _symbolSize / 2 + 20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: double.infinity,
          child: CustomPaint(painter: _PedigreePainter(pedigree, ink)),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          children: [
            _LegendSymbol(male: true, affected: true, label: 'chory mężczyzna', ink: ink),
            _LegendSymbol(male: true, affected: false, label: 'zdrowy mężczyzna', ink: ink),
            _LegendSymbol(male: false, affected: true, label: 'chora kobieta', ink: ink),
            _LegendSymbol(male: false, affected: false, label: 'zdrowa kobieta', ink: ink),
          ],
        ),
      ],
    );
  }
}

void _paintSymbol(Canvas canvas, Offset center, bool male, bool affected, Color ink, double size) {
  final stroke = Paint()
    ..color = ink
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.6;
  final fill = Paint()..color = ink;
  final rect = Rect.fromCenter(center: center, width: size, height: size);
  if (male) {
    if (affected) canvas.drawRect(rect, fill);
    canvas.drawRect(rect, stroke);
  } else {
    if (affected) canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
  }
}

class _PedigreePainter extends CustomPainter {
  final PedigreeVisual pedigree;
  final Color ink;

  _PedigreePainter(this.pedigree, this.ink);

  @override
  void paint(Canvas canvas, Size size) {
    final slotWidth = size.width / pedigree.slots;
    final byId = {for (final p in pedigree.people) p.id: p};
    double x(PedigreePerson p) => (p.slot + 0.5) * slotWidth;
    double y(int generation) => _topPadding + generation * _rowHeight;
    final line = Paint()
      ..color = ink
      ..strokeWidth = 1.4;
    const half = _symbolSize / 2;

    for (final family in pedigree.families) {
      final a = byId[family.parentA]!;
      final b = byId[family.parentB]!;
      final rowY = y(a.generation);
      final left = math.min(x(a), x(b));
      final right = math.max(x(a), x(b));
      canvas.drawLine(Offset(left + half, rowY), Offset(right - half, rowY), line);
      if (family.children.isEmpty) continue;
      final midX = (left + right) / 2;
      final barY = rowY + _rowHeight / 2;
      canvas.drawLine(Offset(midX, rowY), Offset(midX, barY), line);
      final childXs = [for (final id in family.children) x(byId[id]!)];
      final barLeft = math.min(childXs.reduce(math.min), midX);
      final barRight = math.max(childXs.reduce(math.max), midX);
      canvas.drawLine(Offset(barLeft, barY), Offset(barRight, barY), line);
      for (final id in family.children) {
        final child = byId[id]!;
        canvas.drawLine(Offset(x(child), barY), Offset(x(child), y(child.generation) - half), line);
      }
    }

    for (final p in pedigree.people) {
      final center = Offset(x(p), y(p.generation));
      _paintSymbol(canvas, center, p.male, p.affected, ink, _symbolSize);
      final label = TextPainter(
        text: TextSpan(text: p.id, style: TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)),
        textDirection: TextDirection.ltr,
      )..layout();
      label.paint(canvas, Offset(center.dx - label.width / 2, center.dy + half + 3));
    }
  }

  @override
  bool shouldRepaint(_PedigreePainter old) => old.pedigree != pedigree || old.ink != ink;
}

class _LegendSymbol extends StatelessWidget {
  final bool male;
  final bool affected;
  final String label;
  final Color ink;

  const _LegendSymbol({required this.male, required this.affected, required this.label, required this.ink});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 14, height: 14, child: CustomPaint(painter: _SymbolPainter(male, affected, ink))),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _SymbolPainter extends CustomPainter {
  final bool male;
  final bool affected;
  final Color ink;

  _SymbolPainter(this.male, this.affected, this.ink);

  @override
  void paint(Canvas canvas, Size size) =>
      _paintSymbol(canvas, size.center(Offset.zero), male, affected, ink, size.shortestSide - 2);

  @override
  bool shouldRepaint(_SymbolPainter old) => old.male != male || old.affected != affected || old.ink != ink;
}

// ---------------------------------------------------------------- elektroforeza

class _GelView extends StatelessWidget {
  final GelVisual gel;

  const _GelView(this.gel);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: double.infinity,
      child: CustomPaint(painter: _GelPainter(gel, _isDark(context) ? Colors.white : Colors.black87)),
    );
  }
}

class _GelPainter extends CustomPainter {
  final GelVisual gel;
  final Color ink;

  _GelPainter(this.gel, this.ink);

  static const double _scaleWidth = 58;
  static const double _labelHeight = 30;
  static const double _wellTop = _labelHeight + 6;
  static const double _bandAreaTop = _wellTop + 24;
  static const double _bottomPadding = 14;

  @override
  void paint(Canvas canvas, Size size) {
    final sizes = gel.lanes.expand((l) => l.bands).toSet().toList()..sort((a, b) => b.compareTo(a));
    final largest = sizes.first.toDouble();
    final smallest = sizes.last.toDouble();
    final span = largest - smallest;
    final bandAreaBottom = size.height - _bottomPadding;
    // Schemat: im krótszy fragment, tym dalej od studzienek (skala liniowa).
    double bandY(int bp) =>
        span == 0 ? _bandAreaTop : _bandAreaTop + (largest - bp) / span * (bandAreaBottom - _bandAreaTop);

    final gelRect = Rect.fromLTRB(_scaleWidth, _wellTop - 4, size.width, size.height);
    canvas.drawRRect(RRect.fromRectAndRadius(gelRect, const Radius.circular(8)), Paint()..color = const Color(0xFF1B2A36));

    final laneWidth = (size.width - _scaleWidth) / gel.lanes.length;
    final bandPaint = Paint()..color = const Color(0xFFFFB74D);
    final wellPaint = Paint()..color = const Color(0xFF0B1218);

    for (var i = 0; i < gel.lanes.length; i++) {
      final lane = gel.lanes[i];
      final centerX = _scaleWidth + laneWidth * (i + 0.5);
      final bandWidth = laneWidth * 0.58;
      _text(canvas, lane.label, Offset(centerX, 4), ink, 11, bold: true, maxWidth: laneWidth - 4);
      canvas.drawRect(Rect.fromCenter(center: Offset(centerX, _wellTop + 6), width: bandWidth, height: 7), wellPaint);
      for (final bp in lane.bands) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(centerX, bandY(bp)), width: bandWidth, height: 6),
            const Radius.circular(2),
          ),
          bandPaint,
        );
      }
    }

    final tick = Paint()
      ..color = AppColors.textMuted
      ..strokeWidth = 1;
    for (final bp in sizes) {
      final yPos = bandY(bp);
      canvas.drawLine(Offset(_scaleWidth - 6, yPos), Offset(_scaleWidth, yPos), tick);
      _text(canvas, '$bp pz', Offset(_scaleWidth - 32, yPos - 7), AppColors.textMuted, 10, maxWidth: 52);
    }
  }

  void _text(Canvas canvas, String text, Offset topCenter, Color color, double fontSize,
      {bool bold = false, double maxWidth = 100}) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: fontSize, fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 2,
    )..layout(maxWidth: maxWidth);
    painter.paint(canvas, Offset(topCenter.dx - painter.width / 2, topCenter.dy));
  }

  @override
  bool shouldRepaint(_GelPainter old) => old.gel != gel || old.ink != ink;
}
