def print_csv data
  data.each do |c|
    print c.name
    print ','
    print c.email if c.email?
    print ','
    print c.phone_number if c.phone_number? 
    puts
  end
end

namespace :csv do
  task :council => :environment do
    candidates = Candidate.all(:include => :ward, :conditions => ["wards.ward_type = ?",'Civic'])
    print_csv candidates
  end
 task :mayor => :environment do
    candidates = Candidate.all(:include => :ward, :conditions => ["wards.ward_type = ?",'Mayoral'])
    print_csv candidates
 end
 task :trustee => :environment do
    candidates = TrusteeCandidate.all
    print_csv candidates
 end
end
