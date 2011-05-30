require_relative 'TextAnalyzer'
require 'logger'

## sample implementation
$LOG = Logger.new("jdcrisostomo_textAnalyzer.log", "monthly")
$LOG.progname = "jdcrisostomo_textAnalyzer"

def create_analyzer_object
  begin 
    print "Enter filename : "
    fname = gets.chomp!
    $LOG.debug "Trying to initialize object with file : #{fname}..."
    TextAnalyzer.new(fname)
    rescue Exception => e
      $LOG.error "Object initialization failed! - #{e}"
      puts "#{e}"
      create_analyzer_object
  end
end

ta = create_analyzer_object
$LOG.debug "Object initialization successful."
puts ta.report
ta.create_log
