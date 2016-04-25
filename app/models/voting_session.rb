class VotingSession < ActiveRecord::Base

  acts_as_voter

  def self.find_or_create_voting_session(ip)
    self.find_by ip: ip || self.create(ip: ip)
  end
end
