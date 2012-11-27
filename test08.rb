#Program should ask user to input some text. After that BY USER’S choice it will calculate number of spaces,
#tabs and new lines signs OR save input into file and then make calculations. After calculations are done,
#result should be saved to text file. If user presses enter without inputting any text,
#program should give warnings and ask input one more time – until something is entered.

module Output
  def shout(message)
    puts message
  end

  def save_calculations(txt, path)
    puts "saved to - " + path
    begin
    fl = File.open(path,"a")
    fl.puts("")
    fl.puts(txt)
    fl.close
    ensure
      fl.close
    end
  end

  def save_file(txt, path)

    fl = File.new(path, "w")
    fl.puts(txt)
    fl.close
       
  end

  def warning(message)
    puts 'WARNING:' + message
  end
end

module Menu
  include Output

  def show_menu(msg)
      #show menu for user
      @action = {"1" => "Calculate and show on screen", "2" => "Calculate and save to file", "3" => "Quit"}
      shout(msg)
      @action.each { |num, message| puts "#{num}. #{message}" } #show menu

  end

  def get_action(msg)
    #get menu selection from user
    @option = ''
    pass = false
    while @option.empty? || !pass
      show_menu(msg)
      @option=gets.chomp
      #check given input
      @action.each_key { |key| if @option == key: pass = true end } #check that selected option is possible
        if !pass then warning("no such option") end #give warning if option is missing
    end

   def get_path(txt)
     #ask filename /or path
      @path = ''
      while @path.empty?
        shout(txt)
        @path=gets.chomp
        #if filename is missing any extension, then add '.txt'
        if @path.scan(/(?:.*\.)(.*$)/).to_s.empty? then @path= @path +'.txt' end
      end

   end

  end
end

class Analyzator
  include Menu
  include Output
  attr_accessor :option

  def initialize()
    @input = ''
    @calculations = {"newlines" => 0, "tabs"=> 0 , "spaces" => 0}
  end

  def format_calculations(calc)
    #format all calculations to single string
    str = ''
    calc.each { |key, value| str= str + (key + " [" + value.to_s + "]\n")  }
    return str
  end

  def calculate(txt=@input)
    #count newlines, tabs and spaces.
    txt.each_char { |chr|
      if chr.eql?("\n")
        @calculations["newlines"] += 1
      elsif chr.eql?("\t")
        @calculations["tabs"] +=1
      elsif chr.eql?("\s")
        @calculations["spaces"] +=1
      end }
    return format_calculations(@calculations)
  end

  def get_input(txt)
    #ask input until something besides null come.
    while @input.empty?
      shout(txt)
      @input = gets.chomp
  
    end
  end

  def do_magic(option)
    #do calculations here
    if option.eql?("1")
      shout(calculate())
    elsif option.eql?("2")
      get_path("Please provide filename")
      save_file(@input, @path)
      save_calculations(calculate(),@path)
      shout(@path + ' file saved')
    elsif option.eql?("3")
      #TODO: make some sort of quit!
      self.exit!
    end
  end
end


if __FILE__ == $0
  begin
  work = Analyzator.new
  work.get_input("please provide some text(empty string not accepted)")
  work.get_action("What do you want to do next (provide number)?")
  work.do_magic(work.option)
  rescue
    #in case someone pushes ctrl+c, this will end process correctly.
    exit!
  end
end