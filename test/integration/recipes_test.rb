class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "Ichnos", email: "ichnos@example.com")
    @recipe = Recipe.create(name: "Risotto ai funghi", description: "Una gustosa ricetta con i porcini protagonisti", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Pollo al curry", description: "Pollo a pezzetti, tanta cipolla ad anelli e curry a volontà")
    @recipe2.save
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
  
end
