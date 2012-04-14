class AdminController < ApplicationController

  before_filter :botar
  def botar
    raise StandardError, "bien"
  end
end
