class Product < ActiveRecord::Base

  validates_presence_of :title, :highlight, :description, :image_url
  validates_numericality_of :price
  
  validate :price_must_be_at_least_a_cent
  
  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
    end
    
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with     =>  %r{\.(gif|jpg|png)$}i,
                      :message  =>  'must be a URL for GIF, JPG ' +
                                    'or PNG image.(gif|jpg|png)'

end
