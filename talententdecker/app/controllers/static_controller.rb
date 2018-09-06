class StaticController < ApplicationController

  def index
    @team = [
      {name: "Nizar Hegazy", title: "Recruitment Specialist", image: "nhegazy.jpg", facebook: "nhegazy", linkedin: "nhegazy"},
      {name: "Mohamed Moursy", title: "Business Development", image: "mmoursy.jpg", facebook: "mmoursy", linkedin: "mmoursy"},
      {name: "Bassem Hefny", title: "Technology Director", image: "bhefny.jpg", facebook: "bhefny", linkedin: "bhefny"},
    ]
    @year_footer = GlobalSetting.find_by(key: 'year_footer').try(:value)
  end

end
