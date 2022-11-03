class Film < Product
  attr_accessor :name, :year, :director

  def initialize(params)
    super
    @name = params[:name]
    @year = params[:year].to_i
    @director = params[:director]
  end

  def self.from_file(path)
    film = File.open(path.to_s, 'r')
    new(name: film.readline(chomp: true), director: film.readline(chomp: true), year: film.readline(chomp: true).to_i,
        price: film.readline(chomp: true).to_i, amount: film.readline(chomp: true).to_i)
  end

  def to_s
    puts "Фильм «#{@name}», #{@year}, реж. #{@director}, #{@price} руб. (осталось #{@amount})"
  end
end
