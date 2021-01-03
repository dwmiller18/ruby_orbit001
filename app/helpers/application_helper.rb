module ApplicationHelper
  # Returns a full title on a per page basis

  # Method definition with optional argument
  def full_title(page_title = ' ')
    # Creating and assigning a string variable
    base_title = "Orbit Feedback Application"

    # Boolean test
    if page_title.empty?
      # Implicit return
      base_title
    else
      # String concatenation
      page_title + " | " + base_title
    end
  end
end
