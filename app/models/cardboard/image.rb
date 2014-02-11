module Cardboard
  class BlogImage < ActiveRecord::Base
    belongs_to :post, class_name: "BlogPost"
  end
end
