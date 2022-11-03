class Book < Product
  attr_accessor :name, :genre, :author

  def initialize(params)
    super
    @name = params[:name]
    @genre = params[:genre]
    @author = params[:author]
  end

  def self.from_file(path)
    film = File.open(path.to_s, 'r')
    new(name: film.readline(chomp: true), genre: film.readline(chomp: true), author: film.readline(chomp: true),
        price: film.readline(chomp: true).to_i, amount: film.readline(chomp: true).to_i)
  end

  def to_s
    puts "Книга «#{@name}», #{@genre}, автор — #{@author}, #{@price} руб. (осталось #{@amount})"
  end
end
