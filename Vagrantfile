BASE_PATH = "/vagrant/transervicos"

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
   config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
    ansible.verbose = 'vv'

    config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    config.vm.synced_folder ".", BASE_PATH

    if Vagrant.has_plugin?("vagrant-cachier")
     config.cache.scope = :box
    end
  end
end
