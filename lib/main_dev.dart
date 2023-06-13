import 'package:agendamento/app.dart';
import 'package:agendamento/core/flavor/flavor_config.dart';

void main() {
  boostrap(
    FlavorConfig(
      baseUrl: 'http://localhost:8080',
      flavor: AppFlavor.prod,
      appId: 'uQlXMWlcc8sZic6jfDu26WxC938Vg8pvS6O9pE7S',
      restKey: 'rAIV5OqJ2qbqdy85sd4XYkroT6ryOWDQGoplCg0a',
    ),
  );
}
