import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_mermer_itme/oyun_mermer_itme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(mermerConfig.title.length, 33);
    expect(mermerConfig.tagline.length, 33);
    for (final s in mermerConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: mermerId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = mermerRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
