class Disk < Product
  attr_accessor :name, :author, :genre, :year

  def initialize(params)
    super
    @name = params[:name]
    @author = params[:author]
    @genre = params[:genre]
    @year = params[:year].to_i
  end

  def self.from_file(path)
    disk = File.open(path, 'r').readlines(chomp: true)
    new(name: disk[0],
        author: disk[1],
        genre: disk[2],
        year: disk[3],
        price: disk[4].to_i,
        amount: disk[5].to_i)
  end

  def to_s
    puts "Альбом #{@author}-«#{@name}», #{@genre}, #{@year}, #{@price} руб. (осталось #{@amount})"
  end
end
