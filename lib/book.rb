class Book < Product
  attr_accessor :name, :genre, :author

  def initialize(params)
    super
    @name = params[:name]
    @genre = params[:genre]
    @author = params[:author]
  end

  def self.from_file(path)
    film = File.open(path, 'r').readlines(chomp: true)
    new(name: film[0],
        genre: film[1],
        author: film[2],
        price: film[3].to_i,
        amount: film[4].to_i)
  end

  def to_s
    puts "Книга «#{@name}», #{@genre}, автор — #{@author}, #{@price} руб. (осталось #{@amount})"
  end
end
