require 'FileUtils'

puts 'Digite o nome do Sistema:'
sistema = gets

files = ['railsbox/development/Vagrantfile_template', 'railsbox/ansible/group_vars/all/config_template.yml']

files.each do |file_name|
  file = File.read(file_name)
  new_content = file.gsub(/{{sistema}}/, sistema.strip)
  new_file = file_name.gsub(/_template/, '')

  File.open(new_file, 'w') { |file| file.write(new_content) }

  FileUtils.copy_entry('railsbox', 'railsboxdev')

  File.delete('railsboxdev/development/Vagrantfile_template', 'railsboxdev/ansible/group_vars/all/config_template.yml')
end
