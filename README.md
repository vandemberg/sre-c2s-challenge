# Relatório de Bugs
<hr />

### 1- /config/application.rb -> linha 18 -> congif.locales(brasil_america)

Esse trecho se refere à instância de configuração da classe Application, porém está com um erro de digitação. Está escrito **“congif”** quando na verdade deveria ser **“config”**. Além do mais, o método **“.locales(brasil_america)”** não é a sintaxe correta para definir uma localidade em Ruby. Portanto, a correção dessa parte se dá por:

_- Remoção da linha 18:_
 
 ```erb
 congif.locales(brasil_america)
```

 
_- Inserção das seguintes linhas no lugar:_ 

```erb
config.i18n.available_locales = [:pt, :en]
```
**->** define os locais disponíveis, neste caso foi colocado português (pt) e inglês (en) para que os idiomas da aplicação possam ser alternados corretamente.

```erb
config.i18n.default_locale = :pt
```
**->** define o local padrão como português (pt).

Essa correção já permite que o banco de dados seja criado e que as migrações rodem, como é solicitado no readme.

<hr />

### 2- /config/routes.rb -> linha 12 -> # root "posts#index"

Este é o arquivo inicial de rotas, e neste caso, a rota raíz **(‘/’)** estava com 2 problemas: o primeiro erro que a linha estava comentada, logo, o código não era executado, e o segundo que ela redirecionava para o **posts#index**, quando na verdade deveria ser redirecionada para o **leads#index**. Portanto, a correção dessa parte se dá por:

_- Remoção da linha 10:_

```erb
# root "posts#index"
```

_- Inserção da seguinte linha em seu lugar:_

```erb
root "leads#index"
```
**->** nesta linha, foi retirado o comentário e corrigido o endereço da rota raíz para que seja aberto o index dos leads na página principal.
Essa correção faz com que, ao iniciar o servidor do ruby e entrar na página **‘localhost:3000/’** seja renderizada a página inicial do **componente de leads (leads/index)**.

<hr />

### 3- /app/views/layouts/application.html.erb -> linha 8 -> <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>

Esse arquivo não estava sendo renderizado corretamente devido à importação errada do arquivo de tailwind, e por isso o projeto apresentava um erro de build, retornando uma tela que não deveria ser a normal. Este erro acontece porque nessa linha está sendo importado um arquivo chamado **“tailwind”**, quando na verdade, o nome do arquivo na aplicação está como **“application.tailwind”**. Portanto, a correção dessa parte se dá por:

**- Remoção da linha 8:** 

```erb
<%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>
```

**- Inserção da seguinte linha em seu lugar:**

```erb
<%= stylesheet_link_tag "application.tailwind", "inter-font", "data-turbo-track": "reload" %>
```

Essa correção faz com que essa página possa ser renderizada corretamente, não acusando nenhum erro e permitindo assim que o fluxo inicial de entrar na tela principal dos leads e que o botão de adicionar novo lead seja utilizável.

<hr />

### 4- /app/controllers/leads_controller.rb -> linha 68 -> params.require(:lead).permit(:email)

Este é o arquivo de controller dos leads, basicamente o responsável por controlar o fluxo da aplicação de leads.
O erro nesta parte se dá no método **lead_params**, que define uma lista de parâmetros permitidos para serem recebidos pelo formulário do lead criado. Neste método está sendo _permitido apenas o parâmetro email_, quando na verdade, no _formulário de leads existem além do email os parâmetros nome e telefone_. Portanto, a solução dessa parte se dá por:

**- Remoção da linha 68:**

```erb
params.require(:lead).permit(:email)
```

**- Inserção da seguinte linha em seu lugar:**

```erb
params.require(:lead).permit(:name, :email, :phone)
```
**->** esta linha faz com que a lista de parâmetros permitidos seja alterada, permitindo assim os 3 parâmetros utilizados no formulário de leads: nome, email e telefone.

<hr />

### 5- /app/views/leads/show.html.erb 
_-> linhas 9 e 11_

_9 ->_ 
```erb
<%= link_to "Edit this lead", edi_lead_path(@lead), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>
```

_11 ->_ 
```erb
<%= button_to "Destroy this lead", lead_path(@lea), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>
```

