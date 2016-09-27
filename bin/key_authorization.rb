def authorize_key_for_root(config, *key_paths)

  username = "vagrant"
  userpath = "home/#{username}"

  [*key_paths, nil].each do |key_path|
    if key_path.nil?
      fail "Public key not found at following paths: #{key_paths.join(', ')}"
    end

    full_key_path = File.expand_path(key_path)

    if File.exists?(full_key_path)
      config.vm.provision 'file',
        run: 'once',
        source: full_key_path,
        destination: "/home/vagrant/#{username}_pubkey"

      config.vm.provision 'shell',
        privileged: true,
        run: 'once',
        inline:
          "cat /home/vagrant/#{username}_pubkey >> /#{userpath}/.ssh/authorized_keys && " +
          "rm -f /home/vagrant/#{username}_pubkey && " +
          'echo "Done!"'
      break
    end
  end
end
