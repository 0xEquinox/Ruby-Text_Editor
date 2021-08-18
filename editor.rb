require 'io/console'

class Editor

    def initialize
        
        puts "(1) Open File"       
        puts "(2) Read File"       

        selection = gets.chomp

        if(selection == "1")
            open_file
        elsif(selection == "2")
            read_file
        end
    end


    def open_file

        text = []

        puts "Enter file name: "
        name = gets.chomp

        File.readlines(name).each do |line|
            text << line
        end

        system 'cls'
        
        for i in 1..text.length
            puts "#{i}  #{text[i]}"
        end

        edit(name, text)
    end

    def read_file
        puts "Enter file name: "
        name = gets.chomp
        file = File.open(name, "r")
        puts file.read
    end

    def edit(name, text)

        passes = 0

        loop do

        
            
            print "#{text.length + 1}   "
            
            
            line = gets.chomp
            break if line == "quit"
            text = edit_mode(text) if line == "ed"

            if line == "ed"
                line = ""
            end
        
            text << line

            passes += 1
        end
        save(text, name)
    end

    def save(text, name)
        file = File.open(name, "w")
        file.puts(text)
    end
    
    def edit_mode(text)
        
        line_num = gets.chomp

        text[line_num.to_i] = gets.chomp

        system 'cls'
        puts "*********************************************************************************************************"
        
        for i in 1..text.length
            puts "#{i}  #{text[i]}"
        end

        return text
        
    end
end


Editor.new
