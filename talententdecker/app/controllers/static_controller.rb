class StaticController < ApplicationController

  def index
    @year_footer = GlobalSetting.find_by(key: 'year_footer').try(:value)
  end

end
