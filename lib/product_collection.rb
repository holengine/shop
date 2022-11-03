class ProductCollection
  TYPES = {
    film: { dir: 'films', class: Film },
    book: { dir: 'books', class: Book },
    discs: { dir: 'discs', class: Disk }
  }.freeze

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(path)
    products = []
    TYPES.each do |_type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{path}/#{product_dir}/*.txt"].each do |file_path|
        products << product_class.from_file(file_path)
      end
    end
    new(products)
  end

  def to_a
    @products
  end

  def sort(params)
    case params[:by]
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    when :name
      @products.sort_by!(&:name)
    end

    @products.reverse! if params[:order] == :rev
    self
  end
end
