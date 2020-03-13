Vagrant.configure("2") do |config|

  # General
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # Influx server
  config.vm.define "gitlab" do |gitlab|
    gitlab.vm.box = "centos/7"
    gitlab.vm.network "private_network", ip: "10.10.10.10"
    gitlab.vm.hostname = "gitlab"

    gitlab.vm.provider "virtualbox" do |vb|
      vb.name = "gitlab"
      vb.cpus = 2
      vb.memory = 3092
    end

    gitlab.vm.provision "docker" do |d|
      d.run "gitlab/gitlab-ce",
        args: "-p 80:80 -p 443:443 -p 222:222 --env 'GITLAB_OMNIBUS_CONFIG=external_url \"http://10.10.10.10/\";'"
    end

  end

  config.vm.define "runner" do |runner|
    runner.vm.box = "centos/7"
    runner.vm.network "private_network", ip: "10.10.10.11"
    runner.vm.hostname = "runner"

    runner.vm.provider "virtualbox" do |vb|
      vb.name = "runner"
    end

    runner.vm.provision "docker" do |d|

    end

    runner.vm.provision "shell", path: "scripts/runner.sh"

  end

end
