# Florida Rental Cars

## Sobre o projeto

**Florida Rental Cars** é um aplicativo desenvolvido em Flutter com autenticação de usuários via Supabase. Sua principal função é facilitar o processo de aluguel de automóveis, oferecendo uma experiência prática e intuitiva para os usuários. Ele foi desenvolvido como parte do processo seletivo para estagiário na empresa Dunnas tecnologia e consultoria.

## Funcionalidades

A aplicação conta com as seguintes funcionalidades:

- **Tela de login** para que o usuário possa acessar o sistema autenticado

- **Tela de cadastro** para que o usuário possa registrar seu dados no sistema

- **Recuperação de senha**: O usuário informa o e-mail cadastrado e, em seguida, recebe um link no próprio e-mail para acessar a tela de definição de uma nova senha.

- **Home**: O usuário poderá visualizar uma demonstração de como sera a interface do aplicativo com dados estáticos como:

    - Card mostrando quais serão as próximas reservas.
    - Verificar se o check-in do carro está disponível ou não.
    - Detalhes da próxima reserva.
    - Modal para a alteração da reserva.
    - Instruções sobre o check-in.

## Estrutura do projeto

O código principal da aplicação está na pasta `/lib` e ela está estruturada da seguinte forma:

```bash
lib/
├── main.dart               // Arquivo de execução do projeto
└── app/                    // Pasta que contem toda a lógica do projeto
    ├── data/               // Responsável por lidar com dados da aplicação
    │   ├── auth/           //  Responsável pela Lógica de autenticação
    │   └── model/          // Definições de modelos/entidades usados no app
    ├── ui/                 // Responsável pela interface do usuário
    │   ├── core/           // Componentes compartilhados entre várias telas.
    │   │   ├── constants/  // Constantes de estilo, cores e rotas
    │   │   ├── widgets/    // Widgets reutilizáveis em toda a aplicação
    │   │   └── .gitkeep
    │   └── pages/          // Telas principais da aplicação
    └── app_widget.dart     // Widget raiz da aplicação


```

## Capturas de tela

| **Tela**                 | **Imagem** |
|--------------------------|------------|
| **Tela de Login**        | <img src="screenshots\login.jpg" alt="Login" width="150"/> | 
| **Tela de Home**        | <img src="screenshots\home.jpg" alt="Login" width="150"/> |  
| **Tela de Detalhes da reserva**        | <img src="screenshots\details.jpg" alt="Login" width="150"/> | 
| **Modal de alteração da reserva**        | <img src="screenshots\modal.jpg" alt="Login" width="150"/> | 
| **Tela de instruções de check-in**        | <img src="screenshots\instructions.jpg" alt="Login" width="150"/> | 
| **Tela de Cadastro 1**        | <img src="screenshots\register1.jpg" alt="Login" width="150"/> |
| **Tela de Cadastro 2**        | <img src="screenshots\register2.jpg" alt="Login" width="150"/> |
| **Recuperação de senha**        | <img src="screenshots\password_recover.jpg" alt="Login" width="150"/> |
| **Confirmação de envio de email**        | <img src="screenshots\email_confirmation.jpg" alt="Login" width="150"/> |
| **Nova senha**        | <img src="screenshots\new_password.jpg" alt="Login" width="150"/> |
  

## Video demonstração

Assista so vídeo de demonstração do funcionamento do aplicativo:

[Link do vídeo (YouTube)](https://youtu.be/WIXrWfKKDZk)

## Como executar

### Pré-requisitos

- Flutter instalado e configurado (versão recomendada: `>= 3.x com null safety`)


### Instalação

1. Clone este repositorio:

```bash
git clone https://github.com/joas-barros/frc_prototype.git
cd frc_prototype
```

2. Instale as dependencias:

```bash
flutter pub get
```

3. Rode o aplicativo

```bash
flutter run
```

4. Usuario padrão
- Para logar como **Usuário**, preencha o email como `joas.barros14@gmail.com` e a senha como `joasjoas` ou crie seu proprio usuário na tela de cadastro. 

## Possíveis melhorias

- Implementação da funcionalidade de cadastro das reservas de carro.