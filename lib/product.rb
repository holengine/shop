class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
