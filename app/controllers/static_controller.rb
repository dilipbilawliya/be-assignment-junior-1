class StaticController < ApplicationController
  before_action :set_friends, only: [:dashboard, :person]
  
  def dashboard
    @expense = Expense.new
    @expense.expense_splits.new
  end

  def person
    @user = User.find(params[:id])
    redirect_to root_path unless user_valid?(@user)
    @expense_splits = @user.expense_splits
  end

  private

  def set_friends
    @friends = current_user.all_friends
    @not_friends = current_user.not_friends
  end

  def user_valid?(user)
    user.in?([current_user] + @friends)
  end
end
