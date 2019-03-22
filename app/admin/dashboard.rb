ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Coin follow rate' do
          ul do
            Coin.all.map do |coin|
              follow_percentage = User.count.zero? ? 0 : coin.portfolios.count * 100 / User.count
              li "#{coin.name}: #{follow_percentage} %"
            end
          end
        end
      end
      column do
        panel 'Most popular coin' do
          most_users_following = 0
          coin_name = ''
          Coin.all.each do |coin|
            coin_followers = coin.portfolios.where(follow: true).count
            if coin_followers > most_users_following
              most_users_following = coin_followers
              coin_name = coin.name
            end
          end
          para "#{coin_name} has #{pluralize(most_users_following, 'follower')}."
        end
      end
    end
  end
end
