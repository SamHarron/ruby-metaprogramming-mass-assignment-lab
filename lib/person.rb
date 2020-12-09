class Person
    def initialize(attributes)
      attributes.each do |key, value| 
        self.class.attr_accessor(key)
#The ruby .send method then calls the 
#method name that is the key’s name, 
#with an argument of the value. 
#In other words: self.send(key=, value) 
        self.send(("#{key}="), value)
    end
  end
end

# The Below class works but it is not a 
# flexible as the above class. 

#class Person
  #attr_accessor :name, :birthday, :hair_color, :eye_color, :height, :weight, :handed, :complexion, :t_shirt_size, :wrist_size, :glove_size, :pant_length, :pant_width
  #def initialize(attributes=nil)
    #if attributes
      #attributes.each do |k,v|
        #self.send("#{k}=", v)
      #end
    #end
  #end
#end
  

sam_attributes = {name: "Sam", 
birthday: "July 13th", 
hair_color: "Blonde", 
t_shirt_size: "XL", 
handed: "Right Handed"}

sam = Person.new(sam_attributes)
puts sam.name
puts sam.birthday

puts sam.t_shirt_size
puts sam.handed
sam.send("hair_color=", "Brown")
puts sam.hair_color

susan_attributes = {name: "Susan", 
height: "5'11\"", 
eye_color: "Green",
married: "No",
handed: ""}

susan = Person.new(susan_attributes)
puts susan.name
puts susan.height
puts susan.eye_color
puts susan.married
susan.handed = "Left handed"
puts susan.handed
susan.send("name=", "Sophie")
puts susan.name
