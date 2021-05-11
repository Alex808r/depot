class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end

#Запомнить, где именно нужно постить инструкцию belongs_to, несложно:
# если у таблицы есть внешние ключи,
# соответствующая модель должна иметь для каждого из них инструкцию belongs_to.