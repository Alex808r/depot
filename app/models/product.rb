class Product < ApplicationRecord

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true

  validates :image_url, allow_blank: true,
    format:  {with: %r{\.(gif|jpg|png)\z}i,
    message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
  }

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates :title, length: { minimum: 10, message: "10 символов минимум" }
  #Ключ проверки приемлемости :length проверяет длину свойства модели.
  # Добавьте эту проверку приемлемости к модели Product,
  # чтобы проверить, что в названии товара присутствует не менее 10 символов


  #Здесь объявляется, что у товара много товарных позиций,
  #и определяется подключаемый метод по имени ensure_not_referenced_by_any_line_item().
  # Подключаемым называется такой метод, который Rails вызывает автоматически в определенный
  # момент жизни объекта. В данном случае метод будет вызван перед тем,
  # как Rails попытается удалить строку в базе данных.
  #Если подключаемый метод возвращает false, строка не будет удалена.
  has_many :orders, through: :line_items
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
    errors.add(:base, 'существуют товарные позиции')
    throw :abort
    end
  end
end