Esta é a view de mostrar o lead já salvo no sistema, que não funciona corretamente ao clicar tanto no botão de _editar lead_ quanto no de _destruir/remover lead_.
O erro na ação de clicar no botão de editar lead se dá pela linha 9, pois o helper de rota está com um erro de digitação, onde aparece escrito **edi_lead_path(@lead)** mas deveria ser **edit_lead_path(@lead)**.
Além disso, o erro na ação de clicar no botão de destruir/remover lead também se dá por problema parecido, onde o helper está como **lead_path(@lea)**, mas deveria ser **lead_path(@lead)** para que o objeto seja passado corretamente para a rota. Portanto, a correção dessa parte se dá por:

_- Remoção da linha 9:_
 ```erb
<%= link_to "Edit this lead", edi_lead_path(@lead), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>
```
_- Inserção da seguinte linha em seu lugar:_
```erb
<%= link_to "Edit this lead", edit_lead_path(@lead), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>
```
**->** essa substituição corrige o helper de rota, fazendo com que a página de edição seja chamada corretamente.

**- Remoção da linha 11:**
```erb
<%= button_to "Destroy this lead", lead_path(@lea), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>
```

_- Inserção da seguinte linha em seu lugar:_
```erb
<%= button_to "Destroy this lead", lead_path(@lead), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>
```
**->** essa substituição corrige o objeto passado no helper de destruir/remover lead, fazendo com que a remoção funcione como deveria.

<hr />

### 6- /app/views/leads/edit.html.erb -> linhas 1 a 12 ->

```erb
<%= simplo_form(model: lead, class: "contents") do |form| %>
  <% if lead.errors.any? %>
    <div id="error_explanation" class="bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3">
      <h2><%= pluralize(lead.errors.count, "error") %> prohibited this lead from being saved:</h2>
      <ul>
        <% lead.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
<% end %>
```


Essa é a view de edição de lead, que é aberta quando se clica no botão de editar lead. Existiam alguns erros nesse trecho, como escrita errada na chamada, pois não se trata de **simplo_form** e sim de **simple_form**, além do fato de que a gem do simple_form não estava adicionada ao projeto, sintaxe errada de convocação do simple_form e também o parâmetro/modelo de lead sendo passado errado, pois estava passando **lead** quando deveria passar **@lead**. Portanto, as correções dessa parte ficaram da seguinte maneira:

_- Instalação e configuração do simple_form no projeto:_

Para a instalação da gem do symple_form no projeto, primeiramente foi necessário _inserir a seguinte linha no arquivo Gemfile_: 

```erb
gem 'simple_form’
```

Após isso, foi necessário rodar novamente o comando ```bundle install``` no console para que a nova gem fosse instalada no sistema de maneira correta. Após feito isso, o simple_form já estava instalado no projeto.

_- Gerar o inicializador do simple_form:_

Após a instalação da gem, é necessário rodar o comando ```rails generate simple_form:install``` no terminal. Este comando gera um inicializador do simple_form, que pode ser encontrado no caminho **‘/config/initializers/simple_form.rb’**.
Após essas configurações, o simple form já pode ser utilizado de maneira correta no projeto e podemos agora explicar as correções de sintaxe feitas.

_– Remoção da linha 1:_

```erb
<%= simplo_form(model: lead, class: "contents") do |form| %>
```
_- Inserção da seguinte linha no lugar:_

```erb
<%= simple_form_for @lead, class: "contents" do |form| %>
```
**->** basicamente, aqui a sintaxe de chamada do simple_form foi corrigida, mantendo o envio da variável @lead e a classe contents e agora fazendo-o funcionar corretamente.
_- Remoção da linha 4:_

```erb
<h2><%= pluralize(lead.errors.count, "error") %> prohibited this lead from being saved:</h2>
```

_- Inserção da seguinte linha no lugar:_

```erb
<h2><%= pluralize(@lead.errors.count, "error") %> prohibited this lead from being saved:</h2>
```

_- Remoção da linha 7:_

```erb
<% lead.errors.each do |error| %>
```

_- Inserção da seguinte linha no lugar:_

```erb
<% @lead.errors.each do |error| %>
```
-> basicamente, a correção nas linhas 4 e 7 foram que a variável local chamada não estava sendo encontrada, pois era passado apenas lead, e não @lead.

<hr />

### 7- Tipo do dado telefone errado - telefone não sendo salvo
O tipo de armazenamento dos dados de telefone dos leads estava como decimal, o que não é interessante no banco de dados, visto que decimais são utilizados para representar números decimais precisos, ocupa mais espaço de armazenamento e não permite uma formatação como o string, além de que ele fazia com que fosse mostrado um ‘.0’ ao final de cada telefone na interface.
Para esta correção foi necessário _criar uma nova migration que modifica o schema do Lead no bd, fazendo com que o campo phone deixe de ser decimal e se torne string_.

