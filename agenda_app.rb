require "./agenda.rb"

class AgendaApp
  attr_accessor :agenda

  def initialize
    @agenda = Agenda.new
  end

  def run
  
    loop do
      puts ""
      40.times {print "="}
      puts "\n         *** RUBY AGENDA ***"
      puts "\n   ¿Qué deseas hacer?"
      puts "\n   (1) - Buscar un contacto"
      puts "   (2) - Ver todos los contactos"
      puts "   (3) - Agregar un contacto"
      puts "   (4) - Borrar un contacto"
      puts "   (5) - Borrar todos los contactos"
      puts "   (0) - Salir de la aplicación"
      40.times {print "="}
      print "\n        Selecciona una opción: "
      
      input = gets.chomp

      case input
        when "1"
          if @agenda.no_contacts
            puts ""
            40.times {print "-"}
            puts ""
            puts ">>> No hay contactos para mostrar"
            40.times {print "-"}
            puts ""
            print "    Presiona 'Enter' para continuar "
            gets
          else
            print "\nIntroduce el nombre del contacto a buscar: "
            name = gets.chomp
            puts ""
            40.times {print "-"}
            puts ""
            @agenda.show_contact(name)
            40.times {print "-"}
            puts ""
            print "    Presiona 'Enter' para continuar "
            gets
          end
          
        when "2"
          puts ""
          40.times {print "-"}
          puts ""
          @agenda.show_all
          40.times {print "-"}
          puts ""
          print "    Presiona 'Enter' para continuar "
          gets

        when "3"
          print "\nIntroduce el nombre del contacto : "
          name = gets.chomp
          print "Introduce el número de teléfono : "
          phone = gets.chomp
          @agenda.add_contact(name, phone)
          puts ""
          40.times {print "-"}
          print "\n>>> Contacto agregado exitosamente"
          puts ""
          40.times {print "-"}
          puts ""
          print "    Presiona 'Enter' para continuar "
          gets

        when "4"
          if @agenda.no_contacts
            puts ""
            40.times {print "-"}
            puts "\n>>> No hay contactos para eliminar"
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          else
            print "\nIntroduce el nombre del contacto a eliminar: "
            name = gets.chomp
            puts ""
            40.times {print "-"}
            @agenda.delete_contact(name)
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          end

        when "5"
          if @agenda.no_contacts
            puts ""
            40.times {print "-"}
            puts "\n>>> No hay contactos para eliminar"
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          else
            print "\n¿Estás seguro que deseas eliminar todos los contactos de la agenda s/n: "    
            if gets.chomp == "s"
              @agenda.delete_all
              puts ""
              40.times {print "-"}
              puts "\n>>> Todos los contactos han sido eliminados"
              40.times {print "-"}
              print "\n    Presiona 'Enter' para continuar "
              gets
           end
          end

        when "0"
          break
          
        else
          puts "\n>>> Opción no válida"
          puts ""
          print "    Presiona 'Enter' para continuar "
          gets
      end
    end
    puts "\n>>> ¡Gracias por utilizar Ruby Agenda!"
    puts ""
  end
end 

agenda = AgendaApp.new

agenda.run