require 'slop'

opts = Slop.parse suppress_errors: true do |o|
  o.string '-f', '--filename', 'a file to import', required: true
  o.bool '-h', '--help', 'Help and usage information'
end

if opts.help?
  puts opts
elsif opts[:filename]
  input = File.read(opts[:filename])
  if input
    puts "read file #{opts[:filename]}"
  else
    puts "couldn't read #{opts[:filename]}"
  end
else
  puts "Missing filename"
  puts opts
  exit 1
end