- Primeiro é necessário criar uma nova migration, utilizando o comando ``` rails generate migration ChangePhoneTypeInLeads```. Este comando criará um novo arquivo de migração que pode ser localizado no caminho **‘/db/migrate/datetimeatual_change_phone_type_in_leads.rb’**.

- Após criada a migration, é importante configurá-la para que a coluna seja alterada, com o código ficando assim:
```erb
class ChangePhoneTypeInLeads < ActiveRecord::Migration[7.1]
  def change
    change_column :leads, :phone, :string
  end
end
```
**->** este código faz com que o tipo da coluna phone na tabela leads seja alterado, se tornando string.

- Após criada e configurada a migration, é necessário executá-la, utilizando o comando ```rails db:migrate``` no terminal.

Ao final disso, o campo telefone estará configurado corretamente como uma String, e não como decimal, consertando o bug visual e permitindo o armazenamento e arquitetura correta no banco de dados. Detalhe que foi utilizado o tipo string neste caso pois facilita caso os números de telefone no futuro necessitem de formatação especial ou se estiver lidando com números de telefone internacionais que podem incluir caracteres especiais.

<hr />

### 8- Dados do Phone não salvando com máscara
O dado de telefone basicamente não era salvo com uma máscara, além de permitir ser salvo com letras e outros caracteres (visto que o tipo de dado foi alterado para string)
Algumas modificações foram necessárias para corrigir isso.
Foram elas:

_app/models/lead.rb_

_linhas 5 e 6:_
```erb
validates :phone, presence: { message: I18n.t("lead.phone_presence") },
                    numericality: { only_integer: true, message: I18n.t("lead.phone_format") }
```
**->** foram acrescentadas validações para o telefone, como a obrigatoriedade do mesmo no cadastro/edição, além dele precisar ser um número (para evitar que letras e caracteres especiais pudessem ser inseridos).

_linhas 8 e 9:_

 ```erb
 before_validation :strip_non_numeric_characters
  before_save :format_phone, if: :will_save_change_to_phone?
```
**->** foram acrescentados 2 callbacks,o primeiro faz com que a função ```strip_non_numeric_characters``` seja chamada antes de validar os dados, essa função será explicada mais abaixo. O segundo callback faz com que a função ```format_phone``` seja chamada se o método ```will_save_change_to_phone?``` retornar verdadeiro. Este é um método gerado automaticamente pelo ActiveRecord para o atributo Phone do modelo, e neste caso serve para verificar se houve uma alteração no valor do atributo antes de salvar o registro no banco de dados.

_linhas 17 a 33:_
```erb
  def format_phone_number(phone_number)
    digits = phone_number.gsub(/\D/, '')
    
    if digits.length == 11
      formatted_phone_number = "(#{digits[0,2]}) #{digits[2,5]}-#{digits[7,4]}"
    elsif digits.length == 10
      formatted_phone_number = "(#{digits[0,2]}) #{digits[2,4]}-#{digits[6,4]}"
    else
      formatted_phone_number = phone_number
    end
  
    return formatted_phone_number
  end  

  def strip_non_numeric_characters
    self.phone = phone.scan(/\d/).join if phone.present?
  end
```
**->** foram acrescentadas 2 funções para auxiliar na validação dos dados do telefone. A primeira função **‘format_phone_number’** se refere à máscara de telefone utilizada para o salvamento no BD. Esta função checa se o telefone possui 10 ou 11 dígitos e o coloca no formato referente (10 dígitos: (99) 9999-9999; 11 dígitos: (99) 99999-9999). A função **‘strip_non_numeric_characters’** retira todos os caracteres que não sejam números do telefone (é utilizada antes da validação, como citado acima, para evitar conflitos e erros principalmente na edição de leads).

_app/views/leads/_ _ _form.html.erb e app/views/leads/edit.html.erb_

_linhas 24 a 27 na edit.html.erb e linhas 27 a 30 na_ _ _form.html.erb:_

```erb
<div class="my-5">
    <%= form.label :phone %>
    <%= form.text_field :phone, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
</div>
```
Aqui é o mesmo trecho nas duas, o input do campo de telefone que teve que ser alterado para acrescentar uma máscara que só permite que números sejam digitados no campo.

_- Remoção da linha:_
```erb
<%= form.text_field :phone, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
```

_- Inserção da seguinte linha no lugar:_
```erb
<%= form.text_field :phone, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full", pattern: "[0-9]*" %>
```
**->** Foi acrescentada, no campo de telefone dos 2 formulários a pattern ```“pattern: "[0-9]*"”```.

