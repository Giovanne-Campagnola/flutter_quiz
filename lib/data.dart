import 'dart:math';

const statements = [
  {'statement': 'Python é uma linguagem interpretada.', 'answer': true},
  {'statement': 'A Terra gira em torno do Sol.', 'answer': true},
  {'statement': 'O JavaScript é uma linguagem de programação compilada.', 'answer': false},
  {'statement': 'O Brasil é um país da América do Sul.', 'answer': true},
  {'statement': 'O café é uma bebida alcoólica.', 'answer': false},
  {'statement': 'O HTML é uma linguagem de programação.', 'answer': false},
  {'statement': 'O Monte Everest é a montanha mais alta do mundo.', 'answer': true},
  {'statement': 'O Oceano Atlântico é o maior oceano do mundo.', 'answer': false},
  {'statement': 'O C++ é uma linguagem de programação orientada a objetos.', 'answer': true},
  {'statement': 'O Linux é um sistema operacional proprietário.', 'answer': false},
  {'statement': 'O SQL é usado para gerenciar e manipular bancos de dados.', 'answer': true},
  {'statement': 'O CSS é usado para adicionar lógica a páginas da web.', 'answer': false},
  {'statement': 'O jQuery é uma biblioteca JavaScript.', 'answer': true},
  {'statement': 'O PHP é uma linguagem de programação do lado do cliente.', 'answer': false},
  {'statement': 'O Git é um sistema de controle de versão.', 'answer': true},
  {'statement': 'O Bootstrap é uma biblioteca Python.', 'answer': false},
  {'statement': 'O MongoDB é um banco de dados SQL.', 'answer': false},
  {'statement': 'O JSON é um formato de intercâmbio de dados.', 'answer': true},
  {'statement': 'O Agile é uma linguagem de programação.', 'answer': false},
  {'statement': 'O Scrum é uma metodologia ágil.', 'answer': true},
  {'statement': 'O Kanban é um tipo de banco de dados.', 'answer': false},
  {'statement': 'O Docker é uma plataforma de virtualização.', 'answer': true},
  {'statement': 'O Kubernetes é um sistema operacional.', 'answer': false},
  {'statement': 'O AWS é um serviço de nuvem.', 'answer': true},
  {'statement': 'O Azure é um sistema operacional.', 'answer': false},
  {'statement': 'O GCP é um serviço de nuvem.', 'answer': true},
  {'statement': 'O TensorFlow é uma biblioteca de aprendizado de máquina.', 'answer': true},
  {'statement': 'O PyTorch é um framework de desenvolvimento web.', 'answer': false},
  {'statement': 'O React é uma biblioteca JavaScript para construir interfaces de usuário.', 'answer': true},
  {'statement': 'O Vue.js é um framework de backend.', 'answer': false},
  {'statement': 'O Angular é um framework JavaScript.', 'answer': true},
  {'statement': 'O Express.js é um framework de frontend.', 'answer': false},
  {'statement': 'O Node.js permite a execução de código JavaScript no lado do servidor.', 'answer': true},
  {'statement': 'O Flask é um framework JavaScript.', 'answer': false},
  {'statement': 'O Django é um framework Python.', 'answer': true},
  {'statement': 'O Ruby on Rails é um framework PHP.', 'answer': false},
  {'statement': 'O Laravel é um framework PHP.', 'answer': true},
  {'statement': 'O Spring Boot é um framework Ruby.', 'answer': false},
  {'statement': 'O Java é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Swift é uma linguagem de programação para Android.', 'answer': false},
  {'statement': 'O Kotlin é uma linguagem de programação para Android.', 'answer': true},
  {'statement': 'O C# é uma linguagem de programação para iOS.', 'answer': false},
  {'statement': 'O Rust é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Go é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Scala é uma linguagem de programação.', 'answer': true},
  {'statement': 'O R é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Perl é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Lua é uma linguagem de programação.', 'answer': true},
  {'statement': 'O Groovy é uma linguagem de programação.', 'answer': true},
];

Map<String, dynamic> getQuestion(chosenQuestions){
  
  if (chosenQuestions.length >= statements.length) {
    throw Exception('Todas as perguntas já foram escolhidas.');
  }

  var rng = Random();
  var statement = statements[rng.nextInt(statements.length)];

  while (chosenQuestions.contains(statement)) {
    statement = statements[rng.nextInt(statements.length)];
  }

  chosenQuestions.add(statement);
  return {'statement':statement,'chosenQuestions':chosenQuestions};
}