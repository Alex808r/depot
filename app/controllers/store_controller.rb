class StoreController < ApplicationController
  #контроллер для работы на стороне покупателя

  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title) # order(:title) - сортировка в алфавитном порядке по наименованию.
                                      # (:title - название столбца из базы даннных)
  end
end
