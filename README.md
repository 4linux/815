Laboratório - 815 - Especialista Elastic Stack
=============================

Repositório para armazenar o Laboratório do curso Especialista Elastic Stack da [4Linux][1]

Dependências
------------

Para a criação do laboratório é necessário ter pré instalado os seguintes softwares:

* [Git][2]
* [VirtualBox][3]
* [Vagrant][5]

> Para o máquinas com Windows aconselhamos, se possível, que as instalações sejam feitas pelo gerenciador de pacotes **[Cygwin][6]**.

> Para as máquinas com MAC OS aconselhamos, se possível, que as instalações sejam feitas pelo gerenciador de pacotes **brew**.

Laboratório
-----------

O Laboratório será criado utilizando o [Vagrant][7]. Ferramenta para criar e gerenciar ambientes virtualizados (baseado em Inúmeros providers) com foco em automação.

Nesse laboratórios, que está centralizado no arquivo [Vagrantfile][8], serão criadas 3 maquinas com as seguintes características:

Nome           | vCPUs | Memoria RAM | IP             | S.O.¹            
--------------:|:-----:|:-----------:|:--------------:|:------------- 
node-primary   | 1     | 1024MB       | 192.168.63.10 | ubuntu-20.04  
node-secondary | 1     | 1024MB       | 192.168.63.11 | ubuntu-20.04  
monitoring     | 1     | 1024MB       | 192.168.63.20 | ubuntu-20.04  


> **¹**: Esses Sistemas operacionais estão sendo utilizados no formato de Boxes, é a forma como o vagrant chama as imagens do sistema operacional utilizado.

> **²**: Para o Script de Provisionamento estamos utilizando Shell Script


Criação do Laboratório 
----------------------

Para criar o laboratório é necessário fazer o `git clone` desse repositório e, dentro da pasta baixada realizar a execução do `vagrant up`, conforme abaixo:

```bash
git clone https://github.com/4linux/815
cd 815/
vagrant up
```

_O Laboratório **pode demorar**, dependendo da conexão de internet e poder computacional, para ficar totalmente preparado._

> **Atenção** Para máquinas físicas com apenas 8GB de RAM recomendamos ligar apenas uma máquina por vez.

> Em caso de erro na criação das máquinas sempre valide se sua conexão está boa, os logs de erros na tela e, se necessário, o arquivo **/var/log/vagrant_provision.log** dentro da máquina que apresentou a falha.

Por fim, para melhor utilização, abaixo há alguns comandos básicos do vagrant para gerencia das máquinas virtuais.

Comandos                | Descrição
:----------------------:| ---------------------------------------
`vagrant up`            | Cria/Liga as VMs baseado no VagrantFile
`vagrant provision`     | Provisiona mudanças logicas nas VMs
`vagrant status`        | Verifica se VM estão ativas ou não.
`vagrant ssh <vm>`      | Acessa a VM
`vagrant suspend <vm>`  | Desliga a VM mas salva o estado atual
`vagrant resume <vm>`   | Reinicia a VM no estado salvo pelo suspend
`vagrant reload <vm>`   | Reinicia a VM
`vagrant halt`          | Desliga as VMs



> Matrix de compatibilidade dos SOs com o Elastic:

https://www.elastic.co/support/matrix

> Para maiores informações acesse a [Documentação do Vagrant][13]

[1]: https://4linux.com.br
[2]: https://git-scm.com/downloads
[3]: https://www.virtualbox.org/wiki/Downloads
[5]: https://www.vagrantup.com/downloads
[6]: https://cygwin.com/install.html
[7]: https://www.vagrantup.com/
[13]: https://www.vagrantup.com/docs
[14]: https://app.vagrantup.com/4linux

