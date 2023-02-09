# Agenda de contactos sencilla hecha con Ruby
# Creador: Gregorio Candelas / gcandelas19@gmail.com 
# Fecha: Febrero 2023.

require "./agenda.rb"

class AgendaApp
  attr_accessor :agenda

  def initialize
    @agenda = Agenda.new
  end

  def run
    # Creación de interfaz de usuario
    loop do
      print "\n"
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
        # Caso (1): Buscar contacto
        when "1"
          if @agenda.no_contacts  # Primero verificar si hay algún contacto en la agenda.
            print "\n"
            40.times {print "-"}
            puts "\n>>> No hay contactos para mostrar"
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          else
            print "\nIntroduce el nombre del contacto a buscar: "
            name = gets.chomp
            print "\n"
            40.times {print "-"}
            print "\n"
            @agenda.show_contact(name)
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          end

        # Caso (2): Ver todos los contactos  
        when "2"
          print "\n"
          40.times {print "-"}
          print "\n"
          @agenda.show_all
          40.times {print "-"}
          print "\n    Presiona 'Enter' para continuar "
          gets
        
        # Caso (3): Agregar contacto
        when "3"
          print "\nIntroduce el nombre del contacto : "
          name = gets.chomp
          print "Introduce el número de teléfono : "
          phone = gets.chomp
          @agenda.add_contact(name, phone)
          print "\n"
          40.times {print "-"}
          print "\n>>> Contacto agregado exitosamente"
          print "\n"
          40.times {print "-"}
          print "\n    Presiona 'Enter' para continuar "
          gets
        
        # Caso (4): Eliminar un contacto
        when "4"
          if @agenda.no_contacts
            print "\n"
            40.times {print "-"}
            puts "\n>>> No hay contactos para eliminar"
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          else
            print "\nIntroduce el nombre del contacto a eliminar: "
            name = gets.chomp
            print "\n"
            40.times {print "-"}
            @agenda.delete_contact(name)
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          end
        
        # Caso (5): Borrar todos los contactos
        when "5"
          if @agenda.no_contacts
            print "\n"
            40.times {print "-"}
            puts "\n>>> No hay contactos para eliminar"
            40.times {print "-"}
            print "\n    Presiona 'Enter' para continuar "
            gets
          else
            print "\n¿Estás seguro que deseas eliminar todos los contactos de la agenda s/n: "    
            if gets.chomp == "s"
              @agenda.delete_all
              print "\n"
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
          print "\n    Presiona 'Enter' para continuar "
          gets
      end
    end
    puts "\n>>> ¡Gracias por utilizar Ruby Agenda!"
    print "\n"
  end
end 

agenda = AgendaApp.new

agenda.run