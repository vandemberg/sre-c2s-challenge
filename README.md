# Teste de Correção de Bugs para Desenvolvedor Ruby on Rails Jr.

## Introdução
Este teste é projetado para avaliar suas habilidades em identificar e corrigir bugs em uma aplicação Ruby on Rails. O projeto é um sistema CRUD simples para a gestão de leads, que inclui campos como nome, e-mail e telefone.

## Configuração do Projeto
1. Clone o repositório do projeto.
2. Execute `bundle install` para instalar as dependências.
3. Configure seu banco de dados local executando `rails db:create` e `rails db:migrate`.
4. Inicie o servidor Rails com `rails server` e visite `http://localhost:3000` para acessar a aplicação.

## Tarefa
Sua tarefa é identificar e corrigir todos os bugs que você encontrar na aplicação. Os bugs podem estar relacionados a:
- Parâmetros faltando em ações do controller.
- Nomes de classes ou métodos incorretos.
- Erros nos formulários, como campos que não salvam corretamente os dados.
- Problemas com a internacionalização (I18n) que afetam a exibição de textos em diferentes idiomas.

### Lista de Bugs Comuns para Verificar
- **Projeto não está subindo:** 
Verificar o que está acontecendo que o projeto não sobe em desenvolvimento.
- **Parâmetros Faltando:** 
Verifique se todos os parâmetros essenciais estão sendo corretamente requeridos e permitidos nas ações do controller. A ausência de um parâmetro necessário pode levar a comportamentos inesperados ou erros.
- **Não está salvando phone:** 
Assegure-se de que o campo phone esteja corretamente configurado para salvar no banco de dados. Este problema pode ser devido a configurações inadequadas no model ou no controller.
- **Validação de Email Inexistente:** 
Verifique se o campo email possui validações para confirmar que um email válido está sendo inserido. Implemente validações no model para garantir que apenas emails corretos sejam aceitos.
- **Erro 500 ao Exibir Lead (Show):** 
Identifique e corrija a causa de erros HTTP 500 ao tentar visualizar um lead específico. Isso pode ocorrer devido a problemas no controller ou na view.
- **Phone não está salvando com Máscara:** 
Certifique-se de que o campo phone esteja configurado para salvar números de telefone com uma máscara específica (ex: (99) 99999-9999). Pode ser necessário ajustar tanto a frontend quanto a backend para lidar com a formatação de dados.
- **Internacionalização (I18n) para o Brasil:** 
Garanta que todas as strings de texto estejam corretamente traduzidas para o português brasileiro e que a aplicação possa alternar entre idiomas sem erros. Revise os arquivos de tradução para encontrar e corrigir quaisquer omissões ou erros.

## Relatório de Bugs
Para cada bug identificado e corrigido, adicione uma entrada em seu relatório de bugs seguindo este formato:
- **Descrição do Bug:** Explique o que estava errado.
- **Localização do Bug:** Indique onde o bug foi encontrado (e.g., arquivo e linha).
- **Correção Realizada:** Descreva como você corrigiu o bug.

## Submissão
Após corrigir todos os bugs, faça um Fork do projeto e abra um pull request com suas alterações e descrições dos bugs corrigidos para a branch principal do repositório. Inclua seu relatório de bugs no corpo do pull request.

## Avaliação
Você será avaliado pela precisão na identificação dos bugs, eficácia das correções aplicadas e pela clareza do seu relatório de bugs.

Boa sorte!
