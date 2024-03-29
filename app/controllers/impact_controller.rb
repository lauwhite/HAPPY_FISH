class ImpactController < ApplicationController
  def index
    if MyFish.where(alive: true, user_id: current_user.id).empty?
      redirect_to fishes_path
    else

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

    @timeline = JSON.parse(open("https://apiv3.iucnredlist.org/api/v3/species/history/id/#{red_list_id}?token=#{token}").read)["result"]

    @country_info_raw = JSON.parse(open("https://apiv3.iucnredlist.org/api/v3/species/countries/id/#{red_list_id}?token=#{token}").read)["result"]
        @country_info = [['Country', 'Status']]
        country_attibute_helper = {
          "Native" => 3,
          "Reintroduced" => 2,
          "Regionally Extinct" => 1
        }
    @country_info_raw.each do |country|
        helper_array = [country["code"], country_attibute_helper[country['distribution_code']]]
        @country_info << helper_array
    end

    url = "https://apiv3.iucnredlist.org/api/v3/taxonredirect/#{red_list_id}"
    url = "https://apiv3.iucnredlist.org/api/v3/taxonredirect/61608"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.featherlight__gallery img')

  end
end
end
