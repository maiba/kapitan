if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'packages').blank?
      user.plugins.create(:name => 'packages',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end