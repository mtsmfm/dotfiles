require 'fileutils'
include FileUtils::Verbose

HOME = ENV['HOME']

task :default => %w(clean symlink)

desc "remove symbolic links"
task :clean do
  rm_r Dir.glob(File.expand_path('.*', HOME)).select {|path|
    File.symlink?(path) && File.dirname(File.readlink(path)) == Dir.pwd
  }
end

desc "create symbolic links"
task :symlink do
  Dir.glob('dot.*') do |src|
    dest = File.expand_path(src.sub(/^dot\./, '.'), HOME)
    ln_s File.expand_path(src), dest, :force => true
  end
end
