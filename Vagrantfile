Vagrant.configure(2) do |config|
    config.vm.box = 'ubuntu/xenial64'
    config.vm.box_url = 'ubuntu/xenial64'
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
 	config.vm.define "dmp" do |dmp|
   	 	dmp.vm.hostname = 'dmp'
    	dmp.vm.network "public_network", use_dhcp_assigned_default_route: true
    	dmp.vm.synced_folder ".", "/srv/salt", id: "salt"
    	dmp.vm.post_up_message = "Install completed for vm dmp!"
  	end
end

