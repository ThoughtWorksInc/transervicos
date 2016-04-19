[![Stories in Ready](https://badge.waffle.io/ThoughtWorksInc/transervicos.png?label=ready&title=Ready)](https://waffle.io/ThoughtWorksInc/transervicos)
# Transerviços
--------------------
[![Build Status](https://snap-ci.com/ThoughtWorksInc/transervicos/branch/master/build_image)](https://snap-ci.com/ThoughtWorksInc/transervicos/branch/master)

## Primeiros passos

#### Instalando o Vagrant e o Ansible

1. Instale o [Ansible](http://www.ansible.com "ansible") **a partir da versão 1.9**
2. Instale o [Vagrant](http://www.vagrantup.com/ "vagrant")
3. Instale o [VirtualBox](https://www.virtualbox.org/wiki/Downloads "virtualbox")

#### Instalando o Vagrant Cashier

O Cashier é um plugin para o Vagrant que permite a utilização de cache de provisionamente, permitindo maior rapidez ao efetuar futuros provisionamentos.

1. No terminal, vá para o diretório onde se encontra o projeto (`$ cd caminho_do_projeto`)
2. Na raíz do projeto (ou na pasta onde se encontra o arquivo Vagrantfile) execute o seguinte comando:
`vagrant plugin install vagrant-cachier`

#### Provisionando o vagrant

Para efetuar o provisionamento, execute os seguintes comandos:

1. `cd caminho_do_projeto`
2. `vagrant up --no-provision`
3. `vagrant provision` (A primeira execução será um pouco lenta)

#### Utilizando o Vagrant

Para utilizar o Vagrant, execute os seguintes comandos:

1. `cd caminho_do_projeto`
2. `vagrant up`
3. `vagrant ssh` (entra na máquina e abre o terminal do Linux)
4. `cd /vagrant/transervicos`
5. `rake db:migrate db:seed server:start` (roda migrações, popula tabelas essenciais e inicia o servidor)
6. Abra seu browser e acesse `http:localhost:8000`

#### Criando um usuário admin

Execute o comando `rails c` e coloque o comando 
`us = User.create(password: 'password',password_confirmation: 'password',email: 'roselma.mendes@gmail.com',social_name: "Roselma",civil_name: "Roselma",birth_date: 20.years.ago,username: "roselma",phone_number: "12346789",name_preference: User::SOCIAL_NAME_PREFERENCE)`

Depois `us.admin = true` e então `us.save`.

Logue no site com o novo usuário criado e vá para a url `http://localhost:8000/admin`.

### Rodando os testes

Estando logado na máquina com `vagrant ssh`, vá até o diretório do projeto com `cd /vagrant/transervicos`

#### Para rodar os testes unitários de ruby

1. `rake spec`

#### Para rodar os testes unitários de Javascript

1. `grunt karma`
