class ImpactController < ApplicationController
  def index
    @my_fish = current_user.my_fishes.find_by(alive: true).fish
    red_list_id = @my_fish.red_list_id
    token = ENV["IUCN_API_TOKEN"]
    fish = JSON.parse(open("https://apiv3.iucnredlist.org/api/v3/species/id/#{red_list_id}?token=#{token}").read)
    fish_threats_raw = JSON.parse(open("https://apiv3.iucnredlist.org/api/v3/threats/species/id/#{red_list_id}?token=#{token}").read)
    fish_threats = []
    fish_threats_raw["result"].each do |threat|
      fish_threats << threat["title"]
    end
    fish_info = fish["result"].first
    @status = EndangeredStatus.find(@my_fish.endangered_status_id).status
    @population_trend = fish_info["population_trend"]
    @threats = fish_threats
  end
end
