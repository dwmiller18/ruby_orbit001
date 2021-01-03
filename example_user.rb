class User
  # This creates getter and setter methods
  attr_accessor :name, :email

  def initialize(attributes = {})
    # Instance variables always begin with the @ symbol
    @name = attributes[:name]
    @email = attributes[:email]
  end

  # This will create a formatted email address using string interpolation
  # These are available here because they are defined in initialize
  def formatted_email
    "#{@name} <#{@email}>"
  end
end



# example = User.new
# example.name ==> nil
# example.name = "Dustin Miller"
# example.email = "dustin@example.com"
# example.formatted_email ==> "Dustin Miller <dustin@example.com>"
#
# user = User.new(name: "Mary", email: "mary@example.com")
# user.formatted_email ==> "Mary <mary@example.com>"