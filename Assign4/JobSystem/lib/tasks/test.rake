task :test do
  puts `rspec spec`
  puts `open coverage/index.html`
end

task :default => :test