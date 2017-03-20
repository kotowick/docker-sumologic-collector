require 'json'

class SumoSources
  def initialize(args)
    exit 1 unless check_args(args)
    @input_file_location = args[0]
    @output_file_location = args[1]
    @items = {}

    puts "- Initializing vars -"
  end

  def write_file
    return if @items.empty?
    puts "Writing to file: " + @output_file_location
    File.open(@output_file_location,"w") do |f|
      f.puts((JSON.pretty_generate @items))
    end
  end

  def read_files
    Dir.glob(@input_file_location) do |rb_file|
      puts "Reading file: " + rb_file
      file = JSON.parse(File.read(rb_file))
      next if file.empty?
      @items.empty? ? @items = file : @items["sources"] += file["sources"]
    end
  end

  def check_args(args)
    args.delete("")
    return false if args.empty?
    rtn = true
    puts "input_file_location is blank" && rtn = false if args[0] == ""
    puts "output_file_location is blank" && rtn = false if args[1] == ""
    return rtn
  end
end

d = SumoSources.new(ARGV)
d.read_files
d.write_file
