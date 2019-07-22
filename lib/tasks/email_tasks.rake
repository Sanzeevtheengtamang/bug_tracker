desc 'send digest email'
task send_digest_email: :environment do
  # ... set options if any 
  User.find_each do |user|
      # UserMailer.with(user: user).weekly_summary.deliver_now
      UserMailer.digest_email_update(user).deliver!
  end
end