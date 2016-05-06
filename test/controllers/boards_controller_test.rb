require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index #Testons la page index par la requête GET et à l'action index, 
    assert_response :success #puis faire en sorte de recevoir un code de statut de « succès » en réponse."
    assert_select "title", "Board" # test <title> de la page
  end
end

class BoardsTest < ActiveSupport::TestCase
	def setup
		@board = Board.new(title: "Board Example")
	end

	test "should be valid" do
		assert @board.valid?
	end

	test "title should be present" do
		@board.title = "     "
		assert_not @board.valid?
	end

	test "title should not be too long" do
		@board.title = "a" * 51
		assert_not @board.valid?
	end

	test "title should be unique" do
    duplicate_board = @board.dup # On crée une duplication de @board que l'on injecte dans la variable duplicate_board
    duplicate_board.title = @board.title.upcase
    @board.save	
    assert_not duplicate_board.valid? # Comme on réfuse la duplication duplicate_board devrait etre faux
  end
end