require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    #Четыре добавленные нами строки кода заглядывают в HTML-код,
    # который возвращается при использовании нотации селекторов CSS
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 3
    assert_select 'h2', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end

=begin
Если вы заметили, тип теста, выполняемого методом assert_select(),
изменяется на основе типа его второго аргумента.
Если это число, оно будет считаться количеством.
Если это строка, она будет рассматриваться как ожидаемый результат.
Еще один полезный тип теста вызывается регулярным выражением,
использованным в нашем последнем утверждении.
Мы проверяем наличие цены, имеющей значение, состоящее из знака доллара,
за которым следует любое число (по крайней мере, одно), запятые или цифры,
за которыми следует десятичная точка, после которой стоят две цифры.
=end