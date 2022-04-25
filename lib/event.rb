require 'time'

class Event

    attr_accessor :start_date
    attr_accessor :duration
    attr_accessor :title
    attr_accessor :attendees

    def initialize(start_date_def, duration_def, title_def, attendees_def)
        @start_date = Time.parse(start_date_def)
        @duration = duration_def
        @title = title_def
        @attendees = attendees_def
    end

    def postpone_24H
        @start_date += 60 * 60 * 24
    end

    def end_date
        return @start_date + @duration * 60 #duration en minutes
    end

    def is_past?
        return Time.now > @start_date
    end

    def is_future?
        return Time.now < @start_date
    end
 
    def is_soon?
        return (@start_date < (Time.now + 60 * 30) ) && (@start_date > Time.now)
    end

    def to_s
        puts ">Titre : #{@title}"
        puts ">Date de début : #{@start_date.strftime("%Y-%m-%d%k:%M")}"
        puts ">Durée : #{@duration} minutes"
        print ">Invités : "
        @attendees.each do |item|
            print "#{item} "
        end

    end



    private

end

class EventCreator

    def initialize
        puts "Salut, tu veux créer un événement ? Cool !"
        puts "Commençons. Quel est le nom de l'événement ?"
        print ">"
        title = gets.chomp
        puts "Super. Quand aura-t-il lieu ?"
        print ">"
        start_date = gets.chomp.to_s
        puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
        print ">"
        duration = gets.chomp
        puts "Génial. Qui va participer ? Balance leurs e-mails"
        print ">"
        attendees = gets.chomp.delete(";").split
        puts attendees
        puts "Super, c'est noté, ton évènement a été créé !"
        mon_event = Event.new(start_date, duration, title, attendees)
        mon_event.to_s
    end

end