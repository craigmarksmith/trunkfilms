class StaticPagesController < ApplicationController
  before_filter :assign_title
  def assign_title
    @title = action_name.humanize.titleize
  end
end