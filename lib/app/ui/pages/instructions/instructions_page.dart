import 'package:florida_rental_car/app/ui/pages/instructions/widgets/check_in_steps.dart';
import 'package:florida_rental_car/app/ui/pages/reservation/widgets/option_cards.dart';
import 'package:flutter/material.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Instruções',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Instruções para o check-in",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              CheckInSteps(
                steps: const [
                  {
                    'icon': 'assets/imgs/icons/instructions/check.svg',
                    'text': 'Confirme os detalhes da reserva',
                  },
                  {
                    'icon': 'assets/imgs/icons/location.svg',
                    'text': 'Localize o veículo pela opção “Ver no mapa”',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/Walking.svg',
                    'text': 'Dirija-se ao local indicado',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/Key.svg',
                    'text': 'Pegue as chaves do veículo',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/double-check.svg',
                    'text': 'Confirme a retirada',
                  },
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "Instruções para o check-out",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              CheckInSteps(
                steps: const [
                  {
                    'icon': 'assets/imgs/icons/instructions/fuel.svg',
                    'text':
                        'O veículo deve estar com a mesma quantidade de combustível que recebeu',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/Ticket.svg',
                    'text':
                        'Deixe o ticket do estacionamento dentro do veículo *',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/Key.svg',
                    'text':
                        'Deixe a chave do veículo lado de fora ao estacionar (não se preocupe, é seguro)',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/Carro.svg',
                    'text': 'Estacione o veículo com a placa visível **',
                  },
                  {
                    'icon': 'assets/imgs/icons/instructions/camera.svg',
                    'text': 'Envie fotos do veículo estacionado ',
                  },
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "* Caso não tenha recebido o ticket, não se preocupe, você não será cobrado por isso",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                "** Não é permitido e é passível de multa o estacionamento de ré com a placa virada para a parede",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 32),
              Text(
                "Ficou com alguma dúvida?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              OptionCards(
                iconPath: "assets/imgs/icons/chat.svg",
                text: "Fale com a gente",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
