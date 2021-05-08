class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # order(:title) - сортировка в алфавитном порядке по наименованию.
                                      # (:title - название столбца из базы даннных)
  end
end
