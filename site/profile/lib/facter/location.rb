begin
  require 'facter/util/puppet_settings'
rescue LoadError => e
  rb_file = File.join(File.dirname(__FILE__), 'util', 'puppet_settings.rb')
  load rb_file if File.exists?(rb_file) or raise e
end

Facter.add('location') do
  setcode do
    domain = Facter::Util::PuppetSettings.with_puppet do
        Puppet[:certname].split('.')[1..-1].join('.')
    end
   
    case domain
    when 'pdx'
      'portland'
    when 'ec2.internal'
      'amazon'
    else
      'portland'
    end
  end
end