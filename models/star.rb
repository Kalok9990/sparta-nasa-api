class Star

  # Creates instance variables and also makes them visible and editable outside the object.
  attr_accessor :id, :title, :info, :image

  # Save is an instance method that we can use to create or update a post
  def save
    # Assign the Postgre connect to variable
    conn = Star.open_connection
    # If the Post instance has an it means it already exists so we are going to update an existing record
    if(self.id)
      sql = "UPDATE star SET title='#{self.title}', info='#{self.info}', image='#{self.image}' WHERE id = #{self.id}"
    # If the star has no id this means the star is new and needs creating
    else
      sql = "INSERT INTO star (title, info, image) VALUES ('#{self.title}', '#{self.info}','#{self.image}')"
    end
    # Execute the sql in Postgres
    conn.exec(sql)
  end

  # Open connection is Class method that we will use to open a connection the Postgres database. This is not tied to instance of a class but to the class itself
  def self.open_connection
    # Assign the Postgre connect to variable
    conn = PG.connect(dbname: "constellations")
  end

  # Class method the get all our star from the db
  def self.all
    # Assign the Postgre connect to variable
    conn = self.open_connection
    # SQL statement to select our stars and order them
    sql = "SELECT id,title,info,image FROM star ORDER BY id DESC"
    # Execute the sql in Postgres
    results = conn.exec(sql)
    # Create our formatted object by mapping through it and using our hydrate method to get the structure correct
    stars = results.map do |star|
      self.hydrate(star)
    end
  end

  # Class method the will retrieve one post from the db
  def self.find(id)
    # Assign the Postgre connect to variable
    conn = self.open_connection
    # SQL statement to select one post and limit to one
    sql = "SELECT * FROM star WHERE id =#{id} LIMIT 1"
    # Execute the sql in Postgres
    stars = conn.exec(sql)
    # Create our formatted object by passing it through our hydrate method to get the structure correct
    star = self.hydrate(stars[0])
    # Return the post
    star
  end

  # A class method to destroy a post from the DB
  def self.destroy(id)
    # Assign the Postgre connect to variable
    conn = self.open_connection
    # SQL statement to delete one post with the id we passed in
    sql = "DELETE FROM star WHERE id = #{id}"
    # Execute the sql in Postgres
    conn.exec(sql)
  end

  # Hydrate is Class method that we can use to format our data that we get back from the PG gem. The PG gem returns the data as a weird object type called PG:Result.
  def self.hydrate(star_data)
    # Create an instace of a post
    star = Star.new
    # Set the instance variables to be the ones from the PG:Result object so we can use them later in our templates
    star.id = star_data['id']
    star.title = star_data['title']
    star.info = star_data['info']
    star.image = star_data['image']
    # Return the star
    star
  end
end
