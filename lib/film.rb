class Film < Product
  attr_accessor :name, :year, :director

  def initialize(params)
    super
    @name = params[:name]
    @year = params[:year].to_i
    @director = params[:director]
  end

  def self.from_file(path)
    film = File.open(path, 'r').readlines(chomp: true)
    new(name: film[0],
        director: film[1],
        year: film[2].to_i,
        price: film[3].to_i,
        amount: film[4].to_i)
  end

  def to_s
    puts "Фильм «#{@name}», #{@year}, реж. #{@director}, #{@price} руб. (осталось #{@amount})"
  end
end
