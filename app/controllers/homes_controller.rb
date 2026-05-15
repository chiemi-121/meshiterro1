class HomesController < ApplicationController

 allow_unauthenticated_access only: [:about]
  def top
    render plain: "トップページ表示テスト"
  end
  def about
  end

end
