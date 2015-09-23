Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
   config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
    ansible.verbose = 'vv'
  end
end