<hr />

### 9- Internacionalização das páginas (Português/Inglês)
Existiam alguns botões e outras funcionalidades que não estavam traduzidas corretamente para o português, portanto, tomei a liberdade de modificar o projeto inteiro, criando traduções e acrescentando a opção de mudar a página de português para inglês (e vice versa) a qualquer momento.
Para isso, as seguintes modificações foram feitas:

_/app/controllers/application_controler.rb_

Nesse arquivo, foi inserida uma função que seta o locale da aplicação, permitindo assim mudar o idioma das traduções:

Era:
```erb
 class ApplicationController < ActionController::Base
end
```

Ficou:
```erb
class ApplicationController < ActionController::Base
    before_action :set_locale
  
    private
  
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
```
  
_config/routes.rb_

Aqui nas rotas, foi necessário basicamente mudar para que o rails pudesse utilizar das traduções, mantendo a raíz do projeto na index dos leads e permitindo que essas traduções fossem aplicadas dentro desse aplicativo.

Era:
```erb
	Rails.application.routes.draw do
  resources :leads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "leads#index"
end
```

Ficou:
```erb
	Rails.application.routes.draw do
  resources :leads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  Rails.application.routes.draw do
    scope "(:locale)", locale: /en|pt/ do
      resources :leads
      root to: "leads#index"
    end
  end
end
```

_/config/locales/en.yml e /config/locales/pt.yml (arquivos de tradução)_

Estes arquivos foram criados para conter as traduções utilizadas dentro do aplicativo, em inglês e português.

en.yml:
```yml
	en:
  hello: "Hello world"
  edit_lead: "Edit this lead"
  destroy_lead: "Destroy this lead"
  back_to_leads: "Back to leads"
  leads:
    title: "Leads"
    new_lead: "New lead"
    update_lead: "Update lead"
    error_count: "error"
    error_prohibited: "prohibited this lead from being saved"
    create_success: "Lead was successfully created."
    update_success: "Lead was successfully updated."
    destroy_success: "Lead was successfully destroyed."
  lead:
    name: "Name"
    email: "Email"
    phone: "Phone"
    show_lead: "Show this lead"
    edit_lead: "Edit this lead"
    new_lead: "New lead"
    email_presence: "Email can't be blank"
    email_format: "Invalid email format"
    name_presence: "Name can't be blank"
    phone_presence: "Phone can't be blank"
    phone_format: "Phone only allows numbers"
```

pt.yml:
```yml
	pt:
  hello: "Olá mundo"
  edit_lead: "Editar este lead"
  destroy_lead: "Excluir este lead"
  back_to_leads: "Voltar para leads"
  leads:
    title: "Leads"
    new_lead: "Novo lead"
    update_lead: "Atualizar lead"
    error_count: "erros"
    error_prohibited: "proibiu este lead de ser salvo"
    create_success: "Lead criado com sucesso."
    update_success: "Lead atualizado com sucesso."
    destroy_success: "Lead excluído com sucesso."
  lead:
    name: "Nome"
    email: "E-mail"
    phone: "Telefone"
    show_lead: "Mostrar este lead"
    edit_lead: "Editar este lead"
    new_lead: "Novo lead"
    email_presence: "O e-mail não pode ficar em branco"
    email_format: "O formato do e-mail é inválido"
    name_presence: "O nome não pode ficar em branco"
    phone_presence: "O telefone não pode ficar em branco"
    phone_format: "O telefone só permite números"
```

_/app/assets/images/us-flag.svg e /app/assets/images/brazil-flag.svg_

Esses são arquivos svg da bandeira do Brasil e dos EUA, utilizados na barra de navegação como os botões para alternar a tradução do aplicativo.

_/app/views/layouts/application.html.erb:_

Este é o arquivo html “base” da aplicação, e nele foi inserido no seu corpo uma barra de navegação onde as duas imagens das bandeiras foram colocadas em formato de botões, onde quando são clicados, automaticamente chamam a função modificando o locale da aplicação.

Foi acrescentado ao body:
```erb
	<nav>
      <ul>
        <li style="display: inline-block; margin-right: 10px;">
          <%= link_to image_tag("brazil-flag.svg", alt: "Português", width: 44, height: 28), url_for(locale: :pt) %>
        </li>
        <li style="display: inline-block;">
          <%= link_to image_tag("us-flag.svg", alt: "English", width: 44, height: 28), url_for(locale: :en) %>
        </li>
      </ul>
    </nav>
```
