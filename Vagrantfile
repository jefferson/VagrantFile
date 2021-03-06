
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define 'rails-box'
  config.vbguest.auto_update = true

  # Forward ports
  # 5000 - Rails Puma
  # 5432 - Postgres
  # 6379 - Redis server
  [5000,5432,6379].each do |p|
    config.vm.network :forwarded_port, guest: p, host: p
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '3072']
    #vb.customize ["guestproperty", "set", :id, "--timesync-threshold", 2000]
  end

  ## If you are using Windows o Linux with an encrypted volume
  #config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  ## If you're using OS X or Linux (not encrypted)
  ## NFS improves speed of VM if supported by your OS  
  config.vm.network 'private_network', ip: "192.168.56.88"   
  config.vm.synced_folder '.', '/app', type: "nfs", mount_options: ['rw'], linux__nfs_options: ['rw','no_subtree_check','all_squash','async']

  # Provision box
  config.vm.provision "shell", privileged: false, run: "always",
    path: "provision/zsh_setup.sh"
  config.vm.provision "shell", privileged: false, run: "always",
    path: "provision/box_setup.zsh"
  config.vm.provision "shell", privileged: false, run: "always",
    path: "provision/set-ruby.sh"
end