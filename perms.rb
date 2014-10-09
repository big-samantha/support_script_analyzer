file_text = File.read('_etc_puppetlabs_puppet.txt')
permissions_lines = file_text.each_line.select do |line|
  (line.gsub('/\s+/m', ' ').strip.split(' ')[10].split('/')[4]) == 'ssl'
end

size_zero_certs = permissions_lines.each.select do |line|
  (line.gsub('/\s+/m', ' ').strip.split(' ')[6].to_i) == 0
end

p "Certs with size 0"
size_zero_certs.each do |cert|
  puts cert
end
