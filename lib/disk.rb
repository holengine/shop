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
    disk = File.open(path.to_s, 'r')
    new(name: disk.readline(chomp: true), author: disk.readline(chomp: true), genre: disk.readline(chomp: true),
        year: disk.readline(chomp: true), price: disk.readline(chomp: true).to_i, amount: disk.readline(chomp: true).to_i)
  end

  def to_s
    puts "Альбом #{@author}-«#{@name}», #{@genre}, #{@year}, #{@price} руб. (осталось #{@amount})"
  end
end
