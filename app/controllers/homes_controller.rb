class HomesController < ApplicationController
 allow_unauthenticated_access only: [:about]
  def top
  end
  def about
  end

end
