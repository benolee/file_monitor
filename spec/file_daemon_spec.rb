# before do
#   Dir.chdir File.expand_path(File.join('..',File.dirname(__FILE__)))
# end

# it 'should work' do
#   # TODO: replace these system calls with aruba
#   system('ruby file_daemon.rb start')
#   sleep(1)
#   system('touch private/ftp/sample_file.csv')
#   sleep(1)
#   system('echo "hello world" >private/ftp/sample_file.csv')
#   sleep(1)
#   system('rm private/ftp/sample_file.csv')
#   system('script/file_daemon stop')
#   f = File.open('tmp/mylog.txt', 'r')
#   last_line = f.readlines.last
#   f.close
#   last_line.should =~ "create"
# end
