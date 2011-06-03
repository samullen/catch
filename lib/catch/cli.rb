module Catch
    class Runner 
      def initialize(params={})
        @params=params
        puts "Connecting to Catch...params=#{params}" if @params[:v]
        #ok my problem was running this script as a script and not 
        #ruby catch_cli then it works just fine
        @catch = Catch::Client.new(:username => @params[:u], :password => @params[:p])
        @catch
      end

      def delete(id)
        puts "Deleting catch note, id=#{id}" if @params[:v]
        @catch.delete_note(id)
      end

      def new(text)
        puts "Adding new note to catch. text='#{text}'" if @params[:v]
        @catch.add_note(:text => text)
      end

      def update(id, text)
        puts "Fetching note, id=#{id} and appending, text=#{text}" if @params[:v]
        note = fetch(id)
        note = @catch.modify_note(id, :text => note.text + " #{text}")
        note.text
      end
      
      def fetch(id)
        puts "Fetching catch note id=#{id}" if @params[:v]
        @catch.note(id)
      end

      def fetch_text(id)
        puts "Fetching catch note text id=#{id}" if @params[:v]
        @catch.note(id).text
      end

      def search(term)
        puts "Searching for #{term}" if @params[:v]
        notes = @catch.search(term)
        note_text = []
        notes.each{|n| 
            note_text << "#{n.id}: #{fetch_text(n.id)}\n"
        }
        note_text
      end
    end
end

