abstract class Animale {
  final String nome;
  final int eta;

  const Animale({
    required this.nome,
    required this.eta,
  });

  void verso();

  void mostraInfo();
}

enum Taglia {
  grande,
  media,
  piccola;

  @override
  String toString() {
    switch (this) {
      case Taglia.grande:
        return 'Grande';
      case Taglia.media:
        return 'Media';
      case Taglia.piccola:
        return 'Piccola';
    }
  }
}

class Cane extends Animale {
  final Taglia taglia;

  const Cane({
    required super.nome,
    required super.eta,
    required this.taglia,
  });

  @override
  void verso() {
    print('Bau');
  }

  @override
  void mostraInfo() {
    print('Sono un cane di nome $nome, ho $eta anni e sono di taglia $taglia');
  }
}

class Gatto extends Animale {
  final String colore;

  const Gatto({
    required super.nome,
    required super.eta,
    required this.colore,
  });

  @override
  void verso() {
    print('Miao');
  }

  @override
  void mostraInfo() {
    print('Sono un gatto di nome $nome, ho $eta anni e sono di colore $colore');
  }
}

void main() async {
  const cane = Cane(nome: 'Kira', eta: 2, taglia: Taglia.media);
  const gatto = Gatto(nome: 'Sissi', eta: 3, colore: 'Rosso');

  const animali = [cane, gatto];

  for (int i = 0; i < 3; i++) {
    for (var animale in animali) {
      animale.verso();
    }
    await Future.delayed(const Duration(seconds: 1));
  }

  await Future.delayed(const Duration(seconds: 3));

  cane.mostraInfo();
  gatto.mostraInfo();
}
