# Transerviços
--------------------
[![Build Status](https://snap-ci.com/ThoughtWorksInc/transervicos/branch/master/build_image)](https://snap-ci.com/ThoughtWorksInc/transervicos/branch/master)

## Primeiros passos

#### Instalando o Vagrant e o Ansible

1. Instale o [Ansible](http://www.ansible.com "ansible")
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
2. `vagrant up`
3. `vagrant provision` (A primeira execução será um pouco lenta)

#### Utilizando o Vagrant

Para utilizar o Vagrant, execute os seguintes comandos:

1. `cd caminho_do_projeto`
2. `vagrant up`
3. `vagrant ssh` (entra na máquina e abre o terminal do Linux)
4. `cd /vagrant/transervicos` 
5. `rake server:start` (inicia o servidor)
6. Abra seu browser e acesse `http:localhost:8080`
