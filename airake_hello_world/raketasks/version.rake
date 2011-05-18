require 'yaml'

desc "Print out current version"
task :version do
  if md = File.read(YAML.load_file('airake.yml')["appxml_path"]).match(/<version>(.*)<\/version>/)
    puts "Current version is #{md[1]}"
  else
    raise "Cannot detect current version.\nMake sure appxml file contains <version>X.X.X</version> tag."
  end
end

namespace :version do

  [:major, :minor, :patch].each do |subv|
    desc "Bump #{subv} in version"
    task :"bump_#{subv}" do

      unless `git status` =~ /nothing to commit/
        raise "There are uncommitted changes. Failed to proceed."
      end

      appxml = YAML.load_file('airake.yml')["appxml_path"]
      str = File.read(appxml)

      msg = nil
      new_version = nil

      if str.gsub! /<version>(.*)<\/version>/ do |matched|
        old_version = $1
        major, minor, patch = old_version.split(".").map(&:to_i)
        eval("#{subv} += 1")
        new_version = [major, minor, patch].join(".")
        msg = "Version bump #{old_version} => #{new_version}"
        puts msg
        "<version>#{new_version}<\/version>"
      end.nil?
        raise "Cannot detect current version.\nMake sure appxml file contains <version>X.X.X</version> tag."
      else
        File.open(appxml, "w") do |f|
          f.write str
        end

        puts `git commit -am "#{msg}"`
        puts `git tag v#{new_version}`
      end
    end
  end
end
