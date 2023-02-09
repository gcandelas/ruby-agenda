class Agenda

  attr_accessor :contacts

  def initialize
    @contacts = Hash.new()
  end

  def add_contact(name, phone)
    @contacts.store(name, phone)
  end

  def show_contact(name)
    if @contacts.has_key?(name)
      puts ">>> #{name}: #{@contacts[name]}"
    else
      puts ">>> El contacto '#{name}' no existe"
    end
  end

  def show_all
    if @contacts.empty?
      puts ">>> No hay contactos para mostrar"
    else 
      @contacts.each do |name, phone|
        puts "    - #{name}: #{phone}"
      end
    end
  end

  def delete_contact(name)
    if @contacts.has_key?(name)
      @contacts.delete(name)
      puts "\n>>> El contacto '#{name}' ha sido eliminado"
    else
      puts "\n>>> El contacto '#{name}' no existe"
    end
  end

  def delete_all
    @contacts.clear
  end

  def no_contacts
    if @contacts.empty?
      return true
    else
      false
    end
  end
  
end

