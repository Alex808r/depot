class User < ApplicationRecord
  #Мы проверяем наличие и уникальность имени (то есть в базе данных не должно быть повторяющихся имен)
  validates :name, presence: true, uniqueness: true

  #has_secure_password заставляет Rails проверить совпадение двух паролей.
  # Эта строка была добавлена потому,
  # что при создании временной платформы вы указали password:digest.
  # rails generate scaffold User name:string password:digest
  has_secure_password

end
