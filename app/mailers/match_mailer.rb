class MatchMailer < ActionMailer::Base
  default from: "from@example.com"


  def from_employer_to_user(employer, user)
  	name_arr = user.name.split(' ')


  	mail(to: user.email, from: employer.email, subject: "#{user.profile.name.capitalize!}, we matched on MRKT "  )
  end

  def from_user_to_employer(user,employer)
  	
  	mail(to: user.email, from: employer.email, subject: "You matched with #{user.profile.name} on MRKT"  )
  end




end
