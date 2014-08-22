# Sitemap file exported to public/sitemap.xml.gz
#
# Generate sitemap using Rake: rake sitemap:refresh
#
# When testing on development server use without ping: rake sitemap:refresh:no_ping
#
# To generate uncompressed XML add compress: false as a Sitemap.create argument.

SitemapGenerator::Sitemap.default_host = "http://winnipegelection.ca"

SitemapGenerator::Sitemap.create do
  Page.find_each do |page|
    add page.friendly_path,
        lastmod: page.updated_at,
        priority: 0.5,
        changefreq: 'weekly'
  end

  Person.find_each do |person|
    if person.most_recent_election.is_active
      priority = 0.9
      changefreq = 'daily'
    else
      priority = 0.7
      changefreq = 'yearly'
    end

    add person.friendly_path,
        lastmod: person.updated_at,
        priority: priority,
        changefreq: changefreq
  end

  ElectoralRace.includes(:election, region: :region_type).each do |electoral_race|
    if electoral_race.election.is_active
      priority = 0.8
      changefreq = 'daily'
    else
      priority = 0.6
      changefreq = 'yearly'
    end
    add electoral_race.friendly_path,
        lastmod: electoral_race.updated_at,
        priority: priority,
        changefreq: changefreq
  end
end
