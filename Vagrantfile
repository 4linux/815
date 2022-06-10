#Definição de maquinas do Laboratório do Elastic Stack
machines = {
	"node-master"       => { "ip" => "10",  "memory" => "2048", "cpus" => "1" },
	"node-data"     => { "ip" => "11",  "memory" => "2048", "cpus" => "1" },
  "monitoring"         => { "ip" => "20", "memory" => "1024", "cpus" => "1" },
}

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"
  machines.each do |name,conf|
    config.vm.define "#{name}" do |srv|
      srv.vm.hostname = "#{name}.example.com"
      srv.vm.network 'private_network', ip: "192.168.63.#{conf["ip"]}"
      srv.vm.provider 'virtualbox' do |vb|
        vb.name = "#{name}"
        vb.memory = "#{conf["memory"]}"
        vb.cpus = "#{conf["cpus"]}"
        vb.customize ["modifyvm", :id, "--groups", "/ElasticStack"]
      end
      
      srv.vm.provision "shell", inline: <<-SHELL
        echo "root:vagrant" | chpasswd
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        sudo systemctl restart sshd
      SHELL

      srv.vm.provision "shell" do |s| 
        s.path = "provision/prereq.sh"
        s.args = [config.vm.box]
      end
      
      srv.vm.provision "shell" do |s| 
        s.path = "provision/install_elastic.sh"
        s.args = [config.vm.box]
      end

      if "#{name}" == "monitoring" then
        srv.vm.provision "shell" do |s|
          s.path = "provision/install_postgres.sh"
          s.args = [config.vm.box]
        end
      end

      #if "#{name}" == "monitoring" then
      #  srv.vm.provision "shell" do |s| 
      #    s.path = "provision/install_docker.sh"
      #    s.args = [config.vm.box]
      #  end
      #end

    end

  end

end
