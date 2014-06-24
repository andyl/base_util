require 'octokit'
require 'pry'

module GitHubUtil

  PUBFILE = File.expand_path("~/.ssh/id_rsa.pub")

  attr_reader :passwd

  def ensure_pub_file
    unless File.exist?(PUBFILE)
      puts "Generating new ssh key..."
      `ssh-keygen -t rsa -q -f ~/.ssh/id_rsa -N ""`
    end
  end

  def host
    `hostname`.strip
  end

  def set_passwd(arg)
    @passwd ||= arg || `getp common`.chomp
    abort "Please enter a password" if @passwd.empty?
    @passwd
  end

  def set_repo(arg)
    @repo ||= "andyl/#{arg}"
  end

  def client
    args = {login: 'andyl', password: passwd}
    @client ||= Octokit::Client.new(args)
  end

  def key
    @key ||= File.read(PUBFILE)
  end

  def ensure_valid_repository
    unless client.repositories.find {|x| x["full_name"] == repo}
      binding.pry
      abort "GitHub repository '#{repo}' not found"
    end
  end

end

