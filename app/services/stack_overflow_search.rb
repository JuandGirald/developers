class StackOverflowSearch
  def self.get_users(page, id)
    developers = []
    response = HTTParty.get("https://api.stackexchange.com/2.2/users?page=#{page}&pagesize=100&order=desc&sort=reputation&site=stackoverflow")
    users = response.parsed_response["items"]
    users.each do |user|
      developers << {
        user_id: user['user_id'],
        name:    user['display_name'],
        age:     user['age'],
        location:    user['location'],
        accept_rate: user['accept_rate'],
        website_url: user['website_url'],
        link:    user['link'],
        reputation:  user['reputation'],
        reputation_change_year:    user['reputation_change_year'],
        reputation_change_quarter: user['reputation_change_quarter'],
        reputation_change_month:   user['reputation_change_month'],
        reputation_change_week:    user['reputation_change_week'],
        bronze_badges: user['badge_counts']['bronze'],
        silver_badges: user['badge_counts']['silver'], 
        gold_badges:   user['badge_counts']['gold']
      }
    end
    developers
  end
end