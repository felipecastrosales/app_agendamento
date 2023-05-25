import 'package:agendamento/app.dart';
import 'package:agendamento/core/flavor/flavor_config.dart';

void main() {
  boostrap(
    FlavorConfig(
      baseUrl: 'http://localhost:8080',
      flavor: AppFlavor.prod,
    ),
  );
}
