RegionType.destroy_all
Region.destroy_all
Person.destroy_all
Page.destroy_all
Election.destroy_all
ElectoralRace.destroy_all
Candidacy.destroy_all
NavigationHeading.destroy_all
ImageMap.destroy_all

ImageMap.create!([
  {name: 'City Council'}
])

home_nav_heading, candidates_nav_heading, about_nav_heading = NavigationHeading.create!([
  {name: 'Home', url: '/', display_order: 1.0},
  {name: 'Candidates', url: '', display_order: 2.0},
  {name: 'About', url: '', display_order: 3.0}
])

mayoral, school_division, council_ward, school_ward = RegionType.create!([
  {name: "Mayoral", description: ""},
  {name: "School Division", description: ""},
  {name: "Council Ward", description: ""},
  {name: "School Ward", description: ""}
])

city_of_winnipeg = Region.create!(name: "City of Winnipeg", start_date: "1972-01-01", end_date: nil, region_type: mayoral, region_id: nil, seats: 1)

wpg_2010, wpg_by_2011, wpg_2014 = Election.create!([
  {name: "2010 Winnipeg Civic Election", is_active: false, is_by_election: false, writ_date: "2010-09-21", election_date: "2010-10-27"},
  {name: "2011 Winnipeg Civic By-Election", is_active: false, is_by_election: true, writ_date: "2011-10-21", election_date: "2011-11-26"},
  {name: "2014 Winnipeg Civic Election", is_active: true, is_by_election: false, writ_date: "2014-09-16", election_date: "2014-10-22"}
])

mayoral_wpg_2014 = ElectoralRace.create!(region: city_of_winnipeg, election: wpg_2014, polygon: "", seats_to_fill: 1, navigation_heading: candidates_nav_heading)

people = Person.create!([
  {name: "Brian Bowman", office_address: "", phone_number: "", email: "", image: nil, website: "http://www.bowmanforwinnipeg.ca/", council_site: "", facebook: "https://www.facebook.com/brian.bowman.5268", twitter: "https://twitter.com/BrianBowmanWpg", youtube: "https://www.youtube.com/channel/UCt8oHawY8e_NPJ6DzQ2qDNQ", linkedin: ""},
  {name: "Michel Fillion", office_address: "", phone_number: "", email: "", image: nil, website: "", council_site: "", facebook: "", twitter: "", youtube: "", linkedin: ""},
  {name: "Paula Havixbeck", office_address: "", phone_number: "", email: "paulaformayor@gmail.com", image: nil, website: "", council_site: "http://paulahavixbeck.com", facebook: "", twitter: "", youtube: "", linkedin: ""},
  {name: "Gord Steeves", office_address: "", phone_number: "204-415-0888", email: "vote@gordsteeves.ca", image: nil, website: "http://www.gordsteeves.ca", council_site: "", facebook: "https://www.facebook.com/gord.steeves", twitter: "https://twitter.com/gordsteeves", youtube: "", linkedin: ""},
  {name: "Michael Vogiatzakis", office_address: "", phone_number: "", email: "", image: nil, website: "", council_site: "", facebook: "https://www.facebook.com/profile.php?id=100008344472161&fref=ts", twitter: "", youtube: "", linkedin: ""},
  {name: "Gordon Warren", office_address: "", phone_number: "", email: "gordonwarren77@gmail.com", image: nil, website: "http://gordonwarren77.blogspot.ca/2014/05/warren-for-mayor.html", council_site: "", facebook: "", twitter: "http://twitter.com/gordonwarren77", youtube: "", linkedin: ""}
])

people.each {|person| Candidacy.create!({questionnaire: "", end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: mayoral_wpg_2014}) }

Page.create!([
  {title: "Press Mentions", content: "**RRC Projector** - October 25th, 2010\r\n\r\nTwo Red River College instructors hope their election website will encourage more students to show up at the polls on Oct. 27.\r\n\r\n**Winnipeg Free Press** - [October 23rd, 2010](http://www.winnipegfreepress.com/local/record-number-of-voters-itching-to-cast-ballot-105589158.html)\r\n\r\nInformation-technology instructors Kyle Geske and Jody Gills created the non-profit website winnipegelection.ca in July to provide voters with more information about mayoral, council and school-trustee candidates.\r\n\r\nAs of Friday, their repository included 1,082 election articles, compiled form a variety of Winnipeg media websites, as well as 83 questionnaires completed by candidates.\r\n\r\n**Winnipeg Filipino Journal** - October 22nd, 2010\r\n\r\nWinnipeg's newest citizen election website [WinnipegElection.ca](http://winnipegelection.ca) sent questionnaires to all trustees.\r\n\r\n**CBC TV News Manitoba** - [October 19th, 2010](http://www.cbc.ca/video/#/News/Local_News/Manitoba/1317902896/ID=1619825269)\r\n\r\nCo-Founder Jody Gillis was featured as part of a story on the effect of social media on election campaigns.\r\n\r\n**CBC TV News Manitoba** - [October 4th, 2010](http://www.cbc.ca/canada/manitoba/manitobacivicvotes2010/story/2010/10/03/man-advance-voting-civic-election.html)\r\n\r\nFeatured as part of a story on [advanced voting for the 2010 Winnipeg election](http://www.cbc.ca/canada/manitoba/manitobacivicvotes2010/story/2010/10/03/man-advance-voting-civic-election.html).\r\n\r\n**CBC Radio Noon Winnipeg** - [October 4th, 2010](http://www.cbc.ca/radionoonmanitoba/)\r\n\r\nCo-founder of [Winnipegelection.ca](http://winnipegelection.ca) Kyle Geske was interviewed by [Marilyn Maki of Radio Noon](http://www.cbc.ca/radionoonmanitoba/). [Listen to a portion of the interview](http://www.cbc.ca/manitoba/eal/media/oct15_2010.mp3) (as featured in a [CBC EAL](http://www.cbc.ca/manitoba/eal/2010/10/lesson-59-where-are-the-voters.html) podcast).\r\n\r\n**The Uniter** - [September 16th, 2010](http://uniter.ca/view/4558)\r\n\r\nAnyone serious about voting in the upcoming election will want to check out [www.winnipegelection.ca](http://winnipegelection.ca), a website that features the latest news, information about previous civic elections and info on how you can determine what your ward is if you don’t already know.\r\n\r\n**Uptown Magazine** - [September 9th, 2010](http://www.uptownmag.com/diversions/mobile/Vote-You-have--no-excuse-not-to--102463749.html)\r\n\r\nRecently launched, [Winnipegelection.ca](http://winnipegelection.ca) is a new online resource for Winnipeggers looking to get up to speed before heading to the polls. Along with gathering election news, the site also offers information on candidates for city council, linking you to their websites, email addresses, Facebook pages, Twitter accounts and, in some cases, their YouTube feeds.", permalink: "press-mentions", show_title: true},
  {title: "About Us", content: "## About Us\r\n\r\nWinnipegElection.ca is a *citizen created* resource for civic elections in Winnipeg, Manitoba.\r\n\r\nOur site is volunteer-run and was created in the spirit of openness, community and accountability.\r\n\r\n<br/>\r\n\r\n## Open Democracy Manitoba\r\n\r\nThe site was built by the volunteer efforts of Kyle Geske, Jody Gillis, Andrew Burton and Ken Harasym. Together these four friends founded [Open Democracy Manitoba](http://opendemocracymanitoba.ca), the community organization that maintains this website.\r\n\r\nThis website was originally built for the Winnipeg general election in October of 2010. In the fall of 2011 we created a similar website for the [Manitoba provincial election](http://manitobaelection.ca).\r\n\r\n<br/>\r\n\r\n## Our Mission\r\n\r\nOur mission is to empower voters, helping them learn about the roles, issues, and visions of our representatives in order have a more accountable and respectful democracy.\r\n\r\n<br/>\r\n\r\n## Contact?\r\n\r\nEmail: <winnipeg.election@gmail.com>\r\n\r\nTwitter: [@WpgElection](http://twitter.com/WpgElection)\r\n\r\nFacebook: [Winnipeg Election Fan Page](http://www.facebook.com/pages/Winnipeg-Election/145495908793867)\r\n\r\n<br/>\r\n\r\n*Learn to Question. Question to Learn.*", permalink: "about-us", show_title: true, navigation_heading: about_nav_heading},
  {title: "Press Releases", content: "\r\n**WinnipegElection.ca Returns for 2011 By-Election** - [November 23, 2011](/press/WinnipegElection2011By-ElectionPressRelease.pdf) ![pdf](/images/pdf.png)\r\n\r\nWinnipegElection.ca is back. The citizen-built election resource was updated earlier this month in preparation for this Saturday’s by-election. The site, originally built by Open Democracy Manitoba for the 2010 Winnipeg general election, continues to empower and educate local voters about the roles, issues, and visions of our representatives. \r\n\r\nThe WinnipegElection.ca website features interactive ward maps, ward statistics and historical information about past elections, along with profiles of the current council and school trustee candidates. Twenty-one of the twenty-five candidates running in the November 26th by-election have replied to the WinnipegElection.ca platform questionnaire. Candidate questionnaire responses are featured on the site, along with links to their web pages, email addresses, and social media accounts.\r\n\r\nCivic by-elections are typically plagued by low voter turn-out. In response to this challenge, the members of Open Democracy Manitoba are running a social-media campaign on Twitter and Facebook, spreading information about this by-election in hopes of increasing voter turnout.\r\n\r\n**Candidates and Voters Embrace Winnipeg Election Website** - [October 18, 2010](/press/WinnipegElectionCa_Oct_18_2010_final.pdf) ![pdf](/images/pdf.png)\r\n\r\nWinnipegElection.ca is pleased to announce its continued success in providing the citizens of Winnipeg with a useful resource for making informed decisions about the October 2010 civic election. Traffic on the website is at an all time high and the response to their all candidate questionnaire is exceeding\r\nexpectations.\r\n\r\n\"We're excited to see such engagement by candidates\" says Jody Gillis, one of the founders of the site. \"Over sixty-four candidates have replied to our questionnaire and this number is growing daily.\"\r\n\r\nWith 150,000+ page views and 15,000+ unique visitors, the locally developed website is growing rapidly by accumulating accurate and up-to-date information about the upcoming election. \"These stats tell us that voters are eager to research their candidates online.\" says co-founder Kyle Geske. \"With only nine days until the election, we’re expecting an acceleration of activity.\"\r\n\r\n**Citizen Created Election Website Attracts Attention** - [September 23, 2010](/press/WinnipegElectionCaAttractsAttention-final.pdf) ![pdf](/images/pdf.png)\r\n\r\nFrustrated by the lack of information about their local candidates during the 2006 Winnipeg civic election, city residents and cousins Kyle Geske and Jody Gillis decided to build an online election resource for their fellow citizens. Geske and Gillis, instructors at Red River College, spent a large part of their spare time during the past two months working on a website for the upcoming Winnipeg civic election. Their work has paid off. Their WinnipegElection.ca website has become a recognized source of information for this October’s election.\r\n\r\n\"We are concerned about voter apathy,\" says Geske when asked about site goals. \"We believe that open and accessible information fosters interest. The strength of our government depends on informed voters.\"\r\n\r\nThe site features interactive ward maps, ward statistics, historical information about past elections, and a calendar of election related events. Candidates are listed along with links to their web pages, email addresses, Facebook fan pages and Twitter feeds. News articles that mention candidates are also linked providing up to date information from a variety of media sources.\r\n\r\nAs the site grows in popularity, it’s not just citizens who are taking notice. \"We have city council and mayoral hopefuls contacting us to provide their photos and social media links,\" says Gillis. \"Engaging citizens online evens the playing field for all candidates.\" \r\n\r\nNow that nominations have been finalized, Geske is working on adding a school trustee section to the site. Meanwhile, Gillis is preparing a candidate questionnaire.", permalink: "press-releases", show_title: true},
  {title: "Frequently Asked Questions", content: "## Frequently Asked Questions\r\n\r\n* [How are the latest news stories collected?](#news)\r\n* [How can candidate information be updated?](#update_info)\r\n* [How do you decide what candidate information to list?](#candidate_info)\r\n* [How can a debate or forum be listed on your calendar?](#debates)\r\n* [How can a blog or website be added to your online resources section?](#resources)\r\n* [How popular is your website?](#google)\r\n* [How did you make this website?](#website)\r\n* [Are the operations of your website transparent?](#open)\r\n* [What process did you follow for the candidate questionnaires?](#questionnaire)\r\n\r\n<br/>\r\n\r\n<a name=\"news\"></a>\r\n## How are the [latest news stories](http://winnipegelection.ca/news_articles/latest) collected?\r\n\r\nArticles are automatically gathered from [Google News](http://news.google.ca) by searching for the full names of the candidates in the upcoming Winnipeg municipal election. The search location is set to Winnipeg using the [advanced search properties](http://news.google.ca/news/advanced_news_search). \r\n\r\nIf a specific news article is not showing up in our system it is because it has not been index by Google News. Because our news gathering is an automated process we cannot manually add news stories to a ward or candidate page. \r\n\r\n<br/>\r\n\r\n<a name=\"update_info\"></a>\r\n## How can candidate information be updated?\r\n\r\nCandidates can send us updated photos and information via email: <winnipeg.election@gmail.com>\r\n\r\nEmails should be sent from the email address we have listed for a candidate or the address listed in their election registration/nomination papers.\r\n\r\nWe will do our best to process all updates within 24 hours of their receipt.\r\n\r\n*After October 24th we will no longer be accepting candidate updates. Updates received after this date will not be posted to our site. This deadline exists to ensure that our site remains accurate and consistent during the week of the election.*\r\n\r\n<br/>\r\n\r\n<a name=\"candidate_info\"></a>\r\n## How do you decide what candidate information to list?\r\n\r\n**Email Addresses and Phone Numbers** were found using Google or supplied by candidates. Phone numbers are only listed if they are for a campaign office. Found email addresses are only listed if they are obviously election related (e.g. voteforcandidate@email.com) or if they were found on the candidate's election website or election Facebook page.\r\n\r\n**Websites**: Sites must be election related. Sites have been found using Google or supplied by the candidates. Councillor websites are also listed on the incumbents page.\r\n\r\n**Twitter and YouTube Accounts**: Found using Google or supplied by the candidates.\r\n\r\n**Facebook Pages**: Found by searching Facebook or supplied by candidates. In most cases we will link to candidate \"fan pages\" created specifically for the election. If no fan page exists we will link to Facebook profiles where the wall and info sections are publicly available. Private profiles will be linked to only by candidate request.\r\n\r\n**Photos**: Many were supplied to us directly by candidates. Some photos were found on candidate election websites or public Facebook pages.\r\n\r\n<br/>\r\n\r\n<a name=\"debates\"></a>\r\n## How can a debate or forum be listed on your calendar?\r\n\r\nDebates and forums can be brought to our attention via email: <winnipeg.election@gmail.com>\r\n\r\n<br/>\r\n\r\n<a name=\"resources\"></a>\r\n## How can a blog or website be added to your online resources section?\r\n\r\nEmail us your election related blogs or websites: <winnipeg.election@gmail.com>\r\n\r\nOur criteria is the following: A significant proportion of the blog entries, or a specific section of the blog or website, must relate to information relevant to the Winnipeg civic election. Further, the blog or website will not promote intolerance or hateful views to any identifiable group, or exist solely to promote or discredit a single candidate.\r\n\r\n<br/>\r\n\r\n<a name=\"google\"></a>\r\n## How popular is your website?\r\n\r\nAs of October 8th, 2010 we were the top Google search result for the following searches:\r\n\r\n* [Winnipeg Election](http://www.google.ca/search?q=Winnipeg+Election)\r\n* [Winnipeg Civic Election](http://www.google.ca/search?q=Winnipeg+Civic+Election)\r\n* [Winnipeg Election Candidates](http://www.google.ca/search?q=Winnipeg+Election+Candidates)\r\n* [2010 Winnipeg Election](http://www.google.ca/search?q=2010+Winnipeg+Election)\r\n\r\nPlease note that Google search results may vary depending on your location.\r\n\r\n<br/>\r\n\r\n<a name=\"website\"></a>\r\n## How did you make this website?\r\n\r\nThe website is powered by the following technologies:\r\n\r\n* [Ruby](http://www.ruby-lang.org) for programming.\r\n* [Rails](http://rubyonrails.org/) for the web framework.\r\n* [SQLite](http://www.sqlite.org/) for the database.\r\n* [Apache](http://www.apache.org/) for the web server with [Phusion Passenger](http://www.modrails.com/).\r\n* [Google News]() for the latest news feature.\r\n* [HAML](http://haml-lang.com/) and [SASS](http://sass-lang.com/) for visual structure and design.\r\n\r\n<br/>\r\n\r\n<a name=\"open\"></a>\r\n## Are the operations of your website [transparent](http://en.wikipedia.org/wiki/Transparency_%28behavior%29)?\r\n\r\nThis website was created in the spirit of openness, community, accountability and communication.\r\n\r\nThe source code that powers this website is [available on github](http://github.com/opendemocracymanitoba/winnipegelection). \r\n\r\nThe source code and website data are released free and unencumbered into the public domain.\r\n\r\nSee [our source code license](http://github.com/opendemocracymanitoba/winnipegelection/blob/master/UNLICENSE) for more information.\r\n\r\n<br/>\r\n\r\n<a name=\"questionnaire\"></a>\r\n## What process did you follow for the candidate questionnaires?\r\n\r\nWe sent [a questionnaire](/questionnaire) to all  all mayoral, council and school trustee candidates.\r\n\r\nMayoral and council questionnaires were sent on September 30th, 2010. School trustee questionnaires were sent on October 9th, 2010.\r\n\r\nCandidates were given 200 words to answer each of our five questions. Answers over the 200 word limit were returned for candidate editing.\r\n\r\nAll questionnaires were sent via email. We collected the required email addresses using the city's registration/nomination papers. We tried our best to contact all candidates with unlisted email addresses by phone. \r\n\r\nReplies are posted in batches as they are received. \r\n\r\nAfter October 24th we will no longer accept questionnaire responses. Replies received after this date will not be posted to our site.", permalink: "frequently-asked-questions", show_title: true},
  {title: "Election Information", content: "## Available Information\r\n\r\n* [By-Election Date](#date)\r\n* [What is a General Election?](#general)\r\n* [Find Your Ward](#ward)\r\n* [Find Your Voting Location](#ward)\r\n* [City of Winnipeg Resources](#city)\r\n* [Province of Manitoba Resources](#province)\r\n* [Manitoba School Board Resources](#school_board)\r\n* [Previous Election Results](#results)\r\n\r\n<br/>\r\n\r\n<a name=\"date\"></a>\r\n## Civic By-Election Date\r\n\r\nOn November 26th of 2011 there will be a by-election held for the following city council and school trustee wards:\r\n\r\n* St. Vital Civic Ward\r\n* Winnipeg School Division Ward 1\r\n* Louis Reil School Division Ward 2\r\n\r\n<br/>\r\n\r\n<a name=\"general\"></a>\r\n## What is a General Election?\r\n\r\nWinnipeg holds a general municipal election on the fourth Wednesday of October every four years. \r\n\r\nAll [eligible voters](http://www.winnipeg.ca/clerks/docs/elections/2010Election/voter/eligibility.htm) in the City of Winnipeg are entitled to cast their vote for:\r\n\r\n* The Office of Mayor. \r\n* One Councillor from each of the 15 city wards.\r\n* School Trustees based on the school divisions within the boundaries of the city.  \r\n\r\nOn occasion by-elections are called to fill vacancies for the Office of Mayor, Councillors, or School Trustees.\r\n\r\n<br/>\r\n\r\n<a name=\"ward\"></a>\r\n## Find Your Ward & Voting Location\r\n\r\nTo determine your ward and voting location use [the city of Winnipeg's address look-up tool](http://www.winnipeg.ca/Election/ENG/SelectLocation.asp?SelectActionUrl=AddressDetails.asp%3F).\r\n\r\n<br/>\r\n\r\n<a name=\"city\"></a>\r\n## City of Winnipeg Resources\r\n\r\n* [City of Winnipeg Election FAQ](http://www.winnipeg.ca/clerks/docs/elections/2010election/general/FAQs.htm)\r\n* [Official List of Registered Candidates](http://www.winnipeg.ca/clerks/pdfs/elections/2010Election/List%20of%20Registered%20Candidates.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n* [Official List of Nominated Candidates](http://www.winnipeg.ca/clerks/pdfs/elections/2010Election/List%20of%20Nominated%20Candidates.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n* [Council and School Division Ward Maps](http://www.winnipeg.ca/clerks/docs/elections/2010Election/candidate/wardMaps.htm)\r\n* [Important Election Dates](http://www.winnipeg.ca/clerks/docs/elections/2010election/dates/)\r\n* [Identification Required When Voting](http://www.winnipeg.ca/clerks/docs/elections/2010election/voter/identification.htm)\r\n* [It's Your City. It's Your Vote.](http://www.winnipeg.ca/clerks/docs/elections/2010Election/pdfs/YourCity.pdf) Slideshow ![pdf](/images/pdf.png \"pdf\")\r\n* Registration Information\r\n  * [Mayor](http://www.winnipeg.ca/clerks/docs/elections/2010Election/candidate/mayor.htm)\r\n  * [Council](http://www.winnipeg.ca/clerks/docs/elections/2010Election/candidate/councillor.htm)\r\n  * [School Trustee](http://www.winnipeg.ca/clerks/docs/elections/2010Election/candidate/schoolTrustee.htm)\r\n\r\n<br/>\r\n\r\n<a name=\"province\"></a>\r\n## Province of Manitoba Resources\r\n\r\n* [Municipal and School Board Elections 2010](http://web5.gov.mb.ca/mfas/mfas_elections.aspx)\r\n* [Municipal Candidate’s Guidebook](http://web5.gov.mb.ca/mfas/pdf/candidates_guidebook.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n* [Municipal Election FAQ](http://web5.gov.mb.ca/mfas/elections_faq.aspx)\r\n\r\n<br/>\r\n\r\n<a name=\"school_board\"></a>\r\n\r\n## Manitoba School Board Resources\r\n\r\n* [Manitoba School Board Elections](http://www.mbschoolboards.ca/aboutschoolboards/SchoolBoardElections.htm)\r\n* [School Board FAQ](http://www.mbschoolboards.ca/aboutschoolboards/FAQs.htm)\r\n* [A Guide to School Boards and Trusteeship](http://www.mbschoolboards.ca/aboutschoolboards/documents/A%20guide%20to%20School%20Boards%20and%20Trusteeship%20October%202009.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n\r\n<br/>\r\n\r\n<a name=\"results\"></a>\r\n## Previous Municipal Election Results\r\n\r\n*General Elections:*\r\n\r\n* [2010 Winnipeg General Election](http://www.winnipeg.ca/clerks/docs/elections/2010Election/results/winnipeg.html)\r\n* [2006 Winnipeg General Election](http://www.winnipeg.ca/Clerks/pdfs/elections/2006election/E06Results.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n* [2002 Winnipeg General Election](http://www.winnipeg.ca/clerks/election/election2002/results.htm)\r\n* [1998 Winnipeg General Election](http://www.winnipeg.ca/clerks/election/result.htm)\r\n\r\n*By-Elections:*\r\n\r\n* [2009 Winnipeg By-Election](http://www.winnipeg.ca/clerks/docs/elections/2009by_election/BE09Results.stm) *One Councillor, One School Trustee*\r\n* [2008 Winnipeg By-Election](http://www.winnipeg.ca/clerks/docs/elections/2008by_election/BE08Results.stm) *One School Trustee*\r\n* [2005 Winnipeg By-Election](http://winnipeg.ca/clerks/pdfs/elections/2005by_election/BE05ResultsAll.pdf) ![pdf](/images/pdf.png \"pdf\") *One Councillor*\r\n* [2004 Winnipeg By-Election](http://www.winnipeg.ca/clerks/pdfs/elections/2004by_election/BE04ResultsAll.pdf) ![pdf](/images/pdf.png \"pdf\") *Mayoral Race, Two Councillors, Two School Trustees*\r\n* [2003 Winnipeg By-Election](http://www.winnipeg.ca/clerks/election/election2002/pdfs/ResultReleaseOct2003.pdf) ![pdf](/images/pdf.png \"pdf\") *One School Trustee*\r\n* [1998-2002 Winnipeg By-Elections](http://www.winnipeg.ca/clerks/election/election2002/history.htm#byelec) *One Councillor, Five School Trustees*", permalink: "election-information", show_title: true},
  {title: "Open Data", content: "##Winnipeg Election Open Data 2010\r\n\r\nThese datasets were collected during the Winnipeg 2010 municipal election. \r\n\r\n* [Winnipeg 2010 Civic Ward Polygons](#polygon)\r\n* [City of Winnipeg 2010 Election Results](#2010results)\r\n* [Winnipeg Civic Election Results History](#history)\r\n* [WinnipegElection.ca Source Code](#source)\r\n\r\n<span class=\"small\"><em>Released free and unencumbered into the public domain on [OpenData Day](http://www.opendataday.org/) 2010.</em></span>\r\n\r\n<br/>\r\n\r\n<a name=\"polygon\"></a>\r\n### Winnipeg 2010 Civic Ward Polygons (KML)\r\n\r\nThis [KML](http://code.google.com/apis/kml/documentation/kmlreference.html) document includes mapping polygons for the 15 city-council wards from the 2010 civic election. The provided coordinates can be used with GIS/Mapping tools like [Google Maps and Google Earth](http://code.google.com/apis/kml/documentation/kml_tut.html). \r\n\r\n<p class=\"small\"><strong>Data File</strong>: <a href=\"/data/Winnipeg%202010%20Civic%20Wards.kml\">Winnipeg 2010 Civic Wards.kml</a></p> \r\n\r\n<br/>\r\n\r\n<a name=\"2010results\"></a>\r\n###City of Winnipeg 2010 Election Results (XML)\r\n\r\nThe city of Winnipeg is publicly hosting two XML documents containing the results of the 2010 Winnipeg Municipal Election. \r\n The schema is undocumented. [Send us your schema suggestions](mailto:winnipeg.election@gmail.com).\r\n\r\n<p class=\"small\"><strong>Data Files</strong>: <em>(Mirrored 2010-12-04)</em></p> \r\n \r\n<ul class=\"small\"> \r\n<li><a href=\"/data/WinnipegElectionResults2010.xml\">WinnipegElectionResults2010.xml</a> - Mayoral, City Council and School Trustee 2010 election results.</li> \r\n<li><a href=\"/data/WinnipegElectionEvent2010.xml\">WinnipegElectionEvent2010.xml</a> - Metadata for use with WinnipegElectionResults2010.xml.</li> \r\n</ul> \r\n\r\n<br/>\r\n\r\n<a name=\"history\"></a>\r\n###Winnipeg Civic Election Results History (Google Spreadsheet)\r\n\r\nWinnipeg Election history extracted from City of Winnipeg PDFs. This data should be considered a work in progress. [Feedback and corrections are encouraged](mailto:winnipeg.election@gmail.com).\r\n\r\n<p class=\"small\"><strong>Data File</strong>: <a href=\"https://spreadsheets.google.com/ccc?key=0AldJTagt8-2NdDB5QW0weUpFQkRKeTdBWVpnaWE1QUE&amp;hl=en\">Winnipeg Civic Election Results History</a></p> \r\n\r\n<br/>\r\n\r\n<a name=\"source\"></a>\r\n###WinnipegElection.ca Website (Source Code)\r\n\r\nThe source code that powers this site is [available on github](https://github.com/opendemocracymanitoba/winnipegelection).", permalink: "open-data", show_title: true},
  {title: "Role and Mandate of the Mayor", content: "The Mayor is the head of Council and the chief officer of the City. The responsibilities of the Mayor are listed under Section 57 to 60 of [The City of Winnipeg Charter](http://web2.gov.mb.ca/laws/statutes/2002/c03902e.php). The Mayor chairs the Executive Policy Committee, and is an ex officio member of each Committee of Council. The Mayor appoints:\r\n\r\n* a Deputy Mayor;\r\n* an Acting Deputy Mayor;\r\n* the Chairpersons for the Standing Committees of Council, if standing committees are established by Council; and\r\n* members of the Executive Policy Committee\r\n\r\nThe Deputy Mayor or Acting Deputy Mayor acts in the capacity of the Mayor in cases of his/her absence or unavailability.\r\n\r\nSource: [City of Winnipeg Municipal Manual](http://www.winnipeg.ca/clerks/pdfs/2013MunicipalManual.pdf) ![pdf](/images/pdf.png \"pdf\")", permalink: "role-of-the-mayor", show_title: true},
  {title: "The Role of a City Councillor", content: "Council is the governing body of the City and the custodian of its powers, both legislative and administrative. The City may exercise only those powers granted to it by legislation. \r\n\r\nPolicy making at the local level is limited and controlled by provincial government statute. [The City of Winnipeg Charter](http://web2.gov.mb.ca/laws/statutes/2002/c03902e.php) provides the majority of powers and authority to the City of Winnipeg. However, other statutes extend additional authority to City Council in its decision making process.\r\n\r\nThe composition of City Council is legislated under Part 3 of [The City of Winnipeg Charter](http://web2.gov.mb.ca/laws/statutes/2002/c03902e.php) and consists of 15 Councillors and the Mayor. Each Councillor represents an individual ward while the Mayor is elected by a vote of the city-at-large.\r\n\r\nCouncillors have a dual role, as they are members of Council (decisions affecting the whole city) and members of the Community Committees (local community issues).\r\n\r\nCity Council exercises its powers either by by-law or resolution passed at a regular or special meeting when a quorum is present. Pursuant to the Charter, Council has the authority to establish committees of Council and Council may, by by-law delegate a power, duty or function to a committee of Council.\r\n\r\nThe authority to make final decisions on the following matters remains with Council and cannot be delegated to any political or administrative level below Council: \r\n\r\n* authority to enact a by-law;\r\n* authority to approve an operating or capital budget;\r\n* authority to appoint, suspend or dismiss a statutory officer; or\r\n* authority to enter into a collective agreement in respect of employees;\r\n\r\nSource: [City of Winnipeg Municipal Manual](http://www.winnipeg.ca/clerks/pdfs/2013MunicipalManual.pdf) ![pdf](/images/pdf.png \"pdf\")\r\n", permalink: "role-of-a-city-councillor", show_title: true},
  {title: "The Role of a School Trustee", content: "The main functions of a school trustee include preparing for and participating in school board and committee meetings. Each school division has a school board made of school trustees. Policy is determined at public school board meetings and sets the direction for the school division.\r\n\r\nSchool Trustees also attend meetings of the committees on which they serve. Most school boards have a number of committees that deal with areas such as finance, personnel, curriculum, and facilities. Other committees can be formed to deal with special projects or emerging issues. These committees create reports that generally go to the school board before being passed as policy.\r\n\r\nSource: [2011 Civic Election School Trustee Guide](http://www.winnipeg.ca/clerks/docs/elections/2011ByElection/pdfs/SchoolTrusteeInfo.pdf) ![pdf](/images/pdf.png \"pdf\")", permalink: "role-of-a-school-trustee", show_title: true}
])

# School Divisions, Wards and Trustee Candidates from 2010

division = Region.create!(name: 'Pembina Trails', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: '1', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Dianne Zuk', office_address: '', phone_number: '895-4539', email: 'dizuk@shaw.ca', image: nil, website: 'http://dizuk.shawwebspace.ca/', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=697166705', twitter: 'https://twitter.com/dizuk1', youtube: 'http://www.youtube.com/watch?v=n36PltSk-Ck', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

First elected in 2006, I am proud of my involvement and accomplishments on the Pembina Trails School Board during this time. One of the significant future directions for the Board will centre around the School Board Leadership Initiative, "Setting Clear Expectations for Student Learning" launched in 2009. This project included consultation and extensive dialogue with the community and divisional staff. I am running for re-election to continue my work on this and other initiatives that will positively impact student learning in our division and to continue to serve the community within Ward 1.

**What experience will you bring to complement your role as school trustee?** 

My four years as school trustee and currently, Vice Chair of the Board has provided me with a thorough background and knowledge of the crucial issues in education. I believe our division must be ready to respond to today’s needs of students and teachers, providing the resources necessary for successful learning, all the while, being fiscally responsible to the community. As a trustee, my role has involved serving on key divisional committees including Finance and Education. I have also represented Pembina Trails at numerous school events from Parent Council meetings to student assemblies. This experience coupled with my background as an educator continues to make me a strong advocate for public education.

**What are the major issues you would like to stand for and why did you choose these issues?**

I believe we must be ready to respond to the many needs of the 21st Century student and provide the resources needed for successful learning. Among my priorities are:

1. Literacy 
2. The Creative Arts
3. English as an Additional Language
4. Technology in the classroom 
5. Student academic achievement

**Is there anything in particular you would like to change in your school division? In your ward?** 

The schools in Pembina Trails School Division are exemplary. The division has a very positive reputation not only within the community but throughout the province for support of student learning and innovative programming such as recently launched Edu-Tube program, in partnership with the Manitoba government, Frontier School Division and industry partners. My particular interest in Ward 1, the area I represent, is to encourage young families to move into Charleswood, "The Suburb Beautiful", to get the benefits of a exceptional educational system.

**Do you have any other comments regarding your candidacy?** 

In 2009, I was elected Vice Chair of the Board and also sit on the Board of Winnipeg Technical College. Prior to being elected to this position, I completed my teaching career of over 30 years, teaching at Dieppe, Royal and Van Walleghem schools in our division. My training and experience focused on Special Education, literacy, French Immersion, and Early Years. I also served as President of the Assiniboine South and Pembina Trails Teachers' Associations. As a resident of Charleswood for over 20 years, my involvement in the community has varied from serving as Chair of the Winnipeg Public Library Board to Past President of the Friends of the Assiniboine Park Conservatory. I was a founding Director of the Assiniboine Park Conservancy, co-chair of the annual "Books and Brunch" event as well as being a member of organizations such as the Charleswood Horticultural Society^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Gerry Melnyk', office_address: '', phone_number: '895-8308', email: 'gmelnyk@shaw.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

We have embarked on a Board Leadership Initiative, to extend dialogue and consultation with all of our community and educational stakeholders. I have taken an active role in setting the vision for this initiative and would like to continue to serve in this capacity as we move towards implementation and continued dialogue to establish collaborative partnerships within the education community.

I am running for re-election in order that I can support our objectives to raise academic standards such as literacy and numeracy skills and increased student engagement and achievement. I will continue to support the practice of empowering administrators and teachers to be innovative and creative so as to build capacity for increased student achievement.  I will also continue to support enhanced professional development opportunities which will give staff the skills and strategies to actively engage learners with varied learning styles/multiple intelligences.  Employing practical strategies based on data and evidence will identify needs and develop strategies to improve outcomes.

By running for re-election I will promote meaningful accountability and continue to work collaboratively with our school communities and parents in a transparent and honest manner.

**What experience will you bring to complement your role as school trustee?** 

I have had the privilege of representing the Charleswood Ward 1 as a School Trustee for the past 17 years. Within this time frame, I also represented the Assiniboine South School Division and Pembina Trails School Division, as a member of the Governing Board at Winnipeg Technical College from 1999-2006 where I was Chair of the Board for 3 consecutive years (2001-2004) and Vice Chair in 2003. On standing committees I chaired Finance, Education, Buildings Property and Transportation, and Negotiations with Teaching and non-Teaching Staff.

I was a member of the Community Legal Education Association of Manitoba Board of Directors (1994-2006) and served as its President from 1998-2000. Nationally, I was selected as a member of the National Advisory Group ‘Moving Forward with Articulation Agreements in Canada’. As well, I am an individual member of the Canadian Comprehensive Audit Foundation (CCAF) which is dedicated to meaningful accountability and effective governance, management and audit.

 These experiences demonstrate my commitment to build on my capacity to govern and proven leadership abilities. I have a demonstrated ability to utilize critical pathways to establish collaborative partnerships within the education community. 

**What are the major issues you would like to stand for and why did you choose these issues?**

As the learning environment/climate becomes more complex Boards/Senior and School Administrators and Management must act together to optimize value for your money.

Trustees must possess a vision of relevance in order that our high school students leave with current skills. Crafting a draft budget that envisions expanding educational opportunities for our students and seeing that the Division is managed efficiently
 is an on going process each and every year.  

The interests of students are paramount!  I believe in long term Tax Stabilization and making balanced decisions based on evidence and facts after considering the alternatives.  My view would be increasing public school taxes would be a last resort after having explored other methods of meeting financial objectives. We must be consistent with providing a quality education within budget.

We will be continuing to create and maintain safe and caring learning communities.  This includes enhanced Workplace, Health and Safety and Security Strategies.

Presently, we have the fastest, most powerful fibre-optic educational network in Canada, delivering state of the art technological supports to students in 33 schools. As an issue, we need to assure and enable the division to continue to be cutting edge and innovative in its endeavours. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

We must continue to build on the process and protocols associated with public consultation. The Division must endeavour to honour the wishes of its individual school communities. In this way, a relationship of trust and open communication can be established and honoured. Board directives should not be changed arbitrarily without the consent of the Board of Trustees. Trustees must remember whose interests they represent- the electorate.

**Do you have any other comments regarding your candidacy?** 

My wife Myra, my family and I have resided in Charleswood for the past 31 years and have been actively involved in community and school affairs. My children James and Kristin attended K-12 in the Pembina Trails School Division and are graduates of Oak Park High School. My oldest grandson is currently attending a Pembina Trails School in Grade One and my youngest grandson is anxiously awaiting to enroll in ‘Kindergarten Here We Come’ next year. 

Currently I am curling in the Masters League at Charleswood Curling Club on Tuesday mornings. In the late 1980’s and early 1990’s my son, my daughter and I curled in the Parent/Junior League also at Charleswood Curling Club. 

As a past educator, I am enthusiastic about providing expanded educational opportunities and technological supports for our students. I have dedicated my career to providing students with extracurricular activities and programs and received a Manitoba High School Athletic Association 2010 Lifetime Achievement Award for Coaching as well as a Sport Manitoba Coaching Excellence Award (2006) for years of service. 

In September 2010 I was an active participant at the University of Manitoba Bison Basketball Reunion for teams spanning 1955-1976.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Gail Watson', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

One of the reasons I decided to run in the 2010 school board election is because our division is at an important stage in the process of moving forward with a leadership initiative of setting clear expectations for student learning.  This involves the areas of student learning in literacy and numeracy, and student engagement.  Having been involved in this important initiative for nearly two years I am anxious to contribute to the next steps of implementation and communication within the learning communities of our Division. 

Another reason is the continuing passion I have for working to ensure students are well educated and prepared for their future in today’s world.  I believe that the education of our youth is the most important task to which I can devote my time and energy.  As a trustee it has been evident that the multitude of decisions made by the school board affects the learning environment for students and staff.  I’m prepared to collaborate with parents, staff and the community to make sure those decisions continue to be positive for Pembina Trails School Division.

**What experience will you bring to complement your role as school trustee?** 

The experience I bring to the role of being a school trustee consists of nearly 24 years of serving in this capacity.  I have held all positions including chair of the board, chair and/or member of all standing committees, and have served on countless special committees. In addition I’m a past chair of the governing Board of Winnipeg Technical College.  I’m a past president of the Manitoba School Boards Association where I experienced the opportunity of learning about the direction, achievements and needs of education throughout Manitoba and Canada.  

I spent 16 years as an employee of the Manitoba Government implementing educational programs for families as an extension home economist with 10 of those years in management as a provincial program director.  Since then I’ve been a self employed facilitator and consultant focusing on strategic planning, policy and program development.  Last year I completed the coordinators role of 'Poverty is Hazardous to Women’s Health' project for the Women’s Health Clinic.  

**What are the major issues you would like to stand for and why did you choose these issues?**

* Being fiscally responsible by making sure our financial resources is spent wisely by balancing educational and student needs with the dollars available;
* Learning can only take place if our school environments are safe and caring places to work and learn.  All partners including parents, schools and community need to cooperate to ensure this important aspect; 
* Engaging students in their learning and meeting their diverse needs is complex today for several reasons.  Most students have known technology since their birth, many come from other countries without either English or French language, and others live in poverty and come to school hungry, as examples;
* Ensuring student academic success by providing classroom support for curriculum implementation, access to new technologies and staff development are essential; The educational leadership initiative of the Board to increase literacy and numeracy outcomes for student learning and to enhance student engagement requires continued use of divisional assessment data, discussion and analysis with all involved. 
* Improving our buildings with up dates to classrooms, libraries, music rooms, science labs, etc. are necessary including regular maintenance, ensuring safety codes are met and creating inviting learning spaces for students. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

Strengthening communication with our communities is an area I’d like to see improved.  Today everyone is so busy it is difficult to reach the public with information about what’s happening in their neighbourhood schools.  As more community members do not have children in school I think it is important that we increase the understanding of public education in today’s world and find ways to involve more people in our schools.  So many exciting and positive initiatives take place every day in schools and generally other than the parents, the community knows little about these endeavors.  Many community members would be interested to see how schools use technology in classrooms, what a science lab looks like today, experience how accomplished the students are in music, the arts, etc.  Quality, comprehensive education is expensive and taxpayers should have more opportunities to understand how those dollars are being used and to celebrate student success.

**Do you have any other comments regarding your candidacy?** 

I have resided in Charleswood since 1974 and together with husband Lyle, raised our daughters in this great community.  Both of our daughters were in the French Immersion program.  Jody began at Dieppe school for kindergarten and then as did   Lori, attended Royal School, Charleswood School and both graduated from Oak Park High School.  As parents we are grateful for the outstanding education they received in the school division and are proud as they contribute to our community as young adults.  Jody is the Director of educational programs at Fort Whyte Alive while Lori and husband Robert own and operate Kick It Dance studio.

I have served on many local, provincial and national boards and committees.  Presently I am the treasurer of the Canadian Home Economics Foundation, and a co chair of Taking Charge Inc.  Previously I’ve been a council member of the Agriculture Research and Development Initiative and of Eco Action, and am a past president of the Charleswood Business Women’s Curling Club and Royal School Parent Council. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jim Komenda', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '2', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Tim Johnson', office_address: '', phone_number: '', email: 'teamjohnson6@gmail.com', image: nil, website: 'http://www.timjohnson.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am seeking re-election to the Pembina Trails School Board because I want to continue to provide children the best opportunity for success through quality education.  I want to continue to work towards shaping the policies of the division, setting the future direction of the board, and to ensure that students and their teachers have adequate resources to meet their needs.  I personally believe that the education of our children is the most important contribution I can make to my community.

I have a proven record of collaboration with parents, staff and all community members and will ensure the decisions of the Board continue to support educational excellence through challenging and enriching experiences for all children. 

As a parent of 2 daughters and 2 sons who currently attend schools in Pembina Trails School Division I share the experiences and concerns of parents in the Division. 

**What experience will you bring to complement your role as school trustee?** 

I was first elected as Trustee for Ward 2 - Pembina Trails School Division in 2006.

As a School Trustee, I have worked with others for a better system of education, and have been active on the following committees, including: 

* Governing Board Member - Winnipeg Technical College
* Committee Chair: Buildings, Property and Transportation Committee, Pembina Trails School Division Educational Support Fund, and Communications and Community Relations Committee
* Member: Finance Committee, Human Resources and Policy Committee, Teachers Negotiation Committee, Van Walleghem Student Transportation and Traffic Flow Committee, and Fort Garry Community Network Liaison 

Other accomplishments include;

* Past President, Fort Garry Community Centre
* Bachelof of Commerce Degree (Honours)
* Program Manager with Manitoba Hydro for 23 years
* Outstanding Citizen’s Award for leadership in the community - Winnipeg 2003
* Presidents Award for outstanding leadership in the community - Fort Garry 2005.

As an advocate for the community for the past 10 years I know that our Ward is comprised of community members who have varied levels of interest in education. I understand the importance of finding creative solutions to expand programming opportunities at our schools, while holding the line on taxation. 

**What are the major issues you would like to stand for and why did you choose these issues?**

The traditional curriculum that consists of separate “core” subjects, with a few added options, is not sufficient to prepare students for the future. The Board must remain committed to finding creative solutions that get the best value for our education expenses while continuing to deliver the best in: technology; fine arts; practical arts; technical vocational opportunities; physical education; and languages. The Board must continue to support a more holistic education that provides students with the learning experiences and knowledge they need to develop their potential while in school, in order to assume their roles as productive citizens entering the post-secondary world of education and the work force.

The Board will be challenged to effectively address many issues over the next years, including: maintaining safe school environments; teacher salary negotiations; adequate funding for education in the context of the current economy; the success of the provincial immigration policy and the impact on public schools; and ensuring students are engaged in learning. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

The Trustee role and the decisions of the school board impact communities, families and the learning environment for all students. Pembina Trails School Division is at an important stage in our School Board Leadership Initiative; the extended dialogue and consultative process with our communities and with our staff. The leadership initiative has led to the Board setting clear expectations for student learning in literacy, numeracy, student engagement, and achievement. Having been involved in this important initiative for the past two years I want to continue to contribute to the next steps of implementation and communication with our school communities in the Division and in my Ward.

**Do you have any other comments regarding your candidacy?** 

Pembina Trails School Division has become the school division that exemplifies the provincial expectations for education and has a great reputation for student learning, use of technology in the classroom, and the development of innovative programming. The recently launched Edu-Tube program is just one example of innovative programming in the Division. 

Over the past four years I have remained committed to working on behalf of the communities I represent, to bring community voice to the table, to make sure Pembina Trails School Division is meeting the educational needs of our children and community. There has been advancement in educational programming while holding the line on taxation. 

Programming has not suffered. The Division continues to focus on the “core” subject requirements and is continually looking at creative ways to expand educational opportunities.

We have had significant growth in school-based day cares, with new ones flourishing in Linden Meadows, Whyte Ridge, Viscount Alexander, and Oakenwald Schools.

Opportunities for technical vocational programming are expanding and we are making greater use of technology in the classroom.

Innovative teaching tools developed by Pembina Trails allow students and teachers to participate in real-time tutoring sessions utilizing intranet/internet based services^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Sue Clayton', office_address: '', phone_number: '', email: 'voteforsueclayton@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I really enjoy this work and believe I have the knowledge and experience to continue to serve my community well. I am excited to continue shaping the Divisions direction through policy and governance.   We are in the midst of an exciting leadership initiative, Setting Clear Expectations for Student Learning. We have just completed a year of consultation with the community and employees.  I would love to continue to contribute to the direction of this and other initiatives on behalf of the communities I serve and the entire Division. 

My husband and I have three children, two of whom are in Pembina Trails schools while the oldest has graduated and is now at the University of Manitoba.

**What experience will you bring to complement your role as school trustee?** 

I have served the community for the past 12 years as a school trustee.  

My experience includes: 

* Chair (2003 to 2005) & Vice-Chair (2001 to 2003), Pembina Trails School Board
* Chair (2006 to 2007) & Vice-Chair (2005 to 2006), Winnipeg Technical College Governing Board
* Board Committee positions have included: Education, Public Relations, Human Resources & Policy, Buildings, Property & Transportation, Finance, various Staff Contract Negotiation committees
* Provincial Trustee representative for various Manitoba School Boards Association committees

I have a Bachelor of Science Degree in Agriculture from the University of Manitoba and worked in Western Canada and Europe in various sales and marketing positions.  I am currently employed at the U of M Faculty of Agricultural and Food Sciences as their Community Liaison Coordinator.

I have gained significant budgeting, planning, negotiation and teamwork skills through my professional and volunteer work over the past 25 years. I have served on numerous community and church boards, and have held a variety of positions in volunteer organizations. Most recently, I served on the board of the Linden Woods Community Club and in 2008 was the Director of the School Program for the Tim Hortons Brier, with over 6000 students participating.

**What are the major issues you would like to stand for and why did you choose these issues?**

* Education funding will continue to be an issue as schools are responsible for much more than basic education.  Appropriate funding needs to follow this increased mandate for public education.  We need to ensure that we are able to continue to offer a high quality education so all children can reach their potential.

* Effective use of your tax dollars through multi-year budget planning based on realistic projections. 

* There is an increase in students in the division where English or French is not their first language and supports need to be provided to help these students be successful.  The Division has supports in place but the ever-changing demographics means this needs to be closely monitored.

* There is a changing culture in society with respect to quick access to information and social networking.  That offers us both challenges and opportunities to engage students in the classroom with technology.  

* The Board needs to continue to work on communicating with our community in a meaningful way in order to try and engage them in public education conversations.  This includes parent councils and employees but also the large majority of taxpayers that have no children in the education system.


**Is there anything in particular you would like to change in your school division? In your ward?** 

As I mentioned above, I would like to see us continue to work on communicating effectively with all members of our community and having them more engaged in the public education conversation.  Support of public education is critical for the future of our communities.  After speaking to so many residents during this campaign, I know that there are many people interested in this conversation and have great ideas on how to engage our communities more.

One other area I would like to see expanded across the Division is our early literacy program.  Recent data has shown that children are coming to school not prepared for kindergarten.  Programs like Literacy Links and Kindergarten Here We Come exists at certain schools in the Division but it would be wonderful if eventually all pre-school children had the opportunity to participate in these programs.

**Do you have any other comments regarding your candidacy?** 

It has been my pleasure and honor to serve the children of this school division.  If I were fortunate enough to be re-elected, I would gladly continue to serve to the best of my ability for a final four years^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'David Johnson', office_address: '', phone_number: '', email: 'djohnson@pembinatrails.com', image: nil, website: 'http://www.david-johnson.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I was first elected to the Pembina Trails School Board when my children were starting school, now eight years later, I am seeking re-election to the Board because I want to continue to help shape its policy direction.  In particular, I would like to continue to work on our leadership initiative – “Setting Clear Expectations for Student Learning” which we launched at the beginning of last year.  

**What experience will you bring to complement your role as school trustee?** 

In the past eight years, I have served on all of the standing committees as well as numerous special committees and ad hoc committees.

My experience includes:

* Chair, Finance and Planning Committee (2008 to present) 
* Chair, Human Resources and Policy Committee (2005-2008)
* Chair, Buildings, Property and Transportation Committee (2002-2004)
* Member, Buildings, Property and Transportation Committee (2005 to present)
* Member, Communications and Community Relations Committee (2006-2007) 
* Member, Education and Communications Committee (2002-2004)
* Member, Finance and Planning Committee (2004-2005)
* Member, Non-Teaching Negotiations Committee (2002 to present)
* Member, Building Support for Public Education Ad Hoc Committee (2006)
* Member, Education Support Fund Committee (2002-2004)
* Member, Workplace, Health and Safety Committee (2002-2003)
* School Division Representative on the Fort Garry Community Network (2005-2006 and 2009 to present).

More information on my background in available on my website [www.david-johnson.ca](http://www.david-johnson.ca)


**What are the major issues you would like to stand for and why did you choose these issues?**

Pembina Trails will face a number of important issues over the next year. If re-elected I will work to ensure that the Division’s top priorities are:

* Student Academic Achievement – ensuring that students have the support they need to excel;
* Ensuring that teachers have the support and resources that they need;
* Ensuring that our schools provide a safe and caring learning environment;
* Engaging our communities;
* Providing prudent financial management.

Our children must be our priority but in order to be successful, we must recognize, value and support the tremendous contribution of teachers.  We must also consult with and engage our various communities and stakeholders.   

**Is there anything in particular you would like to change in your school division? In your ward?** 

We have great schools and I would like to see things maintained in Pembina Trails, but there is always room for improvement.  Over the next four years I hope that we are able to do more to engage our communities and improve communication.  I think that we need to do more to promote the positive initiatives that take place in our schools every day to the 70% of residents who don’t have kids in school.  I also think that we have to do more to demonstrate and promote the value of public education.  

**Do you have any other comments regarding your candidacy?** 

It has been my pleasure to represent the communities of Fort Garry, Linden Woods, Linden Ridge, Whyte Ridge and Tuxedo on the Board for the past eight years.  We have great schools throughout our Division.  I see firsthand the quality of education in our schools from my children.  I have also had the opportunity over the past few weeks to speak with thousands of residents of Ward 2 about the issues affecting our schools. While a number of specific problems and concerns have been raised, and will be dealt with, the overall message that I have been receiving has been very positive.  I hope to be able to continue be a part of the success of the Pembina Trails School Division over the next four years. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Norm Wylie', office_address: '', phone_number: '', email: 'norm.wylie@gmail.com', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Norm-for-Trustee-2010/123001677753923', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

After moving with my family to Fort Garry in 2009 my goal is to help out my commuity in the best way I can. As well I have a 16 month old son and when he does enroll in school, I wnt the very best the public school system has to offer him.

**What experience will you bring to complement your role as school trustee?** 

Not being an imcumbent, I bring an open mind and new ideas to the table. With my current occupation, I am in charge of miilions of dollars spending, With my fiscally responsibility, I will ensure  that we as tax payers get the most for our tax dollars. Plus my parents are both born and raised in Scotland before immigrating  to Canada. Nobody but nobody can save a buck better than a Winnipegger born from 2 Glaswegians.

**What are the major issues you would like to stand for and why did you choose these issues?**

Class sizes are very important to me and must be kept at a optimum number to ensure teachers have the ability to help out each and every one of their students needs.
 
Improving crumbling building infrastructure on older schools.

Look into the possibility amalgamation of school divisions

These are just but a couple of issues. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would love to see better communication between teachers and trustees. There seems to be almost advisaral relationship between them, I would make it point of working closer with teachers and form more of a partnership because both have a common goal with the students best interests in mind.

I would also like to see social media be used by trustees in order to keep the public informed of impending desicions to get their input.

**Do you have any other comments regarding your candidacy?** 

I love living here and I am very excited to watch my family and community grow.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Tina Strong', office_address: '', phone_number: '', email: 'tstrong2010@gmail.com', image: nil, website: 'http://www.tinastrong.webs.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

TS:  As an active parent of two children in the Pembina Trails Division, I feel it’s my obligation to act as a “strong” voice for my children and other families in the community.  As an elected trustee, I would like to bring a fresh perspective and new ideas to the board.  I believe I have the drive, commitment and passion to serve the community well as a board member for Pembina Trails.

**What experience will you bring to complement your role as school trustee?** 

TS:  For the past 12 years, I have been teaching adult education with my specialty being technology.  As a Microsoft Certified Professional,   I have remained current with today’s ever progressing technology taught in classrooms today.  I have an excellent understanding of technology which would complement my role as a school trustee. 

 I’ve also been operating a small business for the past two years which has provided me with many transferable skills such as financing, decision-making, and negotiating. 

Also, for the past five years, I have been working as a lunch supervisor in the Pembina Trails Division and have established a great rapport with teachers, parents, students and co-workers.  

I’m confident that my education and life experiences will complement my role as a school trustee.

**What are the major issues you would like to stand for and why did you choose these issues?**

TS:  Commitment to Safe and Healthy Learning:   I believe all children should feel comfortable and not fear bullying and violence at school.  We need to improve on the social and emotional development of students to make learning fun and interesting and emphasize respect for one another.

Class Size: We need to keep class size small so everyone has an equal opportunity to learn and no student should be left behind.  Teachers shouldn’t feel overwhelmed by class size.  We need to ensure teachers have the adequate resources to teach the core subjects in addition to looking for new and creative ways to expand the students’ educational opportunities for the present and future.

Avoiding Tax Increases without having our student’s education suffer.

Better use of Modern Teaching Methods and Technology: will better prepare our students for today’s ever changing world.

Literacy and Academic Excellence: I would work at helping improve literacy, math, and science skills in our division so students have the tools and ability to function in a fast paced environment.

**Is there anything in particular you would like to change in your school division? In your ward?** 

TS: I would like to increase community representation and involvement by creating opportunities for parents to have more input on school issues and priorities.  One suggestion would be to have virtual PTA meetings and periodic town hall meetings. 

**Do you have any other comments regarding your candidacy?** 

TS:  I believe our children deserve to have an education system that provides them with everything they need in order to become the leaders of tomorrow. Their fate depends on how well we succeed. I would be honored to have the opportunity to work with all stakeholders to meet the needs of our future leaders.  

My motto is:  “A better future with a STRONGER education^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '3', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Jacquie Field', office_address: '', phone_number: '269-7822 ', email: '', image: nil, website: 'http://www.jacquiefield.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Pembina Trails School Division has grown into one of the best divisions in the province.  We, as a division are seriously addressing the educational challenges of the 21st century.  We have a goal of student success for all and are making the necessary changes to achieve that goal by addressing student engagement, the digital learner and the wonderful diversity of learners in our classroom.  After serving the division for 12 years and being part of its growth and development, I want to continue to contribute to the exciting opportunities for further improvement.  I am also presently involved with Manitoba School Boards Association as the Vice President.  In that role I have the opportunity to work with government and partner organizations to enhance the educational opportunities for students across the province. I am seeking the support of the community to continue this work, building a strong public school system and an excellent Pembina Trails School Division.

**What experience will you bring to complement your role as school trustee?** 

I am presently retired after 31 years of teaching in the Winnipeg School Division.  During my tenure with Winnipeg, I taught in the elementary classroom, physical education, resource and special education.  I worked as a divisional support teacher in both physical education and special education. I had the opportunity to contribute to a provincial curriculum in physical education and more recently the new social studies curriculum.  I was the cooperating teacher for many new teacher candidates.  These experiences have given me a broad perspective on the school system.

I have been very active in my community as a volunteer Beaver leader, Heart and Stroke canvasser and coordinator, Ryerson Parent Council Vice President,  soccer coach, Fort Richmond Community Safety committee and President of the Pickerel Lake Cottagers Association.

I am the parent of two sons, both of whom graduated from Fort Garry/ Pembina Trails School Division schools. That of course has given me the parent’s perspective on the public school system.  Both my sons, Matt and Grant Rayner have been active volunteers and coaches in our community as has my husband Brad Rayner.

**What are the major issues you would like to stand for and why did you choose these issues?**

With the increasing number of English as an Additional Language learners, in our system, supporting Newcomers to be successful in our society will be important. 

We will need to expand the ways we collect and use data on student achievement to determine the supports required to ensure that every child is engaged, growing and graduating.  

Education has taken on many new roles as our society has shifted from a homogeneous, locally focused place to a diverse, globally focused world.  Schools provide supports to families, language acquisition, physical and mental health issues and preschool children. While I believe that schools should be supporting children in all these ways, it is a challenge to ensure that the community and the government understand the complexity of the new classroom and the need for on-going sustainable support for all the needs that go beyond the academic mandate.  Returning to a funding model less reliant on the local levy is important to achieve this sustainability.

Maintaining safe and caring learning communities is an ongoing issue for all school divisions.  As society becomes more complex and diverse the need to teach respect and to protect the rights of all students is an ongoing concern.

**Is there anything in particular you would like to change in your school division? In your ward?**

Not something that I would change but something that I would like to see continue to grow  is the ongoing focus on engaging the 21st century learner, the digital native, those young people who have grown up with digital technology as a given in their lives.  I fully support the creative ways that teachers are addressing this through the use of the digital technology and creating integrated, relevant, problem based experiences to better engage these learners. For Pembina Trails one of the things this will mean is continuing to leverage the optic fiber technology to extend the exposure of our students to classrooms and learning opportunities around the world. 

**Do you have any other comments regarding your candidacy?** 

Only that it has been a privilege to serve the Ward 3 community over the past 12 years.  Having served as Vice Chair and Chair of the Board for four years was a very rewarding experience.  I have also served on or chaired each of the Board committees.   I have been on the Board of Winnipeg Technical College and served as Chair of their Board for two years.  My Manitoba School Boards experience has allowed me to participate on several provincial committees including the Art in Education Steering Committee, Teacher Practicum Committee, Residential Development Committee and the Aboriginal Education Committee.  I have enjoyed being a part of the on going improvement of Public Education in Manitoba and the establishment and growth of Pembina Trails School Division^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Laureen Goodridge', office_address: '', phone_number: '', email: '', image: nil, website: 'http://www.laureengoodridge.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have been honoured to represent the Ward 3 community as a Trustee for the past twelve years.  I hope to be able to continue to work with the Board to continue to build and enhance a strong School Division, and to continue to provide the programs that educate and build capacity in the children of Pembina Trails.  

**What experience will you bring to complement your role as school trustee?** 

In addition to my experience as a Trustee, I was a member of the Board of Agassiz Child Care Centre for 17 years, and was chair or co/chair for many of those years.  I also volunteered for many years with Red River Nordic Ski Club as a Jackrabbits coach , board member and race organizer.  For a number of years, I volunteered for parent council and canvassed for charities in my community.  

My work experience includes work as a paralegal, both for law firms and for private industry.  I am currently the Executive Director of a regulated health profession in Manitoba.  

My son and a daughter both graduated from Pembina Trails Schools - my son from Vincent Massey Collegiate’s French Immersion program, and my daughter from Fort Richmond Collegiate.  My son completed a law degree and is currently an articling student.  My daughter chose a technical education and is successfully pursuing her career as a hairstylist.  Their experiences as they moved through school and made choices for careers gives me a perspective on the many choices children and their families make as they move through school and embark on life and education beyond high school.  

**What are the major issues you would like to stand for and why did you choose these issues?**

* I support collection of data to determine how well we are serving the needs of students.  PTSD has implemented programs to assess literacy across elementary grades and to measure student engagement across the division.  The global picture from these and other initiatives will assist in determining where future efforts should be directed.   
* I support funding to English as an Additional Language programs in our schools.  We must ensure that students who have immigrated to Canada are successful in their transition to Canadian classrooms and society.  
* I support initiatives to match educational practices to 21st century needs.  Students need to learn to assess and filter the torrent of information that we receive daily, and education must provide students with skills to integrate knowledge and understanding with these vast sources of information.  PTSD schools have begun exciting new initiatives to integrate learning across multiple subject areas to create the educational experiences that students need.  
* I support initiatives to learn about best practices in education.  Our schools are working to understand and enhance student engagement.  This is a central issue in educational discussions within the Division, and I support programs to enhance student engagement across all grade levels.  

**Is there anything in particular you would like to change in your school division? In your ward?** 

I believe that Pembina Trails School Division is a wonderful Division with caring and talented teachers and staff.  I believe that our students receive an excellent education in a caring environment.  The changes that I would like to see in the Division are improvements on initiatives already begun – 

* to ensure that our students are safe, we need to continue to work with teachers, parents and students to eliminate bullying, 
* to ensure that our buildings are safe environments for students, we need to continue to upgrade safety measures such as lighting and security systems,
* to ensure that our students are ready to learn, we need to continue to learn about what engages students, and provide programs that interest and fulfill our children as they spend each day at school.
* to ensure that our students have excellent educational experiences, we need to continue to provide and improve opportunities for teacher professional development.

**Do you have any other comments regarding your candidacy?** 

I hope to have the opportunity to continue as part of the Board of the Pembina Trails School Division.  The opportunity to learn and grow during the past twelve years has been a rewarding experience, and I am passionate about continuing to work on behalf of the children of Pembina Trails.   My experience on the Board has included two years as Chair of the Board, two years as Vice-Chair of the Board, three years as Chair of the Finance Committee, and I have served as a member or chair of all of the standing committees of the Board.  I have been a representative of the Pembina Trails School Board to the Board of Winnipeg Technical College for the past three years, and I am currently Chair of the Governing Board of Winnipeg Technical College.  I hope to be able to continue to serve the Division in similar roles for another four years, both to continue my own learning and to work to continue the history of excellence for the children of Pembina Trails^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Julie Fisher', office_address: '', phone_number: '995-5174', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run for school trustee because of my children.  I have 3 young girls and I want them to receive a quality education.  I currently sit on the board for Richmond Kings Nursery School; through this experience it has made me realize that I want to keep contributing to their school careers as much as possible.  The more I researched the role the stronger I felt that this was the right path for me. 

**What experience will you bring to complement your role as school trustee?** 

My background is agriculture.  I have worked for a major agriculture company for the past 10 years with a focus on quality.  I have been involved in creating and implementing a Canada wide quality system which requires detail and communication.  I have worked in a team environment my entire career; I understand the importance of open communication lines and the need to hear all sides before coming to a decision.

**What are the major issues you would like to stand for and why did you choose these issues?**

I am a strong believer in extracurricular activities.  Children that have outlets to explore their ability and creativity help them discover who they are as individuals.  Children are faced with a lot of tough decisions throughout their school career; I would like to make sure they have a strong foundation to make the choices that are right for them.
   
Teachers have a hard job; they have large classrooms and limited resources.  I would like to continue to support our teachers by providing resources (training, effective in-services, teaching support and composition support).  Teaching requires a safe learning environment built on trust and respect.  We need to provide our schools with the tools to show children how to be responsible, compassionate people. 

The African proverb “It takes a village to raise a child” holds a lot of meaning to me.  Children require support from a variety of people throughout their lives; parents, teacher, coaches, etc.  We all play a role in developing confident and happy children.  I want to help parents and teachers develop a strong relationship with open lines of communication. 


**Is there anything in particular you would like to change in your school division? In your ward?** 

My overall vision for Pembina Trails is to maintain a caring and safe environment for our children to learn.  A school system that is respectful of everyone and provides children the opportunity to learn who they are as individuals and build confidence in themselves.

**Do you have any other comments regarding your candidacy?** 

When I think about my future and my family’s future it is focused on our children and their development.  We are just starting into the public school system with our oldest child and we will be very involved for many years to come.  I want to be part of a team that works toward a strong and healthy school division^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Charlotte Roy-Johnson', office_address: '', phone_number: '612-9084', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I understand the value that education has in the lives of our children. Each child has unique talents and abilities and must  be given the opportunity to explore these.  I am committed to quality education for all students. All Students must have the help and programming available to grow to their potential.  Because of my experience as an educator  and a leader I believe I can make a contribution to the school board and Pembina Trails   Division .Please given me that  opportunity to provide a fresh perspective. on October 27.

**What experience will you bring to complement your role as school trustee?** 

During my career as a registered nurse I have had leadership roles at St Boniface Hospital. I have taught nursing at Red River College, University of Manitoba and St Boniface Hospital. The majority of my career has been spent working with new parents and children or teaching about these developmental stages.

I have been a strong advocate for young people with disabilities and mental illness and as a result of this became involved in lobbying and the political process.

Although being a parent is not essential to being a school trustee, my experiences raising my own children has given me an understanding of the uniqueness and challenges of each child.

**What are the major issues you would like to stand for and why did you choose these issues?**

* Classroom composition and impact on student learning
* Safety in our schools and bullying
* The need for preschool programs, to address school readiness
* Programming supports for Newcomers and Aboriginal students
* Enhancing current technology in classrooms
* Overcrowding of Pembina Trails High Schools

**Is there anything in particular you would like to change in your school division? In your ward?** 

As mentioned previously the high schools in the division are overcrowded. I would advocate for and lobby the provincial government to fund a new school. 
Research has shown that the better prepared or ready a child is for school, the better they will do. Preschool programs would address some of these needs.

**Do you have any other comments regarding your candidacy?** 

Formative and summative learning are discussed in PTSD policies. I understand that in formative learning each child learns at his /her own rate and is allowed some flex in evaluation. Some research shows that in elementary school it may be better to allow the student to move on with their peer group. They can catch up with some additional help. However I have some serious concerns about this type of evaluation in junior high and up. I have had questions from parents in my ward about this issue. I would very much like to find out more information as to what is happening in our schools at this time.

In conclusion I would like to state that my entire decision making would be guided by  balancing between fiscal responsibility and quality education for our children^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Caroline Mehra', office_address: '', phone_number: '297-9680', email: 'carolinemehra@gmail.com', image: nil, website: 'http://www.carolinemehra.com', council_site: '', facebook: 'http://www.facebook.com/pages/Caroline-Mehra/145526762157169', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I believe in the Pembina Trails School Division, I sincerely believe that it is one of the best school divisions in the Province of Manitoba.

We have incredible teachers, administrators and families. My decision to run was to continue the momentum in building a strong foundation for our children and to be a voice that put the “public” back into public education.  I have a vested interest in the division, given that both my children, currently attend two separate schools within the division. I am committed to providing all of our families within the division quality education. Our children are our future, together we can provide them with the necessary resources to achieve success.

**What experience will you bring to complement your role as school trustee?** 

My experience is in business. In my current position, I manage an enterprise to which I am accountable to shareholders, the public and my staff. My business background has given me the privilege to open successful businesses across Canada. I am however very proud to call Winnipeg and Pembina Trails my home.  

As a multi-lingual person, I am conversant in Polish, Czech, Hindi, Punjabi, English and French. I believe that I can effectively listen to the diverse community that is the Pembina Trails School Division. 
 
Giving back to the community is a tenant that I believe in. I believe that community members need to give back in whatever ways possible to them. I have served as a board member to the Masala Mixer board which has made a $50,000 commitment, over the next 5 years, to our very own Victoria General Hospital though an annual fund raiser. Furthermore, I have sat on boards including Variety Club and  my children's respective schools and daycares. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

I want to see our division grow even further than it has, we have the potential and the responsibility to the community.  We are blessed to have a community in which our citizens come from all different cultural backgrounds, languages and beliefs.  Given this reality of a growing community, I foresee questions revolving around school expansion and technology in the classroom. Furthermore, we need to keep an eye on the basics revolving around our everyday curriculum: Math, science, language studies and art. 

We have incredibly talented teachers, good resources and dedicated administrators all with one-common goal: our children.

**Do you have any other comments regarding your candidacy?** 

I reflect back on a piece of advice my father gave to me: 

''As parent, I can only give you a solid foundation for which you can build what you choose, be it a skyscraper or a hut, I am only your foundation that is my limit, you have the potential to build as high as you choose.''
 
I want to see our children build their skyscrapers –  together we can give them the strong foundation to achieve their goals and when we work together there will be no limit as to how high their skyscrapers will climb.  

Thanks, Dad.

Caroline Mehra
Vote: Caroline Mehra – October 27th/201^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
division = Region.create!(name: 'River East - Transcona', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: '1', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Colleen Carswell', office_address: '', phone_number: '', email: 'colleencarswell@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'George Marshall', office_address: '', phone_number: '221-8464', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

The education business is really the people business - big people and little people - but you need to have the facilities to get things done.  I alone openly opposed the School Board's initiative to close Westview and Sherwood schools at the Board table and in the school gymnasiums,  I also appeared before the Legislative Committee as an elected trustee in support of Bill 28 - a provincial initiative to freeze school closures across the province.  This bill was passed into law by the Manitoba Legislature - the highest authority in our province.  The closer the child is to her school the better - especially for early years children.

**What experience will you bring to complement your role as school trustee?** 

I hold an Arts degree from the University of Winnipeg, a Masters of Public Affairs degree from the University of Manitoba and two Certificates in the French language from College Universitaire de Saint-Boniface and L'Alliance Francaise.  I am a veteran trustee, presently a member of the River East Transcona School Board, an alumnus of Transcona Springfield School Board, an alumnus of Winnipeg City Council and a Past President and Honourary Life member of the Manitoba School Boards Association. 

**What are the major issues you would like to stand for and why did you choose these issues?**

The retention of the present model - the delivery of educational services through a duly elected school board - which has the power to levy.  This approach allows the better targeting of dollars, a quicker reponse to community aspirations, and greater professional freedom to those who serve our children.  A similar provincial tax on property would make local educational decisions more distant and less reponsive while not changing the impact on the property tax payer.  This could happen - as in other jurisdictions - either through provincial ideology or poor school boards performance.  Removing school tax from property completely - which is a provincial responsibility and not a school board one - would significantly impact other taxes and make our province less competitive.  No school trustee, yours truly included, has enough broader provincial understanding, to make that call - it is fodder for our MLAs.  Trustee aspirants, who embrace such advocacy, are taking a popular position, which has no substance and is beyond their responsibility.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would introduce a division wide bus and lunch program policy like we had in Transcona Springfield.  The present policy punishes the urban student despite the fact that the urban community pays 80 to 85 % of transportation costs which fall into local levy beyond the provincial grants - running into hundreds of thousands of dollars.

**Do you have any other comments regarding your candidacy?** 

My candidacy is about our children - our treasure - our hope - our future,  The Haida first nation in British Columbia say it best - "We do not inherit the land from our ancestors - we borrow it from our children.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Amanda Giesbrecht', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Dan Richard', office_address: '', phone_number: '792-6680', email: 'dan.richard@shaw.ca', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=154257857947740', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Derek Goodman', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'David Kendall', office_address: '', phone_number: '254-3649', email: 'dhkendall@shaw.ca', image: nil, website: 'http://www.davidfortrustee.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am a parent to two children in the RETSD school system (in Westview School and Ecole Centrale).  In the 2007-2008 school year my daughter's school, Westview, was slated to be closed by the school division due to declining enrolment.  This united both affected parents like myself and neighbourhood residents to keep the school open.  This kind of community action shows why we need a voice on the board that is interested in keeping our schools open as a vital link in the community.

**What experience will you bring to complement your role as school trustee?** 

I have several years of experience on volunteer boards as a 20-year member of Toastmasters; I have served on all positions of my club executive as well as area governor and in several district leadership roles.  Trustees also must be excellent communicators with their constituents, something that my Toastmasters background has afforded me.

**What are the major issues you would like to stand for and why did you choose these issues?**

As mentioned before, I want to be a champion to keeping our schools open as vibrant parts of our community, and maximize their roles as community hubs.  I am also firmly against any "no fail" policy, and I'm for making sure that school division funding is not covered by homeowners on their property tax bill in any way, but instead funded as a core service from general provincial government revenue.  Finally, I want to ensure that the public is always aware of what is going on at school board offices, and I intend to make residents informed through websites, social media, and printed newsletters.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to have the public to be made more aware of the important business that goes on at the school board offices, as mentioned above.  I would also like to have teachers be fully utilized in their role that we have entrusted them with and make the best use of their time - for example have a rotating list of teachers who would be able to watch children at their lunch hour instead of the "corporations" set up by parents that charge a profit for this as in some schools in the ward.

**Do you have any other comments regarding your candidacy?** 

School should be a place of great achievement for our children, a place where they learn the necessary skills to become productive members of our society.  My aim is to make schools a safe place to build our children's future, and to keep our schools as cornerstones of the communities that they are a part of.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '2', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Gurpreet Brar', office_address: '', phone_number: '990-1717', email: 'gurpreet@gurpreetbrar.ca', image: nil, website: 'http://www.gurpreetbrar.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Gurpreet-Brar-for-School-Trustee-in-RET-Ward-2/138721906169496?ref=ts', twitter: 'http://twitter.com/gbrar4trustee', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'John Toews', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

On Easter Sunday April 2006 our family experienced first hand what happens when the “system” lets a child down. There was no one from the healthcare system to advocate for our 15 year old son. We placed our faith in the system and he died needlessly from a totally treatable but undiagnosed case of bacterial meningitis. He had been ill for several weeks, lost 50 pounds and had all the classic symptoms yet he was sent home from the emergency ward only to return a couple of days later and was brain dead less than 48 hours after that on his brother’s birthday. In October 2006 with encouragement from families in the community I decided to run and was fortunate to be elected to my first term. This community gave our family support when we needed it most. I want to give back by continuing to be a strong advocate for the children. Many individuals use school trusteeship as a “stepping stone” to kick start their political careers. I do not share this philosophy. I believe our children really “are” our future and we must invest our time and resources very carefully. 

**What experience will you bring to complement your role as school trustee?** 

I have:

* Been a long time resident and a committed partner in raising sons John and James (KEC) so my wife, Wendy, could return to her 27-year teaching career in the River East Transcona School Division.
* Regularly attended Parent Advisory Council meetings for 14 years at Mission Gardens Play Centre, John de Graff, Joseph Teres, Valley Gardens, and Kildonan East as a parent, council executive and as a school trustee.
* Served as chair on the Finance Committee for the last 2 years and I’m committed to status quo budgeting obtaining a 0% tax increase for 2010/2011.
* Assisted in negotiations with labour groups – Maintenance, Paraprofessionals, Clerical, Transportation and Library Technicians.
* Served as a member on Programs, Policy Review and Personnel Committee.
* Graduated from the University of Winnipeg with a BA (Honours) Psychology degree and wrote my thesis on developmental child psychology.

**What are the major issues you would like to stand for and why did you choose these issues?**

We must always be vigilante in our spending and spend where it benefits the students most directly such as in math and reading recovery programs. Our school division has a comprehensive purchasing and tendering policy that is based on both the legislated requirements of the Public Schools Act and industry best practices. We must invest in the long term efficiently. I encouraged a pilot program that is presently reviewing and ensuring that education is relevant for current employment readiness standards. I spearheaded recorded voting and will continue to help ensure accountability and transparency in the Board.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to see increased support in classrooms- making both the environment and the experience conducive to learning. I also believe that we need to work harder in developing partnerships with parents, business and the community. I would also like to see improvements in space and facilities available to our students in both the vocational and academic areas. I believe there has to be a more equitable way to fund education than through property taxation while at the same time not losing local autonomy. I also support the idea of a standardized provincial report card that is more understandable to parents.

**Do you have any other comments regarding your candidacy?** 

I have always been very involved in the River East Transcona community. I’m known to many young people as “Papa John” or “Big John” and even “Santa” to many preschoolers. Our family will be forever indebted to this community and they have been gracious enough to give me a purpose. I would be honoured to serve our community and advocate for the children for another four years. I believe only one thing happens when we cut corners in heathcare and education and it usually isn’t good. I have and will always act in what is in the best interests of the children. Thank you for giving me an opportunity to share my thoughts and experiences. I would like to dedicate this to my sons “Little” John (1991-2006) and James and their friends who have accepted me as their friend.
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '3', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'A J Falk', office_address: '', phone_number: '', email: 'falktrustee@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I’ve lived in my neighbourhood for 21 years, and have worked in it for the last four at one of the schools (SMP) as an Educational Assistant. I have 2 kids (1 school age and one younger) and I want to make things the best for them they can be and the other kids I work with. I also have some people in my life that I really admire who have been involved in politics. They’ve shown me the value of public service.

**What experience will you bring to complement your role as school trustee?** 

My time working in the school has given me a real clear insight into what the schools really need from a grassroots level. I have proven over and over that I am rational, calm, organized, and thorough. I also spent 3 years in the accounting field where I was known for my attention to detail.

**What are the major issues you would like to stand for and why did you choose these issues?**

The major issues are making sure that all students are getting a safe and equitable education. My reasons are obvious.
Infrastructure is obviously important as well, as it houses the education process. Roof repairs in many places are due given all the damage caused last year.

No school closures in our division. This decision should be left in the Board’s hands and not the provinces, as the board will be the one(s) to find a solution. My reason is because of the importance of schools in a community. Nothing could be worse than a vacant school.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to see term limits for trustees so as to not discourage young people from getting/staying involved (if they lost an election to a senior incumbent).

I would also like to see contracts with all the employee groups NOT end during election years. Groups have been left without a contract to make it look like sitting trustees have ‘frozen’ taxes. This is unfair to employees and deceitful to taxpayers. Plus, where does the back-pay come from when contracts are resolved if there is a shortfall?

Lastly, I’d like to see the school tax portion on a person’s property taxes reduced to zero, or close to and the balance collected by the province…like everything else under the provinces jurisdiction. Justice, highways, and health fees are not charged on property taxes, why education costs??

**Do you have any other comments regarding your candidacy?** 

My email is <falktrustee@gmail.com>. I can set up a time to meet and talk about the issues if anyone likes. Thanks^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Bob Fraser', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '4', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Eva Prysizney', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Roland Headley', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jeff Cieszecki', office_address: '', phone_number: '782-3093', email: 'voteczk@mts.net', image: nil, website: 'http://www.voteczk.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

The primary reason I chose to run in the 2010 school board election is that my son attends the English-Ukrainian Bilingual Program in Ward 4 of the River East Transcona School Division.  As a member of his school’s parent council, I want to work to better the learning environment for all students in the division.  The second reason has been my involvement in the educational system for the past 17 years.  I have had the opportunity to initiate programs both in the classroom and as extracurricular activities for students across the province.  These programs include partnerships with local community groups (Winnipeg Amateur Radio Club, Royal Astronomical Society), post-secondary institutions (University of Manitoba, University of Winnipeg, University of North Dakota), and numerous industry partners.  I would like the opportunity to expand my experience to the school board level.

**What experience will you bring to complement your role as school trustee?** 

I have been working in the education system for 17 years.  As a teacher, I have an understanding of educational theory and policy that allows me a greater insight into the needs of students, parents and the community where they reside.  My experience allows me to have an open dialogue with these groups and work with our teachers and their support team to enhance student experience.  I have also been a part of the Manitoba Teachers’ Society Educational Finance Committee for 10 years, which has provided me with insight into the area of school board budget development. 

**What are the major issues you would like to stand for and why did you choose these issues?**

Two major issues for me are level of student support services and declining enrolment.  As the second largest division in the province, River East Transcona School Division is ranked 20th out of 38 school districts in Manitoba when it comes to spending on student support services relative to total enrolment.  Seven years ago River East Transcona was ranked 8th in the province.  As I meet with parents, teachers, and support service staff, all have indicated that there is an increase in the need for student supports and I feel that this must be addressed.

Declining student enrolment is occurring in most of Manitoba’s school divisions.  It is imperative that the River East Transcona School Division board not only maintain, but continue to improve program delivery for its students in a financially responsible manner.


**Is there anything in particular you would like to change in your school division? In your ward?** 

There needs to be greater transparency in the school boards budget consultation process.  River East Transcona School Division holds a public consultation on the development of the budget, but it does not fully disclose revenue and expenditure streams in the process.  The division needs to provide the public its proposed budget in the form of the existing provincial FRAME (Financial Reporting and Accounting in Manitoba Education) reporting system.  Further, the public consultation must be held early enough so that community input can be incorporated into the final budget that is submitted to the province in March of each year.

**Do you have any other comments regarding your candidacy?** 

I personally believe I have a lot to offer as a trustee of the River East Transcona School Division.  I have been an active member of this community all my life and an alumnus of the school division.  As a trustee, I will be a voice in the boardroom as an energetic member of the community.  I will bring experience and understanding of educational innovations and classroom practice with my 17 years of teaching.  As decisions are being made at the board level, I will provide an insight into the impact decisions have on classroom practice, program delivery, school policy and ultimately on our students and their families.
 
Students in the River East Transcona School Division deserve the opportunity to reach their full potential.  If elected to the board of trustees, I hope that my work will ultimately affect the graduation rates of students in the River East Transcona School Division, and the future options of post secondary study so they can be effective leaders in our community.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Wayne Ritcher', office_address: '', phone_number: '663-6669', email: 'writcher@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am concerned with the lack of direction of the previous board.   There has not been a renewal of a strategic plan for the division and ultimately this rudderless approach will affect the quality of education for our students and staff.  

Every large organization needs a focus and a plan for the future and proper assessment to ensure it is meeting its goals.   I intend to bring a sense of purpose to the Board and a commitment to its direction.

I believe that all children deserve the opportunity for a better education.   I believe that our teaching methods must provide them with the tools, the technology and the desire to achieve success.   Our schools must be a safe environment for everyone and open to the entire community, for people of all ages and activities, because education is a life-long adventure.

**What experience will you bring to complement your role as school trustee?** 

 My experience includes 11 previous years as a Trustee in this division, including 3 terms as Chairman of the Board.   I hold a Certificate in Public Sector Management from the University of Manitoba, in addition to my regular studies at the Faculty of Architecture.   

  My business experience of over 20 years includes co-ownership of a retail furniture store, Roche – Bobois, which imported designer furniture from all over Europe.   Recently, I retired as a provincial civil servant after 19 years with the Dept of Culture & Heritage, Administration & Finance.   I am very familiar with the workings of large organizations.

**What are the major issues you would like to stand for and why did you choose these issues?**

Major issues include:

* Removal of Education Tax on Property.       The Province currently only funds 50 % of education, off-loading the remainder onto the local ratepayer.   Education is a provincial responsibility and should be funded 100 % as are Health, Social Services, Justice and all other government departments.   
 
* Graduation Rates.   Approximately 4 of 10 students are not graduating from High School.   Let’s find out why and target to improving the ratio, and more importantly, the future of the students themselves.

* Pass/fail Social Engineering.   The Division does not have a pass/fail policy, however in practice; children do not fail a grade.   This does not benefit the child as they will not have a basic understanding of the previous grade.    I would establish a remedial program to upgrade their skills and knowledge prior to failing a grade.   Of necessity, this would require timely and accurate assessment of the student during the school year, not at the end.

* Safe Schools.   This would include bullying and the elephant in the room, drugs.    There are pushers operating in our schools, looking for life-long customers.   Let’s root them out by using every means available and get them out of the system.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like a united Board to focus upon the major issues outlined above.   There are the regular operational issues that the Board must attend to yearly: Budgeting, Collective Agreements, Staffing, Transportation, Maintenance, etc.   I think that we have to also look beyond caretaking duties and begin to establish a vision, a purpose and a commitment for the future.    I believe the division has to establish a "relentless pursuit of excellence" as the guiding principle of its existence. 

**Do you have any other comments regarding your candidacy?** 

I will not bring a personal agenda to board business.   As a true independent candidate, I am not indebted to special interest groups or private organizations; I am accountable solely to the electorate as a whole.

I am concerned about the standard and quality of education.  No child should "fall through the cracks."   Students MUST have more than the basic skills to enable them to compete and indeed excel, not only in the workforce, but also as productive citizens of our society.   They deserve that chance.   You deserve that assurance.   I am committed to making it happen.  ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '5', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Peter Kotyk', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run for re-election because I still have a strong desire to work for the betterment of our school division. Our school division will be losing at least 2 experienced trustees (Rod Giesbrecht and Brian Olynik) who have served our community well, and the thought of at least 3 inexperienced board members could be very difficult? I have the energy, desire and determination to work as hard as I have since the first term I was elected ...except now I have a wealth of experience with me. I'm here to serve the people of River East Transcona as best I can, I include my phone number in my pamphlet not once but twice to better inform everyone that I 'm here to work for them with their education/school/divisional concerns. I have many parents and even those without children who call me from wards other than #5 to ask for my help.

**What experience will you bring to complement your role as school trustee?** 

* Since I was first elected 15 years ago, I have served as Board Chairman and Vice-Chairman of the Board of Trustees of River East Transcona School Division, I has also served on every Standing Committee as chair or member, including Finance, Building and Property, Program and Policy, Personal, Negotiations, Technology, and a number of Ad-hoc committees, including, Senior 1 study, Strategic Planning, and Senior Administration Selection.

* I have also served as Provincial Regional Director on the Manitoba School Board Association, as well as other committees within the association.

I have a very good knowledge of all 42 schools, as well as the maintenance and transportation buildings, as well as all who work within those areas. I'm on a first name basis with all senior administration, principals vice-principals, directors and most consultants, not to mention many teachers, bus drivers, pares and maintenance staff. In most cases I can direct those with problems to those who are responsible and can rectify the situation

**What are the major issues you would like to stand for and why did you choose these issues?**

My objectives:

* Committed to review and improve the music program facilities at River East Collegiate, Chief Peguis, and John Pritchard.

* Committed to bring Science labs up to Provincial standards at River East.

* To advocate for a Divisional Bursary/Endowment program with former students.

* Champion to make the Board and its activities more Green.

* Work with Administration to make stronger our “Zero Tolerance” policy when it comes to bullying.

* To advocate for the recognition of school volunteers who contribute generously their time, skill and energy to the students of our school division

* Champion a Division wide Early Years Grandparents Day.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Our school division still has a number of anomalies since amalgamation which the board could look at, including a review of the industrial arts programs, dual track and single track, review of the music facilities in the junior and senior high schools, improve on our "Zero Tolerance" policy when it comes to bullying, champion the continued "greening" of our division, especially board meetings where at present the use of agendas on laptops are prohibited. I would like a hand on approach for those students who are entering grade 10 at River East or Miles Mac and who had some difficulty with some of their grade nine subjects, (only two high schools in our division where grade nines are not part of the student body).

**Do you have any other comments regarding your candidacy?** 

I take my responsibilities very seriously, I devote my full attention to this task, and I attend many school functions, be it in the mornings, afternoons or evenings. I'm can be reached by phone or e-mail anytime, and on most occasions I'll be the one answering the call. I'm sorry to report that virtually all of the various non-incumbent candidates have attended no board or budget meetings in at least the last term or two. Some possible trustee candidates have suggested significant changes with no indication of how or with what they would replace division funding or programs? Our division, nay our children deserve dedicated and committed board members. Thank-you to all who have supported me over the years, I again ask for your support, confidence and vote on October 27th. Thank-you. Peter Koty^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jan Anderson', office_address: '', phone_number: '', email: '', image: nil, website: 'http://www.jananderson.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have two children currently enrolled in River East Transcona schools (one middle years and one high school) giving me an immediate and vested interest in the education we provide. My board affiliations and business acumen have long been recognized as an invaluable asset for researching the issues, bringing all parties cooperatively to the table, and inspiring everyone not only to maintain their focus, but to think in new and creative ways as we face daily changes and challenges. I have been afforded many opportunities to work with individuals whose primary motivation is to improve the quality of a child’s day and I am proud to be one of them. School Trustee is a perfect role for me and one that I have great desire to give for the benefit of our families, our students and our educators.

**What experience will you bring to complement your role as school trustee?** 

* I am a parent of school age children sharing the same hopes and concerns of every parent and facing the same issues as all parents of public school students;
* A decade of working with school-age child care centers located in our division schools and dealing with multiple parties’ interests and policy matters;
* Immersion in our community both as a board member of the River East Ringette Association and having both children actively participating in community sports;
* Both my employment and my board affiliations have given me years of successful management, legal knowledge, strategic planning and policy creation experience;
* Proven communication strength in all that I do;
* My unwavering passion to work for the benefit of children.

**What are the major issues you would like to stand for and why did you choose these issues?**

As I campaign door-to-door, the residents have clearly conveyed that the no-fail, social promotion idea is of great concern. The teachers feel pressure to move a student along through the grades; the parents are upset that their child is being passed without sufficiently meeting course outcomes; the business owners are concerned about the less-than-quality employee options available to them; and the students are worried about their ability to compete after graduation. We need to find better ways to deliver high education standards balanced with appropriate self-esteem support.
 
Like and dislike of multi-grade classrooms is also being raised. There are situations where a multi-grade classroom and the better utilization of our resources (classroom space, equipment, and teachers) could make the difference between closing or maintaining a low enrolment school. Multi-grade classrooms can sometimes be the best option and there is a lot of research available on the positive cooperative nature of a multi-grade. It is an option that should not be dismissed by any trustee and requires full consideration in particular situations.
 
I chose those two issues as they have been the most often raised during my past month of meeting with Ward 5 residents.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would strive to improve the level of transparency available to our residents as the publicly available minutes of the trustee meetings are not sufficient to convey to interested residents the work the board is performing. I would also do what I can to increase the division efforts on the zero-tolerance bullying policy. Children need to feel safe before they can focus on their studies, and they need to fully comprehend the power of their internet communications which can so easily escalate to cyber-bullying.

**Do you have any other comments regarding your candidacy?** 

I invite residents to visit my website: [www.jananderson.ca](http://www.jananderson.ca) and, as many who have emailed or phoned me during this campaign period already know, I am available and welcome their thoughts, questions, suggestions and complaints. Should the voters show their confidence in me by electing me as a School Trustee, I promise I will give them the full power of my unquestionable work ethic and my passionate desire. Revitalization of any board is crucial to bring fresh perspective and innovative ideas and election time is the opportunity for voters to do so. I strongly encourage all residents to exercise their voting right on October 27, 2010, and I would be honoured to receive their vote and represent their interests,

Thank you,
Jan Anderson
Candidate for School Trustee, Ward 5
River East Transcona School Divisio^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Derek Litke', office_address: '', phone_number: '', email: 'derek_litke_retsd@hotmail.com', image: nil, website: 'http://www.vote4derek.weebly.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Michael Hamm', office_address: '', phone_number: '', email: 'mhamm.retsd@gmail.com', image: nil, website: 'http://voteformichael2010.wordpress.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Shirley Timm-Rudolph', office_address: '', phone_number: '415-0294', email: 'votetimmrudolph@hotmail.ca', image: nil, website: 'http://votestr.weebly.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run for the school board out of my concern for the future of our children’s education. Our family has lived 37 years in the North Kildonan and our daughter graduated from the RETSD. Soon we will have two grandchildren entering the River East Transcona School Division. I like many of you are alarmed and concerned by the emphasis of a “no fail /social promotion” and with use of multi grade classrooms policies. Many of these experimental teaching methods have failed in the past at the expense of our students’ education. No student can afford their loss of education nor should they. I concluded it was time for me to step up and offer the electorate change and the promise of a proper education for our youth, not compromised by experimentation of new methods of teaching. I want to ensure our children’s abilities and future is not compromised and the most important focus is ensuring the best possible education is available for our students. 

**What experience will you bring to complement your role as school trustee?** 

I believe my many years of experience and knowledge of working with residents, neighbourhood associations, students bodies, parents, community leaders and other elected government officials will allow me to bring my dedication, commitment and leadership capabilities into focus towards working for a better education system. I have the proven ability to influence, engage and to be a strong voice at the school board level on behalf of students, parents and grandparents in our community. They can count on me working continuously on their behalf making the necessary educational improvements for a brighter future.

**What are the major issues you would like to stand for and why did you choose these issues?**

While meeting with the residents in community and hearing their concerns, I would say the major issues are school taxes, the moratorium on school closures, multi grade classrooms, standardized testing and standardized report cards and the “no fail policy or social promotion policy”. 
I strongly believe the Province of Manitoba must be convinced to remove school taxes from the property tax bill as there is no direct correlation to services provided to ones home. Secondly it is imperative the Province of Manitoba’s remove the moratorium on school closures, which will allow respective School Boards to govern accordingly. Thirdly, I am extremely concerned about the use of multi grade classroom approach to education, as it will affect student’s ability to learn at their grade level and will no doubt compromise their education. I believed the standardized testing and standardized report cards would provide the education and knowledge level to be implicit and measurable to other school divisions throughout the Province of Manitoba. Finally, I cannot support the principle of a “no fail policy or social promotion policy” which does not provide students with a true understanding of reality.   

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like an opportunity to assist our students in excelling in their studies, to feel safe in their schools and celebrate their knowledge and successes. Our schools have many dedicated and resourceful teachers who need our support. We need caring School Trustees who are willing to work with parents, grandparents and teachers in achieving the best possible education and future for our students! I want to make certain our education system provides every possible avenue of opportunity for success to our students. 

**Do you have any other comments regarding your candidacy?** 

As an independent candidate for School Trustee in Ward 5, I believe my knowledge and experience will afford the assurance that your School Trustee is able to provide and is prepared to make the necessary sacrifices to make certain our students’ interests and education comes first. It’s important your School Trustee provides the kind of representation you need when it comes to defending a proper education and to ensuring we secure the opportunity of a great future for our children. 
I make this personal pledge to you, with your support and vote on Wednesday, October 27, 2010 you can count on me being a School Trustee with a clear understanding and awareness of our children’s educational needs in the River East Transcona School Division and you can also count on me working continuously on your behalf!^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Marie Antaya', office_address: '', phone_number: '', email: 'marie4retsd@yahoo.ca', image: nil, website: 'http://www.marie4retsd.webs.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I want to be the community’s partner in supporting public education. I have the education and work experience that a school trustee requires. I understand that school trustees are not there to push their personal opinions, but instead they are there to:

* act as a member of a team
* establish and review policies
* be accountable to the Province of Manitoba and to the community members within the division

Most importantly, I will be there to ensure that the needs of the students come first.

**What experience will you bring to complement your role as school trustee?** 

As a business owner, an educator and a past civil servant, I bring a lot of work experience to the table. 

One example is my budgeting experience. Currently, I oversee the financial management of a successful training and consulting company. While working in government, I helped manage a multi-million dollar budget for a department that had to work with constant budgetary restrictions and cutbacks.

With my experience as an educator, I know what it’s like to be in the classroom. I understand the daily challenges and pressures that teachers have. 

As a civil servant, I worked in the department of Healthy Living on school-based programs. I worked with the administrators and teachers in all the schools in Manitoba. In the years that I was there, I gained an understanding of the unique partnership school divisions have with the Government of Manitoba. I also had the opportunity to see the various approaches and models the divisions throughout Manitoba are using to create a valuable and educational experience for all students.

**Is there anything in particular you would like to change in your school division? In your ward?** 

The River East Transcona School Division can improve on its community engagement. The school board needs to be proactive in finding ways to encourage community members to participate and share their opinions. 

As a school trustee, I will improve community engagement by:

* maintaining a website to keep all community members informed
* sharing the board meeting minutes  
* acting as a liaison between the school board and our community
* voicing the education issues of our community
* seeking the opinions of all members of our community and communicating those opinions to the board 

**Do you have any other comments regarding your candidacy?** 

I understand and know that the school board operations are often set by provincial legislation or policy. 

As school trustee, I will support decisions that will create a safe and stimulating learning environment for all students within the division. I will accomplish this goal by working as part of a team with the other elected trustees. I will also take the time to be an informed board member by seeking the opinions of the community and by researching and analyzing all possible options.

I have a strong desire be an accountable and dependable community representative and I would be honoured to have your vote.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
division = Region.create!(name: 'St. James - Assiniboia', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: 'King Edward - Deer Lodge', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Kelly-Ann Stevenson', office_address: '', phone_number: '', email: 'electstevenson@gmail.com', image: nil, website: 'http://www.kellyannstevenson.com/', council_site: '', facebook: '', twitter: 'http://twitter.com/StevensonKelly', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

The idea was first introduced to me by a parent following a meeting with a school to negotiate his daughter’s return back to school while addressing her special needs. From there I began to explore the role and responsibilities of a trustee. I met with past and current school trustees, teachers, principals, superintendents, and students. I believe my years of advocating for children/adolescents and their families, and my lifelong dedication and passion to improving the lives of children and adolescents are the skills and experiences required to be a school trustee representing the community. 

**What experience will you bring to complement your role as school trustee?** 

The experience I offer to the role as a future school trustee is as follows:
 
* 25 years working with children and adolescents as a Registered Psychiatric Nurse at the Manitoba Adolescent Treatment Centre. 
* Professional and a compassionate understanding of child/adolescent development and impact these stages have on the family unit and schools. 
* Extensive experience and knowledge of Board governance. I have been a local, provincial and national Board member on various health and public service Boards. 
* An extensive history of being an effective labour negotiator.

**What are the major issues you would like to stand for and why did you choose these issues?**

i. Safety and health of schools, students and staff – many of the schools in St. James-Assiniboia (SJSD) are greater than 25 years old if not older. Upgrades to electrical, heating, ventilation, washrooms, floor conditions, and roof conditions. 

ii. To maintain a learning environment that is free from harassment. There needs to be ongoing education and awareness promoting a zero tolerance for violence & bullying. 

iii. The declining enrolment within (SJSD). In the past 20 years 15 schools have been closed within SJSD. Our current student enrolment is 8500 students. In comparison to other school divisions in Winnipeg, SJSD has the lowest total enrolment. My concern is when a school is closed due to low enrolment – what happens to the students of that school? What is the impact on the community? Are there alternative uses for the school – such as adult learning centres, alternative learning / programing centres? What could happen to our division if the enrolment continues to decline? Could SJSD be amalgamated with another school division? I commit to be proactive, creative and strategize with the school board and the community in ways of increasing enrolment rates and to avoid a possible amalgamation of SJSD with another school division. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

i. Exploring the implementation of a partnership(s) with health care agencies – and not using education funds. Currently there are no primary health care education/ services within the school division. This could include but not be limited to occupational therapists, physical therapists, and nursing services. I have a successful history of negotiating these kinds of partnerships within the community.

ii. The development of a student advisory committee bringing youth from all middle school and high schools within the division so they, as “consumers”, can express their views/concerns to the trustees. This will allow for a more open and accessible Board and possibly encourage more youth participation in community politics. 

**Do you have any other comments regarding your candidacy?** 

I believe that any School Division Board should have a knowledgeable and varied representation, as varied and diverse as the community they represent. 
I believe my many years of experience as Registered Psychiatric Nurse, a successful advocate, and my vast involvement and understanding of Board governance are well suited for the role of School Board Trustee. 
My knowledge of the health care system(s) and social services within Winnipeg and within Manitoba would be a definite asset to the St. James-Assiniboia School Board.  

I will work hard to improve our school system and fight for the rights of all students, families and residents of St. James-Assiniboia School Division. To ensure that students will graduate from a high quality, accessible, publically funded school system. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Scott Johnston', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Having been elected in past to the St. James Assiniboia School Board I have a full understanding of the commitment. 
I was unable to seek re election in 2006 as I could not give the board the time commitment needed. 
In the past four years I have been able to fulfill obligations and eliminate some job demands.
I am fully aware of trustee obligations and am prepared to take up and meet the challenges ahead.

**What experience will you bring to complement your role as school trustee?** 

I run a successful small business which has taught me a great deal.
I have been elected Trustee for the King Edward Deer Lodge Ward. (1986 – 2006)

**What are the major issues you would like to stand for and why did you choose these issues?**

Educational Financing – This is a major challenge for all School Divisions. We must continue to evaluate our operations and spend wisely.

Determining Assessment – The Provincial Government will be determining their direction on this issue. The Board will have to work with the administration to interpret and implement that direction.

St. James Assiniboia School Division will have to continue to address a decline in enrolments. We must continue assess our operation and seek ways to constructively address the issue. We may have initiate further school reviews.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would encourage greater emphasis on reading literacy support programs in                                                                               
primary grades.

I would encourage our High Schools to create enhanced High School career   orientation. I believe career motivation will help counter the rate of drop out.

**Do you have any other comments regarding your candidacy?** 

The St. James Assiniboia School Board will see a significant change. Four of nine Trustees are not seeking Re Election. 
I believe my experience and understanding of our School Division will be an asset to a new School Board. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ed Hume', office_address: '', phone_number: '', email: '', image: nil, website: 'http://ehume.wordpress.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

This is my first opportunity to run as a school trustee.  I have been a resident of this community since 1976 and have taught my whole career (33 yrs.) in St. James.  Now I feel it is time to give back to a community, I love, by serving as an elected school trustee to bring about positive changes that would benefit, our residents, teachers and students.        

**What experience will you bring to complement your role as school trustee?** 

I feel I bring a wealth of experience to the school board.  Having taught in St. James for 33 yrs. and substituted in all of the city of Winnipeg school divisions for the last 4 years since retirement, I have an intimate knowledge of what happens in classrooms.  I have taught at every level from Kindergarten to Grade 12 (Senior 4) while substituting.  All three of my daughters went through from K – Grade 12 in St. James, which gives me a parent’s perspective of our system. I have attended almost every school board meeting over the last 3 years to better understand how the system works.  

**What are the major issues you would like to stand for and why did you choose these issues?**

* Make our schools safer and healthier for all students by encouraging more public discussion and student input on bullying, violence, alcohol and drugs. (see [ehume.wordpress.com](http://ehume.wordpress.com) for more details).
* Some organizational by-law changes are necessary to make the school board more open, transparent and accountable to the public [ehume.wordpress.com](http://ehume.wordpress.com)  
* With the retirement of many teachers now there is a need for more mentoring/training programs for new teachers and new principals.
* Wiser use of existing money so as to avoid raising taxes where possible.
* Institute a credit/money management course for all high school students. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

* All schools in St. James need full day caretakers like all other Winnipeg school divisions currently have (see [ehume.wordpress.com](http://ehume.wordpress.com) for more details).
* More empowerment and encouragement for our teachers by making sure they are able to get the necessary support and materials in the classroom.
* Greater involvement of school trustees in their schools.
* More fitness opportunities for all students. 
* Credit/money management course for all high school students.

**Do you have any other comments regarding your candidacy?** 

The best education happens when we (trustees, administrators, teachers, students, parents and other community residents) all work together as a team, which is my vision.  If you have any questions/concerns contact me at 888-9308 or <edrhume@gmail.com>.  Thank you and may I ask for your support on Oct 27th^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jennifer Lawson', office_address: '', phone_number: '770-8372', email: 'jlawson4trustee@gmail.com', image: nil, website: 'https://sites.google.com/site/lawson4trustee/', council_site: '', facebook: 'http://www.facebook.com/pages/Jennifer-Lawson/147323055305439?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have been interested in serving as a school trustee for many years, but this 2010 civic election provided perfect timing for me personally. I have recently completed my PhD in Educational Administration, which was a very demanding and time-consuming endeavour. With this degree completed, and with working only part-time on my other professional duties, I have the flexibility and time to offer in order to serve as a school trustee.          
Another reason that I chose to put my name forward is because several of our experienced trustees on the St. James-Assiniboia School Board are not running in this election. I believe that with my extensive experience in the field of education, I have the ability to help fill the gap left by these educational leaders. Two of the retiring trustees, Bruce Alexander and Peter Carney, have endorsed me as a candidate, which is an honour because I admire the work they have done on behalf of the students, families, and schools in our area.
Finally, I chose to run in this election because I have the support of neighbours, acquaintances, and professional colleagues who believe that I have the skills and experience to serve our schools and community.

**What experience will you bring to complement your role as school trustee?** 

The experience I bring is three-fold. First, I am a life-long resident of St. James, and therefore I understand the community, its schools, and its residents. I lived in this community as a child and attended school in Deer Lodge. Now, my husband and I are raising our children in the same community, and they, too, are attending schools here. This is the second area in which I bring experience, as I view the needs of the school system through the eyes of a parent. I am strongly committed to ensuring that all children are provided with every opportunity to meet their potential academically, and to develop the skills of good citizenship. I believe that being a parent of school-aged children will give me a distinct outlook as a school trustee. Finally, I am an educator by profession. I have been a classroom teacher and resource teacher, as well as a consultant and principal. Now, at the University of Manitoba, I train students to become teacher. This experience provides me with the knowledge to better understand the needs of students and schools.

**What are the major issues you would like to stand for and why did you choose these issues?**

If I have the privilege of serving as School Trustee for the Deer Lodge/King Edward Ward of the St. James-Assiniboia School Division, I make the following commitments to the citizens of our community:

* Support all students in meeting their potential through effective educational programs, including academics, the arts, athletics, trades programs, and special education.  
* Seek ways to serve an increasingly diverse community population.  
* Promote lifelong learning for students, staff, and community members.  
* Encourage connections between schools and the community, through continued use of school facilities for family centres, child care, recreation programs, and community organizations. 
* Keep the needs of the students and community first. In the role of a trustee, the word “trust” must be maintained as the focus of the job. The needs of students and the community must always stay at the forefront of decision-making.
* Maintain fair and equitable school taxes.
* Ensure open and honest communication with residents of the community. I am committed to being accessible to all members of the St. James-Assiniboia community in order to answer questions, discuss issues, and resolve concerns.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I am not running as a candidate for School Trustee because I have one burning issue, or one dispute with our local school system. On the contrary, I believe that students in St. James-Assiniboia are privileged with exemplary schools and teaching staff. I also believe that our residents are fortunate, in that taxpayers in this Division pay the lowest school taxes in this city. This successful balance must be maintained in order to meet the needs of both students and taxpayers. This is the reason I am a school trustee candidate - to maintain and enhance an already effective school system.

**Do you have any other comments regarding your candidacy?** 

I welcome interested people to contact me if they have any questions about my campaign or about the schools in St. James-Assiniboia. I can be reached at:
Phone 770-8372
Email  jlawson4trustee@gmail.com
 
I have also developed a website at which voters can access more detailed information about me, my background, campaign, and election commitments. I welcome all Winnipegers to visit this website at:
 
[https://sites.google.com/site/lawson4trustee/](https://sites.google.com/site/lawson4trustee/)^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Roxane Delbridge', office_address: '', phone_number: '', email: 'reelectroxanedelbridge@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Kirkfield - St. Charles', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Ted Hull', office_address: '', phone_number: '896-6740', email: 'ted4trustee@tedhull.ca', image: nil, website: 'http://www.tedhull.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

My wife Lorna and I have lived in the same home in St. James for over 37 years. I graduated from St. James Collegiate and both my children graduated from John Taylor Collegiate. Both children went on to become teachers due in no small part to the input and impact of their teachers. Now I have two granddaughters attending elementary school in Westwood. I want them to have the same great experiences that their parents and grandparents have had. So I believe it is my turn to give back to the community and specifically the school division that has had such a great impact on my family. With the retirement of some long-term trustees there is an opportunity to bring fresh eyes to see opportunities, fresh ears to hear from all the stakeholders in the division and a fresh voice to speak on behalf all the constituents of St. James-Assiniboia.  

**What experience will you bring to complement your role as school trustee?** 

My experience and expertise are in the area of board governance. I understand the role of a trustee as being one who is entrusted with the educational resources of a community and with the responsibility to steward those resources as diligently and wisely as possible.  Currently I am an independent consultant that facilitates not-for-profit organizations in their governance processes as well as assist boards in relating effectively to management. 

**What are the major issues you would like to stand for and why did you choose these issues?**

School boards, taxpayers and service providers, including employees must always keep in mind that the same dollar cannot be spent twice. Once a decision is made to spend a dollar in a certain way that is one less dollar that can be spent on something else.

The major issues requiring significant board attention over the next few years are:

* Aging school buildings:  As school buildings get older, more money will need to be allocated to the maintenance and upgrading of facilities. We do not want schools that are perceived to be rundown and outdated. 
* Lifting the moratorium on school closures: When this occurs the School Board will be required to once again address the issue of school closures. Schools that are significantly underutilized can affect class sizes and the effective use of educational dollars. Trustees must avoid the temptation of parochial decisions rather than taking into account the impact that closing or keeping a school open has on all the residents of the school division. 

I will not be a trustee who seeks to advance a personal agenda or a pet theme. My stand will be based on the combined interests of all stakeholders in the division. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

* To see St. James-Assiniboia as a community where people will want to live because of the reputation of great schools with a reasonable educational tax rate
* To provide an environment where quality teachers see St. James-Assiniboia as a great place to teach 
* To ensure that our schools are technically progressive and cutting-edge as well as physically state-of-the-art
* To insist on strong leadership that is driven by careful consideration of the input of everyone in the community. 

**Do you have any other comments regarding your candidacy?** 

A trustee must be open to listening to every stakeholder in the community. Then he or she must be willing to engage in knowledgeable and robust debate while at the same time considering the input and opinions of other trustees. While the board is a group of individuals, it must operate as a single entity with the best interests of all stakeholders in balance. 

My experience in working with teams and boards qualifies me to contribute effectively to the board process. Effective board governance will facilitate an environment where students at all scholastic levels are empowered to graduate with the confidence that they can succeed in whatever endeavours they pursue. My experience in working with teams and boards qualifies me to contribute effectively to the board process. Effective board governance will facilitate an environment where students at all scholastic levels are empowered to graduate with the confidence that they can succeed in whatever endeavours they pursue. 
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Bruce Chegus', office_address: '', phone_number: '', email: 'bruce.chegus@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am an incumbent trustee. I continue to enjoy serving my community as a school trustee.

**What experience will you bring to complement your role as school trustee?** 

With my business background, I am able to provide a technical insight on many issues based on my experience in the private sector.

**What are the major issues you would like to stand for and why did you choose these issues?**

Succession planning - the Board requires leadership to ensure that high quality appointments are made for school administrator positions that will be opening up due to retirements.

I chose this issue since it will be a critical factor in ensuring the success of our Division going forward. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

Our school buildings are in good repair, that said, since all are over 40 years of age capital improvements will be necessary to ensure that our buildings and grounds are maintained in keeping with 21st century standards.

**Do you have any other comments regarding your candidacy?** 

Our Board will be losing a number of experienced trustees who decided for various reasons not to run in the 2010 election. It will be important to elect experienced trustees to the Board to provide leadership and to assist the trustees who will be newly elected to learn the 'ins and outs' of their new role^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Cheryl Smukowich', office_address: '', phone_number: '', email: 'reelectsmukowich@hotmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Sandy Lethbridge', office_address: '', phone_number: '', email: 'sandylethbridge@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run for school trustee because parents with children in our schools need a voice.  

**What experience will you bring to complement your role as school trustee?** 

I have been active in the community including volunteering as a board member at the daycare centres my daughter attended – Fairlane Children’s Centre and Lakewood Children's Centre.  I was a member of the Parent Council at Lakewood Elementary for six years.  For many years I volunteered Friday evenings to chaperone the pre-teen and teen dances at the Assiniboia-West Community Centre, as well as volunteer duties at many different events held at the community club.  My daughter sings in the St. James Divisional Senior Choir and I have chaperoned multiple choir field trips and events.  I have been the fundraising co-chair for the St. James-Assiniboia Divisional Choirs for three years.  I held positions of President, Secretary and Treasurer on the board of directors of Winnipeg Condominium Corporation #1 (Birch Park Condos) for 15 years.

**What are the major issues you would like to stand for and why did you choose these issues?**

I am passionate in the belief that our children need to feel safe while at school and should want to be at school.  There must be a broad range of programs offered to our students including the arts, sports and special education.  It is vitally important that our children are provided with the best options available.  Our children must be properly prepared to transition into the world after they graduate from our high schools.  These are major issues that have been discussed with constituents in my ward.  

**Is there anything in particular you would like to change in your school division? In your ward?** 

I am a candidate for school trustee and currently unable to answer that question.  All the needs and issues must be discussed prior to a decision.  

**Do you have any other comments regarding your candidacy?** 

I grew up Crestview and live in St. Charles.  My parents and sister also still live in the area.  I attended Buchanan Elementary, Hedges Middle School and John Taylor Collegiate (graduated in 1981).  My daughter attended Lakewood Elementary, Hedges Middle School and is currently attending John Taylor Collegiate.  I have been married 25 years to Grant Lethbridge.  I have been employed full time for 16 years at Western Canada Lottery Corporation as an Executive Assistant^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Eric Holland', office_address: '', phone_number: '', email: 'erichollandelection2010@shaw.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I believe a society such as ours here in Canada has developed into one which is the envy of many countries around the world due to our people becoming involved in our communities and “giving something back”.  Karen and I have been married for almost 28 years and from the start of our marriage we have involved ourselves in community and charitable organizations and then after having our children we also spent a great deal of time volunteering in their schools, band and choir programs and sports teams.  I have been asked why I have chosen to run for Trustee now that my children have graduated and moved on to university.  I actually found that question to be a bit odd.  Do we only become involved or offer assistance when there is something in it for us?  That is certainly not my view.  When our daughter Samantha and son Justin were young and attending school, my time was spent simply trying to be the best Dad I could be.  I think I have learned a few things along the way and I would like to continue giving back to this terrific community as a School Trustee.

**What experience will you bring to complement your role as school trustee?** 

I have spent most of my adult life employed by the Province of Manitoba.  For the last 14 years I have been in an administrative position which provides me with the opportunity to work on many committees and projects.  I have developed some of the skills necessary to navigate the often cumbersome system of government.  As well, my duties include researching best practices in other jurisdictions and adapting those to work in the Manitoba environment.  Our schools must remain progressive and I would like to use my skills to do the research necessary to determine what innovative things are working well elsewhere and bring some of those ideas home to implement in our School Division.

**What are the major issues you would like to stand for and why did you choose these issues?**

* I believe budgets must be more closely examined and questioned.  With declining school enrolments and an aging population in our Division, raising school taxes cannot be the only remedy to balancing the books.
* I would like to complete a review of the purchasing practices of the Division to make certain we are getting maximum benefit from each dollar spent.  I work in the procurement field and therefore I am confident I have the skills to undertake this review.
* I believe our School Board must be transparent in all aspects of what it does.  If a parent or resident has an issue or concern which is important to them, the Board must be straight up when responding and openly provide the information they are seeking.  There is no place for “secrets” on an elected and publicly funded board.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to see an innovative, exciting and rewarding education environment which is talked about around the province and one which attracts the brightest educators and families looking for the best public education system available to their children.

**Do you have any other comments regarding your candidacy?** 

I feel I can bring a fresh approach to the way the Board does business.  As an elected member of the Board I will recognize that I am accountable to students, parents, staff, taxpayers and the community as a whole.  I believe the Board must never allow itself to become stale and must strive to have our Division remain on the cutting edge and always be relevant.  In order to encourage our students to remain in school and to do their best to positively impact their world, we must provide the opportunities, programs and incentives which encourage this.  Our children must always feel significant and never marginalized or be permitted to “fall through the cracks”.

 

I will consider it a privilege if the residents of Kirkfield/St. Charles choose me to represent them on the Board of the St. James-Assiniboia School Division.  ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Teresa Pitzel', office_address: '', phone_number: '', email: 'pitzel4trustee@gmail.com', image: nil, website: 'http://sites.google.com/site/teresapitzelfortrustee/', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100001646891379', twitter: '', youtube: 'http://www.youtube.com/watch?v=uhRWS-Yio_I', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I feel it is good to give back to the community by serving the taxpayers on the School Board.

**What experience will you bring to complement your role as school trustee?** 

I am a retired secretary (28+ years) of the division.  I have worked at every level - elementary, junior, high schools and at the Board Office.

**What are the major issues you would like to stand for and why did you choose these issues?**

Personal safety for everyone in our buildings.  Violence, bullying, etc. is everywhere and needs to be addressed.   Building/grounds maintenance.  Our buildings/grounds are getting old and need repair.
All students getting resources to succeed.  We have to ensure funding is directed to get the tools students deserve - textbooks, educational assistants, library materials, lab supplies to name a few examples.

**Is there anything in particular you would like to change in your school division? In your ward?** 

The budget process is what I would like to see overhauled.  I would like to hear from my ward's residents as to what their main concern is.

**Do you have any other comments regarding your candidacy?** 

I simply want to state that I just want to make a difference.  I have the time to devote as an effective school trustee^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Silver Heights - Booth', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Bryan Metcalfe', office_address: '', phone_number: '', email: 'brymet@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Rockford McKay', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have decided to run for re – election in the Silver Heights Booth Ward because I wanted to continue working as a team member with other trustees offering the best quality education for our children. I have spent nearly half my life as an educator seeing the benefits and opportunities an education can give to our youth. I value and believe that our public education system provides equal access to all, and gives everyone opportunities to succeed in our society.
As a contributing team member, I feel that my background and experiences can add to the strength of our board. 

**What experience will you bring to complement your role as school trustee?** 

I will bring many experiences to compliment my role as a school trustee. I have been an educator for over 20 years. I have been a classroom teacher, curriculum consultant, and school trustee. I have three daughters in the public school system. Presently, I have a daughter in elementary, a daughter in middle school, and another daughter in high school; so I feel that I have a good understanding of the situation in our classrooms. I am involved with our community and speak with many other parents, educators and community members, so I feel I can be a strong advocate for our community.

**What are the major issues you would like to stand for and why did you choose these issues?**

I believe in a strong local school board. A local school board can provide the best experience for students that reflect the unique characteristics of our community. As school board members, we live in the community and understand what is important to our parents, children and other community members. A strong local school board can provide for these local choices. One such example in St. James – Assiniboia is that 70% of our students from grades k – 12 participate in the performing arts. With this high interest, our local school board can provide resources and programs to address this need. These resources and programs may not be available otherwise. Other programs such as French Immersion, Early Childhood education, and Special Needs education although not uniquely found in St. James – Assiniboia can have unique characteristics that reflect our local character.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Over the years, there has been a shift towards driving our children to school instead of having them walk to school. With the fear for their safety, this has been a sign of the times. Along with this increase in vehicle traffic around our schools during student pick up and drop off, the risk of accidents to our children is increasing. To help lower this risk of accidents, I would first like to see a program or way for our students to safety walk to school once again. If students must be driven to school, I would like to see safer drop offs and pick up locations. This will not only provide for a safer environment for our children, but will help ease the congestion of traffic around our schools. Our school board has already begun to address this issue, but needs to get more resources to address this issue quicker. I don’t know if more or better drop off/pickup loops are the answer to this situation, but it needs the partnership of not only the community but the municipal and provincial governments as well to address this problem.

**Do you have any other comments regarding your candidacy?** 

I believe that our schools must not only prepare our children to succeed in our society but must also be able to compete globally. Our country is changing quickly. One of the major changes is our shift away from the manufacturing sector to a more service based economy. If we are to grow and prosper as a country, we must continue to be innovators. I believe that our schools must enhance our student’s experiences in the areas of math, science and technology. In the early 1990s, I can recall hearing that by 2010, about 95% of the skills needed in the work force will require math, science and technology skills and attitudes. I find it difficult to think of many jobs that do not require these skills and attitudes. With our need to address the problems associated with our environment, health and future energy needs, we as a society must not only concentrate on literacy, but must become scientifically literate as well. To compete and prosper on a global stage, we must be innovators. This goal of becoming innovators must start at our local school system^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Craig McGregor', office_address: '', phone_number: '', email: 'craigjen@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Cheyenne Green', office_address: '', phone_number: '', email: 'cheygreen@gmail.com', image: nil, website: 'http://www.cheyennegreen.ca', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100001535984613', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Craig Johnson', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
division = Region.create!(name: 'Seven Oaks', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: '2', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 4)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 4)
person = Person.create!(name: 'Cory Juan', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am at present a trustee in the School Division. I decided  to be re-elected as a school trustee in 2010 because  it is important for me to help the people in the community in terms of the education of their children. I am a team player, task oriented and a trustworthy person.

I can continue to work with the other trustees  in a very collegial  and respectable manner to achieve the Seven Oaks School Division’s objective and philosophy of having a vibrant community  with active  learners  regardless of color, sex  religion and economic status.

**What experience will you bring to complement your role as school trustee?** 

As a retired  teacher  I bring a wealth of experiences as a school administrator, classroom teacher, project manager and above all looking after the management of the school budget, physical resources, buildings,  discipline and programs necessary to meet the needs of our students in the Seven Oaks School Division. Moreover, my ability to listen and understand parents’ concerns and problems regarding their children serve as linkage to the   Superintendent’s office.  I am  married for 44 years with two lovely children and  two beautiful grandchildren. All of them experienced to be in this wonderful School Division.

**What are the major issues you would like to stand for and why did you choose these issues?**

The major issues  that concerns me most are the overcrowding schools which results to the additions  of portables in some schools. The average funding of every student in the province which Seven Oaks School Division  does not get it to be able to meet the student’s  needs   Bullying in and outside the school premises has to be viewed seriously. Special Education programs have to be re-evaluated  continuously. School Speed  Zone  is another concern that parents have brought to my attention.  

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to se all parents and students in the school division to have awareness on “ sustainable global environmental education “. It is an integral institution of learning for all citizens of the world.

 We also have to look seriously at partnership with other institutions in our community.  To be able to have a vibrant and ever progressive community, we  have to work together, promote understanding and better relationship, amongst others, so we can be models to our children.

**Do you have any other comments regarding your candidacy?** 

As a trustee candidate, I am confident to communicate with the people, listen with their concerns regarding their children . I am able to take their concerns  to the attention of the school board. .Mostly of the people in our community whom I talk with are pleasant, respectful and understanding. The  Seven Oaks School Division is the fastest growing community in the province. Being a Filipino Canadian,  I am very  proud to be  the representative of this multi-diverse community.  ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Derek Dabee', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ben Bansal', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Kai Schioler', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Bill McGowan', office_address: '', phone_number: '', email: 'bill.mcgowan@7oaks.org', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ric Dela Cruz', office_address: '', phone_number: '', email: 'delacruz.ric@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Since I left the School Board in year 2002, Ward 2 students population grew and the needs in enhancement of their eduction must be address so as to prepare them and able to face the challenges of tomorrow.Again, I would like to contribute in a little things for the betterment of our childrens education and the society.

**What experience will you bring to complement your role as school trustee?** 

* Chairperson and School Trustee Ward 2 of Seven Oaks School Division # 10
* Seven Oaks General Hospital / Wellness Institute -  Board of Trustees
* Crown Corporation Council / Oversight Provincial Government Board - Council Member
* International Centre of Winnipeg- Board of Director
* Com-Span Incorporated - Adult Day Program for Special Needs - Board of Director
* Folklorama - Philippine Pavilion-Coordinator.
* Certified Canadian Immigration Consultant
* Fellow of the Canadian Migration Institute

**What are the major issues you would like to stand for and why did you choose these issues?**

* Invest more on technology - Computer Laboratory and Smart Board
* Capital Project - Some schools are overcapacity
* Advocate for equitable school funding from the provincial government

**Is there anything in particular you would like to change in your school division? In your ward?** 

Another 1000 houses will be built in the Northwest part of the school division and similar number of houses to be built in Riverbend and Rivergrove area. I would like to contribute in building these areas in efficient and serving the needs of our future students.

**Do you have any other comments regarding your candidacy?** 

Every citizen is part of our society and bonding together, great things will happen^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Dennis Ruggles', office_address: '', phone_number: '', email: 'dennisruggles@7oaks.org', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '3', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 4)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 4)
person = Person.create!(name: 'Teresa Jaworski', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Claudia Sarbit', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I enjoy my involvement as a school trustee and feel I make a difference.. I am committed to giving children a well rounded education where each  child can reach his or her full potential and go on to become contributing members of society.  We have no other choice than to believe that every child can achieve success, will graduate from high school and go on to live fulfilling lives.   Excellent teaching, strong academics, arts, music, physical education, sports programs and a variety of optional and after school programs are vital to an enriching and enjoyable school experience.

**What experience will you bring to complement your role as school trustee?** 

a. Former teacher   

b. Long term trustee- presently Chairman of the Board having served on most committees including  Co-chair Workplace, Safety and Health, Co-chair-Board- Teacher Advisory  and Chair of the Policy Committee.

c. Past President H.C. Avery Parent Council

d. Founding Member and President of the Seven Oaks Education Foundation

e. Founding Board Member of  the Kildonan Youth Activity Centre

f. Registered Parliamentarian-expertise in Board meeting procedures

g. Active volunteer having received the Federal Commemorative Medal for Community Service

h. Presently serving on the Civic and Legislative Committee of Winnipeg Realtors where we lobby politicians on various issues to improve the city.

i. Past board member of the Manitoba School Boards Association 

**What are the major issues you would like to stand for and why did you choose these issues?**

a. Equitable funding for students and fairness to taxpayers.  Students’ education should not be affected by the school division in which they reside.  Seven Oaks is a bedroom community with a low commercial tax base. This year because of our lobbying efforts with the provincial government, we were able to access the Tax Incentive Grant which enabled us to freeze taxes and maintain much needed programs for our students.  We need a fairer funding formula plus less reliance on property taxes to fund education.

b. Increasing the percentage of students who graduate from high school and go on to post secondary institutions with a special emphasis on aboriginal youth.
 
**Is there anything in particular you would like to change in your school division? In your ward?** 

a. Ideally, children should have the same opportunities in a public school system regardless of economic circumstances.  For example: not charging for noon hour supervision, reducing the cost of school supplies for students, enabling all children to participate in field trips, free breakfast programs in our schools.

b. We need a more stable funding model across the province for special needs students. Presently there is not adequate support for these students in our division.

c. Expanding the Bright Futures Program into our ward. It is currently a very successful after school volunteer tutoring and mentoring program for students in the Maples.

**Do you have any other comments regarding your candidacy?** 

I would like to thank our community for their support over the years and their interest in the welfare of our students. We have a very dedicated team of teachers, administrators, and support staff. I have always been proud to be a trustee in  Seven Oaks School Division.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Edward Ploszay', office_address: '', phone_number: '', email: 'edploszay@yahoo.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Richard Sawka', office_address: '', phone_number: '', email: 'richard.sawka@7oaks.org', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
division = Region.create!(name: 'Winnipeg', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: '1', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Rita Hildahl', office_address: '', phone_number: '414-7706', email: 'info@ritahildahl.com', image: nil, website: 'http://www.ritahildahl.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

My reason for running in this election is because I want to make a meaningful contribution to our young people and society. I hope to continue serving our community by working with parents, educators, administrators and trustees to develop policies and programs that will increase student success.

**What experience will you bring to complement your role as school trustee?** 

Although I'm an educator by profession, I have been a businesswoman as well as a volunteer in our community. Furthermore, I have four adult children. These experiences have impressed upon me the need for a strong and constantly evolving education system. 

**What are the major issues you would like to stand for and why did you choose these issues?**

The board needs to be innovative and support new approaches to programs and services. Thanks to excellent administrators, teachers and support staff, the Winnipeg School Division has the ability to advance and continually transform itself. 

I strongly endorsed the Winnipeg School Division Board of Trustees Educational Priorities 2010 to 2013:

* To strengthen instructional and assessment strategies for all students using all available resources including the integration of technology.
* To improve academic and behaviour support services for students with special needs (in accordance with the Standards for Student Services).   
* To strengthen and enhance Education for Sustainable Development initiatives that address environmental, social and economic issues worldwide.
* To further improve school attendance and graduation rates through the exploration of additional programs and strategies. 
* In addition to these four priorities I will work toward adding a fifth priority: that the Winnipeg School Division and the Province of Manitoba work together to develop full day optional nursery and kindergarten programs.

The above priorities will provide deep-rooted benefits for our young people, our society and our world.     

**Is there anything in particular you would like to change in your school division? In your ward?** 

We need more student success. We need stronger public engagement in our education system. 

**Do you have any other comments regarding your candidacy?** 

It has been an honour to serve as a school trustee and it would be a privilege to serve one more term.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Joyce Bateman', office_address: '', phone_number: '799-8855', email: 'JoyceBateman@mts.net', image: nil, website: 'http://www.joycebateman.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run in the 2010 election as a school trustee to ensure that we continue effective partnerships with the Winnipeg Foundation, the University of Winnipeg and the University of Manitoba, in the service of the students in our care.

With these partnerships I have supported a number of key initiatives as your school trustee including:

* The Creation of the Community –based Aboriginal Teacher Education Program in partnership with the University of Winnipeg
* The Dufferin School Project, in partnership with the Winnipeg Foundation and many public and private participants
* Significant energy saving programs have reduced costs and the Division’s carbon foot-print
* The development of a state-of the-art science lab at Niji Mahkwa School in partnership with the Winnipeg Foundation and the University of Manitoba
* Restoring the Nursery Program of the Winnipeg School Division to the full school year

Running in the 2010 election allows me the opportunity to continue this work.


**What experience will you bring to complement your role as school trustee?** 

To complement my role as school trustee, I bring my experience as a chartered accountant, my experience as a federal public servant managing federal-provincial partnership agreements at Western Economic Diversification and most recently, three years experience as the executive director of the Manitoba Federal Council.

I am the mother of two children, both of whom have embraced the Winnipeg School Division for all their grades.

While serving on the Winnipeg School Board, I was chosen by my colleagues to serve as the Chair of the Board for two terms, the vice-Chair of the Board, the Chair of the Policy committee for three terms, and to serve as the Boards’ representative on the Manitoba School Board Association.

I have participated regularly with parent-led committees like the South-End Advisory Committee ensuring the parent voice is heard and I have learned much from parents in the process.


**What are the major issues you would like to stand for and why did you choose these issues?**

Since first being elected, I have made it a top priority to develop an environment in our schools where students can realize their full potential.  In my experience, the best way to achieve this goal is to work in partnership with parents, teachers, students, school administrators and the community.

I will continue to develop more sustainable and cost-effective business practices in the division, as I have done consistently in the past, enabling cost reductions and savings achieved to be redirected to the classroom.

My record is one of accountability.  Accountability continues to be an issue for our division and I am committed to being accountable; to our students by providing a learning environment where all students can realize their full potential; to our parents by providing a safe environment so your children get the education they deserve; to our teachers by providing the support and tools they need to educate our children; to all of our over 5,000 employees by providing and maintaining a respectful and productive workplace; and to our taxpayers by ensuring tax dollars are wisely invested to achieve the greatest benefit for our community.


**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to see changes to the following key issues:
	
* Graduation Rates - We have to determine how we can support the children in our care who are struggling to graduate.  Current processes have to be reviewed and improved for populations of students with less success than others.  We are partnering with such groups as Pathways to Education Canada to enhance success rates and we always work in partnership with the many service agencies of the Provincial government as they support various at-risk students and their families.
* Supporting the needs of immigrant children - We have a provincial government successfully utilizing immigration as an economic driver for the Province.  That is wonderful for our economy.  Many of the immigrant families reside in the Winnipeg School Division and we have a responsibility to ensure that their children are given the tools they need to ensure they will be net contributors to our society.  Of the immigrant population we serve, some of the students have never lived anywhere other than in a war-camp.  This necessitates some incremental investments in their transition.


**Do you have any other comments regarding your candidacy?** 

There are a few other issues I would like to deal with if my candidacy as a school trustee is successful.  

Ensuring adequate Succession Planning for the Division:

* We have a responsibility to adequately plan for the succession needs of the division.  
* Lack of such planning could result in costly future errors.
* I believe that we need to enhance our approach to succession planning.  We need to ensure that we transfer the vast store of knowledge of our retiring employees to the next generation of employees.

Provincial Bargaining:

* Provincial bargaining is an opportunity for significant administrative cost saving in every school division province-wide and significant cost saving for the Manitoba Association of School Boards. 
* The Manitoba Teacher’s Society is on the record supporting provincial bargaining.  We currently have 37 School Divisions in the Province conducting their own negotiations.  All settlements result in roughly similar results province-wide given the possibility of arbitration.  Manitoba taxpayers would be well served with just one negotiation process and this would happen if all school divisions listen to the Manitoba Teacher’s Society and support provincial bargaining.  ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jackie Sneesby', office_address: '', phone_number: '', email: 'jackiesneesbyforschooltrustee@hotmail.com', image: nil, website: 'http://www.jackiesneesby.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I ran for school board in 2006 and thought it would only be for one term to help improve education for children in the Winnipeg School Division but the more you become involved the more opportunities you see to improve education.  I moved the no smoking motion ban in the Winnipeg school division and it passed in Feb/07’ .  From there I moved on to other issues I felt were important like getting junk food out of school vending machines. Most of all working on how to graduate students ready to meet the world and its challenges. 

**What experience will you bring to complement your role as school trustee?** 

I am experienced as a mother, with children who have graduated from the Winnipeg School Division.  I am very proud of the division  and in my business career I was exposed to countries without a public school system. The countries are weak and their children are unable to reach their true potential. My business experience included problem solving, collaborating and teaching  in order to solve problems.  These skills helped me build the Manitoba Theatre for Young People at the Forks  and other challenges in my volunteer life not just my business life. 

**What are the major issues you would like to stand for and why did you choose these issues?**

The major issue I stand for is educating children from the time they are born until they reach their goals in the  their choice of careers.  I believe we need  someplace mothers can go with their young  children to socialize and support other children and mothers preferably in schools when possible. I want to see daycares and nursery schools with educational opportunities so children  are prepared for Kindergarten and Grade 1. I would like to see support for all children before school, after school whenever it  is possible to make sure they have a level playing field to start school and that they always access help when it is needed.  This is the only way to make our society strong and our children successful.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I think the Winnipeg School Division  provides many programs to help children get the necessary education but we can always improve.  When every child  reaches their true potential we will have succeeded.  I believe  we should continually be monitoring and improving all programs and training our staff to be even better at their tasks.

**Do you have any other comments regarding your candidacy?** 

In the school budget for 2010  while I was chair of the school board we sustained programs and services for students and kept the education property tax levy at the 2009 level through expenditure reductions further cost control measures, accessing the provincial tax incentive grant and the use of reserve funds. If you would like a copy of my brochure or ask any questions I can be reached at: <jackiesneesbyforschooltrustee@hotmail.com> or call  489 3277.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Kevin Freedman', office_address: '', phone_number: '', email: 'KevinFreedman@hotmail.ca', image: nil, website: 'http://www.kevinfreedman.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Kevin-Freedman-for-School-Trustee/119975331389154?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Johnny Salangad', office_address: '', phone_number: '', email: 'j.salangad@yahoo.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run in the school board election to help foster ideas, programs and policies which affect our students, educators and the Winnipeg School Division (WSD) community.  It is my hope to serve the populace of the WSD in order to promote a diverse and excellent education for its students while being accountable to the taxpayer.

**What experience will you bring to complement your role as school trustee?** 

I believe that continued education is a life-long learning endeavor.  My engineering profession has instilled this value and as such I know how critical the decisions made on WSD programs and policies will affect the success of our members in an evolving education system. I wish to make objective contributions towards these decisions and be responsible to the interests of all wards of the WSD.

**What are the major issues you would like to stand for and why did you choose these issues?**

From the many issues facing the WSD I believe these four are priority:

1. Improve student attendance and graduation performance.
2. Capital projects including expansion and renewal using sustainable and renewable processes.
3. Ensuring programs are in place to aid in the success of our diverse student backgrounds of social, cultural, economic and special-needs.
4. Property tax evaluation.

**Is there anything in particular you would like to change in your school division? In your ward?** 

It is essential we encourage increased public involvement in the developments of the WSD board; this includes educating the public how policies and programs affect them.

**Do you have any other comments regarding your candidacy?** 

I continue to educate myself and bring my best efforts towards being a potential school trustee.  This is my first campaign to serve in this capacity of a responsible candidate. I am open towards new ideas and thoughts while bringing a fresh perspective on WSD issues.  I wish my fellow candidates good luck and hope every voter has the opportunity to vote in the civic election^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '2', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Rolf Salfert', office_address: '', phone_number: '', email: 'rsalfert@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

* I recently retired from the teaching profession in June, 2010. 
* I believe I have the combination of knowledge, experience and the educational background  required to deal with the many different issues facing the school division.
* After teaching for 33 years in Ward 2 of the Winnipeg School Division, I’m convinced that I can continue to make a positive contribution to the school division as a trustee on the school board.   

**What experience will you bring to complement your role as school trustee?** 

* Having worked in a junior high, senior high or elementary setting has shown me a great deal of what issues teachers face on a consistent basis. 
* Being a classroom teacher for 33 years can only be considered an asset when talking about the role of a school trustee.  
* I would hope that people are looking for a voice of experience, from the field of education, to be a trustee on the school  board. 

**What are the major issues you would like to stand for and why did you choose these issues?**

* Supporting  Education for Sustainable Development initiatives that address global, environmental, social and economic issues.
* Enhancing instructional and assessment strategies including the integration of technology. 
* Improve academic and behaviour support among special needs students. 
* Continue with Native awareness in addition to introducing Asian awareness. 
* Support dialogue related to additional school division amalgamations.
* Introduce a Canadian ‘Heritage Awareness’ course in the division.

**Is there anything in particular you would like to change in your school division? In your ward?** 

* If Grade Nine students are considered S1 students and earning high school credits, shouldn’t they be attending high school with Grade 10, 11 and 12 students?  Presently, many Grade Nine students are enrolled with Grade Seven and Eight students in Junior High schools. 
* The same applies to Grade Six students who are still in the elementary setting.  Grade Six students are considered ‘Middle Year’ students and they should be in ‘Middle Year’ schools along with the Grade Sevens and Eights.   Let’s eliminate the term ‘Junior High’ since the word usage is no longer relevant.   
* Elementary schools should enrol students from Nursery to Grade 5.
* ‘Middle Year’ schools should include students from Grade 6-8 and high schools should house students from Grades 9-12.  
* The only exceptions would include schools that go from Nursery to Grade 8 and schools that would cater to both ‘Middle Year’ students and high school students. (Grades 6-12) 
  
**Do you have any other comments regarding your candidacy?** 

* Born and raised in the West End.  Attended John M. King, General Wolfe and Daniel McIntyre Schools.
* Taught for 33 years in Ward 2 of the Winnipeg School Division including General Wolfe, Daniel McIntyre, Sister MacNamara and Principal Sparling Schools.
* As a classroom teacher, I tackled my job with zealous zeal and demonstrated resourcefulness, attentiveness to students’ needs and commitment throughout my career. 
* I believe that these qualities, along with my experience in the school system as both an educator and a parent, give me the background needed to make a positive contribution as a trustee. 
* I hope you will be able to support me as your Winnipeg School Trustee for Ward 2 on October 27th. 
* If you wish to contact me, please do so at rsalfert@gmail.co^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Myra Laramee', office_address: '', phone_number: '', email: 'vote4myra.laramee@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

My children and grandchildren have all attended and are presently attending schools in the Winnipeg School Division.  I want to ensure all children have the opportunity to thrive and be successful.  I believe that I have the required experience, commitment and leadership to continue the important work of improving the quality of education for all the students and families in our community.

**What experience will you bring to complement your role as school trustee?** 

I hold Bachelor of Teaching, Bachelor of Education and Masters of Education degrees, and I am currently completing my PhD in Education at the University of Manitoba.  I worked for 30 years with the Winnipeg School Division teaching at Wellington, R.B. Russell and Argyle schools.  As well, I was the Vice-Principal at Hugh John Macdonald School and Principal at Niji Mahkwa School.  I retired from the school division in 2007 and I am presently working as the Director of Education Reform at the Manitoba First Nations Education Resource Centre.

**What are the major issues you would like to stand for and why did you choose these issues?**

The key priorities that I believe in include:

* Inclusive Education – all of our children must feel safe in our classrooms and schools. I am committed to promoting inclusive education for Aboriginal people, newcomers, special needs students and gifted and talented students by advocating for programs and resources to address the learning needs of these students.
* Life-Long Learning – education of our children happens best when family, school and community work together.  I will encourage schools to support life-long learning by working together to develop programs for pre-schoolers, families, adults and seniors.
* Improve High School Graduation Rates – schools cannot provide a quality education for our children on their own.  I will work with community partners to improve high school graduation rates through a range of initiatives including after school tutoring programs, mentoring programs, off-campus programs, summer programs and scholarship incentive programs.
* Education for Sustainable Development – must be on the minds and in the hearts of educators, parents and students now and certainly in the future – Mother Earth depends on us.  Our survival will be based on deepening our understanding and knowledge of human rights, peace, democracy, environmental protection, climate change, health and well-being.


**Do you have any other comments regarding your candidacy?** 

I was born and raised in Winnipeg and I feel deeply about the value of diversity found in our city.  I am a member of the Fisher River Cree Nation.  I am a grandmother, mother, sister and daughter.  My volunteer involvement in the community has included being a member of the board of directors of New Directions for Children, Youth, Adults and Families; and the Prairie Region Elders Council for Corrections Canada.  I have a particular interest in and have done a great deal of volunteer work with marginalized and battered women^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Cathy Collins', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Vote-Cathy-Collins-School-Trustee/154275694593493?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

My volunteer work in my neighbourhood near downtown has taken me into the local schools where I have met with the principals and teachers to talk about issues that impact the schools. They have informed me about their concerns for safety, cleanliness and the loss of housing. These things affect student enrolments and link to local health. Seeing new arrivals to Canada in Central Park and at IRCOM Housing down the street from my home, I know that schools in the inner city face the steep challenge of integrating children from diverse cultural backgrounds and helping aboriginal children succeed. 

Many schools in our wards play a critical role in future economic well-being of inner city families and ultimately of our city: we have a moral duty not to overlook inner city children and children who have special needs. I also want to see the important role of schools and health of children taken into account in neighbourhood planning because this is part of that obligation.

**What experience will you bring to complement your role as school trustee?** 

For 20 years, I have worked in a volunteer capacity because of the ongoing loss of inner city housing. Houses near me were boarded up, burned and demolished. Buildings were not replaced. As a result, I founded and administered resident groups to fight for affordable housing and neighbourhood well-being. I established the McDermot-Sherbrook Residents Association Inc., in 1991, and later the West Alexander Residents Association Inc. I worked with the Community Education Development Association to found the Central Neighbourhood Development Corporation (CNDC) that I now chair.
 
Since 1991, I have attended many hearings at City Hall for applications to open businesses that compromise residents’ safety. From 2004 to 2009, I served on the City of Winnipeg’s Secondary Planning Group for the West Alexander and Centennial neighbourhoods. Our goal was to create design principles and zoning to guide development and stabilize the residential areas

For two years, I have been part of a group requesting the Province to undertake a Masterplan for the design of the neighbourhood to the north of the Health Sciences Centre where there are 400 houses, many children and Pinkham School. In addition to businesses, healthcare organizations and residents, the planning group must include the School Division. 

**What are the major issues you would like to stand for and why did you choose these issues?**

In addition to the issue on neighbourhood planning around schools, I support the following priorities: 

* Ensuring safe environments for learning, within schools and in the areas around the schools

* Improving the graduation rates of children in our division and better preparing them for employment and for further education, in university or community colleges; creating citizens who can go on learning, adapting and excelling in changing circumstances 

* Transforming schools into community resources for learning and for healthy living from early years to seniors

* Working side-by-side in partnerships with other neighbourhood organizations, not-for-profit groups and employers to build children’s awareness of the broader world and the issues and opportunities within it

* Pursuing priorities for educational equity for inner city students

* Balancing of financial resources with student needs

**Is there anything in particular you would like to change in your school division? In your ward?** 

This is contained in the answers above. 

**Do you have any other comments regarding your candidacy?** 

As a graduate of three Canadian universities and past instructor at the University of Manitoba, I am committed to building our public education system. As an artist and musician, I also support arts education as a means to develop learning in other subjects, like language and mathematics. I also believe that physical education is important in schools as it relates to health. As a member of several boards, I have experience in teamwork and governance. 

For further information on my background, please see http://www.cathycollinstrusteecandidate.blogspot.co^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Anthony Ramos', office_address: '', phone_number: '272-0993', email: 'mr_ramos9@yahoo.ca', image: nil, website: 'http://www.trusteeramos.info/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run in the 2010 School board election as an incumbent because I felt that after my first term as a trustee, the experience I have gained will hopefully allow me to go forward and continue to serve the school communities in my ward and ensure the educational needs of students are supported and enriched to the highest level possible. 

**What experience will you bring to complement your role as school trustee?** 

I believe my experience as a school teacher has given me a perspective from the classroom that will enable me to give a voice to all staff involved with our students. As a trustee I have been able to see how the school board works to support and enrich success for all Winnipeg School Division students and families.

**What are the major issues you would like to stand for and why did you choose these issues?**

I would like to continue to stand for equitable education across the division. I believe this is the equalizing factor to close the gap of socioeconomic diversity among students in the division. I would also like to see a clear focus on new immigrant issues to enable a meaningful process of integrating new Canadian citizens through our school system. I believe these issues are important to our ward in order to provide best educational environment for all students. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to change the perception of paying school taxes in our division. As a taxpayer myself and realizing that there needs to be fair assessments for all citizens of various financial backgrounds, I believe that all communities should be commended for the all the success that their schools achieve. Students past, present, and future would never be able to realize their potential without public support.   

**Do you have any other comments regarding your candidacy?** 

I have experienced the education system thus far from various perspectives and feel that input from the greater community is vital in the direction of public school systems. I believe this because this is where our students will eventually put their education into action and make meaningful impacts^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Kristine Barr', office_address: '', phone_number: '775-0990', email: 'kristinebarr@hotmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have served as a local school trustee since 1998.  I belive that my re-election will help to ensure continuity and experienced leadership with the Board of Trustees.  I have significant board experience, including:

* Currently the Chair of the Finance & Personnel Committee, which is responsible for preparing an annual budget of $329 million to meet the needs of the division’s 33,000 students.
* Chair of the Board (2006-2008)
* Vice-Chair of the board (2004-2006)
* Chair of the Policy/Program Committee (2003-2004)
* Chair of the Public Relations Committee (2001-2003)
* Board representative to the Manitoba Association of School Trustees (1999-2001)
* I have also served on the Building & Transportation, Inner City Advisory, Central Advisory, Children’s Heritage Fund, Pension, Student Advisory and Negotiation Committees.

**What experience will you bring to complement your role as school trustee?** 

As a lawyer, I have experience in helping people to navigate their way through the legal system, and I practice primarily in the area of family law.  I am a former youth health educator, and have direct experience working with youth.  As the Chair of the Social Services Appeal Board, I understand board governance and can advocate for changes in provincial legislation.  

**What are the major issues you would like to stand for and why did you choose these issues?**

Student Voice  – I put forward the recommendation to create the Student Advisory Committee which brings together youth from all high schools in the division so that they can express their views to the trustees. I believe that youth need a voice in the decision making process.

Ensuring Safe Learning Environments in Schools - My plan for human rights training in the school division has made our schools safer for students, and a healthier workplace for teachers and support staff.
 
Managing tax dollars responsibly – I have supported and voted in favour of small, incremental tax increases to maintain necessary programs and services for students.

**Is there anything in particular you would like to change in your school division? In your ward?** 

One area that I believe needs changing is the size of the wards in the Winnipeg School Division.  I support a smaller number of wards.  Smaller wards would allow schools and local communities to have stronger connections to their trustee representatives, and make running for office to become a school trustee a much more accessible process.

**Do you have any other comments regarding your candidacy?** 

I have twelve years of experience as an elected school trustee and am passionate about public education.  I will continue to work to improve our system and fight for the right of all students to receive high quality education and graduate from an adequately funded school system.  I have a proven track record and the conviction to get things done.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Bradley McKay', office_address: '', phone_number: '801-6896', email: 'bradwm433@yahoo.ca', image: nil, website: 'http://bradwm433.weebly.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Bradley-Mckay-for-School-Trustee/146454045388430?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run after seeing many issues in a school my three children were going to! I was a past President of the Parent council for that school for one year! I was actually approached by a few members of a City committee I am a member of to run because of my concerns and issues I have!

**What experience will you bring to complement your role as school trustee?** 

I have been on many Boards as a co chairs and chairs and organizer of community events. I have sat on a Justice committee as well as a Community committees as co chair. I specialize in board Dynamics! I am a member of various committees and Boards now too many to list!

**What are the major issues you would like to stand for and why did you choose these issues?**

My issues are safety in and around the schools, healthy lifestyles (sports, physical education) Transportation and School Closures and their impact on the community. To improve our children’s education, up to date technology in the schools.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Safety in and around our schools, and Healthy living! Equal, consistent education for all cultures and financial backgrounds! More after school programming for all children in and around the schools!

**Do you have any other comments regarding your candidacy?** 

I would use my education at the board level to help with budgets, curriculum and work as a team with others and combine our efforts to educate our children for today and tomorrow! I stand for both community and education! I would respectfully represent those in our community, and their concerns with the current curriculum and health and safety of our children in and around our schools.

Any more questions visit my web page for any further info!

[http://bradleyw.weebly.com](http://bradleyw.weebly.com^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Kenny Moran', office_address: '', phone_number: '', email: 'kenny.moran@yahoo.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**What are the major issues you would like to stand for and why did you choose these issues?**

A) I will leave this question for my constituents, this is about what they want. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

A) Daniel McIntyre Ward / Central / West end has been neglected in the last 25 years by the status quo, this has to change. I for one, am not for the status quo.
 
B) I would like to see more Aboriginal Teachers to deliver the basics at various schools.

**Do you have any other comments regarding your candidacy?** 

A) I believe that I cannot change the status quo, but ask to deplete it.
B) A foundation has to be built and as I said before. This must come from the statis quo   which we continually elect^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '3', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Sonia Prevost-Derbecker', office_address: '', phone_number: '', email: 'sonia.prevostderbecker@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I view Education as the “Great Equalizer”.  To build a truly just and prosperous society we need a strong education system that supports all of our children.

**What experience will you bring to complement your role as school trustee?** 

My resumé: 

I have been an elected School Trustee since 2006 and as such have taken on the following leadership positions.

* Current Vice Chair of Winnipeg School Board
* Past Chair of Winnipeg School Division Policy and Program committee

In addition I have held the following relevant positions

* Former High School Teacher
* Founder of Ndinawe Transitional School
* Former Member of the Aboriginal Education Task Force at the University of Manitoba
* Past Chair of Luxton School Parent Council
* Former Executive Director of child and youth services agencies.
* Founding member of Métis Child and Family Authority board
* Active community involvement including election to the following boards:
  * United Way of Winnipeg
  * Winnipeg Harvest
  * North End Community Renewal Corporation
  * Ma Mawi Wi Chi Itata Centre 
  * Community Education Development Association
  * Mary Kardash Daycare

I believe I bring the kind of experience we need on the School Board!

**What are the major issues you would like to stand for and why did you choose these issues?**

Safe and Healthy Schools

* Children cannot learn if they are afraid. I was a member of the original development committee for the School Resource Officer Program.
* Safety should include working with our children on strategies that promote anti-racism, that enable greater understanding of diversity, the benefits of mutual respect and the responsibility we all have for ensuring a safe and just society.
 
Increased Parental Involvement

* The families of our children are our greatest asset. Studies prove over and over that the strongest indicator of student success is parental engagement. Parental involvement needs to continue to be a top priority for the division.
 
Stronger Academic Achievement

* I believe that improving academic achievement must continue to be a focus for the Division. As such I have called for the creation of a sub-committee of the board that will look at strategies such as extended learning time to improve academic outcomes and increase graduation rates.
* High quality education requires highly trained and motivated staff. I support the enhancement of professional development.
* Ensuring enhanced learning opportunities for all children cannot be overlooked. Examples such as Children of the Earth Medical Program must be made available if we are to produce leaders of tomorrow.

**Is there anything in particular you would like to change in your school division? In your ward?** 

* I would like to find ways to increase graduation rates and general levels of competence at graduation. We want to keep our students in school and provide them with the tools they need to be successful in their next stage of life whether in work, college or university.

* We need to find more equitable ways to fund public schools.

**Do you have any other comments regarding your candidacy?** 

Throughout my career, as a School Trustee in the Winnipeg School Division, through my employment in a variety of youth serving organizations, in the many community volunteer positions I have held and most importantly as a mother, I have always tried to recognize and respond to individual differences.  There are many road blocks within our society that impede the progress of children as they grow and develop.  These challenges are widely spoken of in the media and in our daily life.  Socio-economic issues such as poverty, addictions, violence, lack of appreciation of cultural diversity, gang pressures and much more all play a part in limiting positive outcomes.  As a society we must recognize the pressure these issues place on our students’ potential development.  Through the position of Trustee, I have been able to help bring more children through these challenges, with the goal of brighter futures.  Much has been accomplished over the past four years, however much remains to be done^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Darlyne Bautista', office_address: '', phone_number: '', email: 'info@vote4darlyne.ca', image: nil, website: 'http://vote4darlyne.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Darlyne-Bautista-for-School-Trustee-Winnipeg-School-Division-Ward-3/151660148190656?ref=ts', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run for School Trustee because I want to represent and reflect the growing diversity of our schools. I feel I can offer a perspective not yet seen as I am intimately acquainted with the issues from the perspective of a student (who graduated from the Winnipeg School Division), a scholar (who investigates the acculturation concerns of immigrant families and youth), and a community leader (who works in constant consultation with parents, students, and teachers).

**What experience will you bring to complement your role as school trustee?** 

* I continue to live in the same neighbourhood where I graduated from both Machray Elementary and St. John’s High schools. I also completed a Bachelors of Arts (Honours) at the University of Winnipeg and Masters of Arts at the University of Wisconsin-Madison. My love for learning is deep rooted in my experiences as a student of the Winnipeg School Division. I am committed to give back to the community that has attributed to my academic accomplishments.
* I am a founding member of Aksyon Ng Ating Kabataan (ANAK) Inc. a youth-based non-profit that builds partnerships with students, families, teachers, and scholars to provide educational resources, mentorship and scholarships to immigrant youth.
* I am the curator of Manitoba’s first Filipino-Canadian oral history project and exhibit at the Manitoba Museum; and coordinator of Canada’s first accredited Philippine Studies Course at the University of Winnipeg. These innovative projects attest to my investment in diversifying education so that it is inclusive of all peoples and cultures.

**What are the major issues you would like to stand for and why did you choose these issues?**

The major issues I hope to stand for are the ones I have learned from students, parents, and teachers. These include:

* Community – Our schools need to reflect the learning that also takes place outside of the conventional classroom. Students (especially immigrant youth) are often left to navigate differing cultural perspectives taught in class and at home. I have learned that families and community groups can help students through this process with mentorship, language, and after-school activities with the right encouragement. These supports are far more reaching and meaningful to students because it builds relations and greater multicultural understanding.
* Safety – To ensure our schools remain a positive learning environment free from negative pressure.
* Resources – To carefully understand the budget so that resources are managed carefully and fairly. I am disheartened to learn some accelerated programs are no longer offered at the high school level due to low enrollment. I fear that this will limit the potential of those children who wish to take part but cannot.
* Opportunity – To ensure all students are given a chance to realize their full potential through meaningful activities (including sports, arts, music, employment, volunteering)

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to enter the discussion on amalgamating Winnipeg school divisions and Winnipeg School Division ward boundaries.

**Do you have any other comments regarding your candidacy?** 

Please feel free to contact me.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Suzanne Hrynyk', office_address: '', phone_number: '', email: 'shrynyk@hotmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

As an incumbent trustee, I feel that my 4 years of previous experience is valuable in order to continue with the work of the WSD Board of Trustees.  My common sense approach intermingled with my education and professional experience brings a different skill set to the Board table.   I am committed and determined to improve the education and service delivery of our school division.  Based on my interest in public services such as education and health, I have decided to seek re-election.

**What experience will you bring to complement your role as school trustee?** 

I have 15 years of labour relations experience and various board experiences.  I have an RN Diploma, BA advanced degree in Labour and Workplace Studies and a Masters in Health Services Management.  Through my years of work in Labour Relations, I am a skilled negotiator, advisor and consultant.   My skills related to employment matters will assist the Board related to decisions of that nature.  

In addition to my education and professional skills, I have served on several Boards as a Public Representative and have recently been appointed to the Winnipeg Regional Health Authority Board of Directors.   I am experienced in making decisions related to program delivery and budgets.  Further, I am committed to continuing to finding ways to deliver programs and services in a cost effective manner.

**What are the major issues you would like to stand for and why did you choose these issues?**

I would like to improve services to new Canadians and Immigrant families across the division.  Winnipeg is a city that celebrates its multi-cultural makeup.   I believe that with the help of senior administration, teachers, parents and students that we can continue to improve those services.  New Canadians experience tremendous stressors and I believe together we can improve the transition in order to assist students to become productive and positive members of our communities.

Lastly, I will commit to pursue the ongoing discussion of size of the school wards in WSD.  Currently, the size of Ward 3 is larger than a Federal Riding.  This matter deserves further discussion and information gathering at the Board level.  My desire is not to increase the number of trustees but rather re-distribute the Ward Boundaries, so that individuals will have improved representation and accountability with their trustees.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Over the past 4 years, I have witnessed first hand, the wonderful students and staff that we have at the WSD.  Student achievement is the WSD’s first priority.  We do have a way to go in order to improve graduation rates and encouraging and promoting youth to stay in school.  I believe that we can always improve in that regard.  I would like to encourage more dialogue with youth in order to find ways to encourage and promote attendance which will ultimately improve graduation rates. 

**Do you have any other comments regarding your candidacy?** 

Lastly, I would like to thank the residents of Ward 3 for their support and assistance 4 years ago and on the doorstep.  The reception I have received has been tremendous.  I am always open to listening to staff, students, parents and residents and would encourage comments on concerns for the coming 4 years^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Roy Hargrave', office_address: '', phone_number: '', email: 'rhargrave@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Money this is a paid part time position, and I believe I have something to offer this division in promoting growth of programs that are restrictive and limited

**What experience will you bring to complement your role as school trustee?** 

I have been active within the Elmwood High school Parent advisory committee, Privileged to sit and chair one of the district advisory groups for WSD, active participate in Elmwood/EK/Transcona RAG, Rivereast neighbourhood network, Elmwood/EK library advisory committee, Also Privileged  to sit as a member of the Children Heritage fund board. In my employment field I am an active member of the companies’ workplace safety committee, and have participated in CME yellow belt training so I believe I bring a different perspective to the board should the citizens of ward 3 choose to vote for me.

**What are the major issues you would like to stand for and why did you choose these issues?**

Adult or mature student diploma programs, this division current policy is a hindrance to the economical challenged working class (and YES, I am in that class). The current policy of ONLY daytime adult education is unacceptable to any one working a day shift hours of operation who want to improve them selves. I decided to run in 2006 for the same reason and choose not to actively pursue donations to advertise and was happy with the vote count, this time around I am still not asking for donations or advertising in an forum that requires payment( as this is a limitation due to my own financial situation) . My goal this time around is to double the number of votes with and perhaps that will be enough to be privileged to hold a seat on the board.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Adult education needs to change if this division is going to be accountable to all it residents. In all wards.

**Do you have any other comments regarding your candidacy?** 

Other thoughts, practical and cost effective use of school facilities with open borders policy mandated by the provincial educational authority and moratorium on school closures. Does this division make cost effective use of facilities? With the real estate board  wanting school tax taken off property tax rate payer( yes some incumbent will tell you school tax portion has been reduce on your tax bills however it is not reflective of the existing boards tax measures but the province increasing home owners education tax credit), the school division as well as other divisions have an opportunity to ensure rate payers get the most value for the tax dollar spent, some schools have daycare centres in them as an example are these centres (which are not owned and operated by division) paying fair market value for space? Are there opportunities to have other services in the schools? Some of these issues need to be explored completely and acted upon when it is in the best interest of the taxpayer and provides an opportunity to provide education in a public school setting to the members of the community that each school serves^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Mike Babinsky', office_address: '', phone_number: '', email: 'mbabinsky@hotmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I decided to run in the 2010 school board election because as a father of six children, and a grandfather of two, I have a real interest in the success of public education.  All of my children have attended school in the division and my youngest two, as well as my grandson are still attending school in Ward 3 of the Winnipeg School Division.  I am also a life long resident and a taxpayer in the ward.  I believe I have a combination of experience, skills, knowledge and a strong independent voice required to deal with the issues facing the public school system today.

**What experience will you bring to complement your role as school trustee?** 

I have served on the Board of Trustees for the Winnipeg School Division since 1995, when I was first elected.   As the senior trustee I am presently the longest serving trustee on the Winnipeg School Division's board. My 15 years of experience provides the board with  an insight as to how division policies evolved, as well as what may have or has not worked in the past.

**What are the major issues you would like to stand for and why did you choose these issues?**

I stand for the major issues and concerns that are important to the people in my ward.  I believe they should have a voice in the decision making.

* The school division needs to find alternative resources to assist in funding public education other than raising school taxes, therefore I initiated a Revenue Raising Committee which has worked on that issue. 
* A few years ago, before it became such a news headline, I raised the issue with regards to child obesity and what role the school division should have in addressing this growing problem.  This is still important to me.
* In the financial spectrum, province wide collective bargaining and school division amalgamations are issues which should be addressed and could help keep our taxes down. These issues are important to people in my ward.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I definitely would like the Winnipeg School Division to be more transparent and open.  I believe the public and taxpayer have a right to know what is going on for the many issues that the board moves to "in camera" sessions. "In camera" means "behind closed doors" where the public is not allowed access to information.  This is a public school division, funded by public dollars and the public should have access to a lot more information on a lot more of the important issues.  It's my personal belief and practice to provide the public with as much information as possible.

**Do you have any other comments regarding your candidacy?** 

I am proud to have served as a school trustee for 15 years, and would be honored to continue.  One of my strongest beliefs is to be accountable to the people in my ward.  Their concerns are important to me and I believe they should have a voice in the decision making.  I am not afraid to speak up for issues that are important to my community and are important to our children's future^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '1 By-Election', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Brenda Poersch', office_address: '', phone_number: '', email: '', image: nil, website: 'http://www.brendapoerschforschooltrustee.webs.com', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100003083911423', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Colleen McFadden', office_address: '', phone_number: '470-2467', email: 'colleenmcfadden@live.com', image: nil, website: 'http://www.colleenmcfadden.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

I am not the type of person to sit on the sidelines and complain. Whether it was working for a school gym, helping to organize a new Novice girls' hockey league, or working for a charity I believe in, I prefer to take action and initiate change. I am not afraid of hard work and long hours and get great satisfaction from working hard to achieve worthwhile objectives. 

As a parent and a volunteer I have worked hard for the best interests of not only my children, but all the students of Queenston School. As a Trustee, I can continue doing that for all the students in the Ward.


**What experience will you bring to complement your role as school trustee?** 

My main experience with the school system started six years ago when I joined the Queenston School Community Gym Committee. I worked with a committed group of volunteers to lobby all levels of government of varying political stripe for a gym for the school. The doors are scheduled to open September 2013, and I am so proud of the work we did. 

That experience was important because I learned how to work within the school system to get things done. The work included navigating administrative and political hurdles which required patience and persistence, while at the same time we had to listen to the parents, students and staff of the school. It was a balancing act that gave me the experience I think is important for a Trustee to have.


**What are the major issues you would like to stand for and why did you choose these issues?**


No matter what the issue, we need to make decisions within the school system based on the best choices for our children. There are five issues I believe will be important in the next several years:

* ACCOUNTABILITY – Creating accountability for our students (do we continue with no fail/no deadlines approach?) and for our system (standardized testing) generates passionate debate, and need to be revisited.
* ATTENDANCE AND GRADUATION RATES – We have to strike a balance of programming, parental involvement and creating a sense of value for education within the child that we need to motivate.
* SERVING THE EDUCATIONAL NEEDS OF CHILDREN WITH SPECIAL NEEDS - Parents of children with special needs know their child the best and need to be a full partner in the education of their child.
* COMMUNITY FACILITIES – With infrastructure renewal underway in both schools and community centres there are opportunities for both the school and community club to explore developing facilities that can serve both organizations. 
* SCHOOL DIVISION BOUNDARY REVIEW – While the organization of school divisions is a provincial matter, every organization needs to ask itself once in awhile whether or not their structure is meeting the needs of those they serve. I fully support such a review. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

The school division raises as much money as the city (property taxes and school taxes are almost the same amount), but education issues and the School Board Trustee elections do not get a lot of attention. At the door, those without children tell me that they do not vote in these elections because they do not have kids in the system, though children who have a quality education tend to become contributing citizens and most often stay out of trouble. 

By better communication and hard work on important issues, I hope to work towards raising the awareness of these issues, and increasing the engagement of the people of Ward 1 in the important issues around education. We spend a lot of money on our education system and the outcome is so important, I believe that it deserves more attention than it gets.


**Do you have any other comments regarding your candidacy?** 

I have always derived great satisfaction from the work I have done in the community, and I look forward to working hard for the students and the residents of the Ward.
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Mark Wasyliw', office_address: '', phone_number: '475-3114', email: 'mark@bueti-wasyliw.ca', image: nil, website: 'http://www.markwasyliw.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

The personal reason I decided to run was concern over the state of the public school system.  I have three children, two of them at Ward 1 schools with a 3rd one joining them next year.  I am a strong believer in public schools as a foundation for a functional democracy.  I am concerned that the system is underfunded and starting to break down.    The School Board expenditures are rising faster than its revenue increases and as a result the  School system has been hit with a series of incremental cuts, mostly affecting capital and infrastructure.   Parent advisory committees have stepped in to fill the funding gap which has created disparities between wealthy and modest school communities.  While some schools are building brand new play structures and putting IPads into the hands of their students other schools don't even have proper gyms or changing room facilities.  The system of funding is not sustainable and it is attacking the universality of the public school system.


**What experience will you bring to complement your role as school trustee?** 

I am Lawyer and businessperson having been the founding and managing partner of my law firm.  I have experience dealing with budgets in the millions of dollars and supervising staff.  In addition I am a Deputy Chief Residential Tenancies Commissioner for the Province of Manitoba and have experience working in government.  I believe in education and have been involved as a lecturer/instructor in the professional education of other lawyers as well as coaching 7 & 8 year olds as part of the Crescentwood Grizzlies Football program.  I come from a family of teachers and understand the stresses and difficulties they face in doing their job.


**What are the major issues you would like to stand for and why did you choose these issues?**

The current funding model is not sustainable and a review must occur with all three levels of government to address the funding shortfall.  More money needs to be put back into the schools to upgrade the infrastructure and make the buildings more environmentally sustainable.  We need to invest in technology and science equipment to ensure that the teachers have the most current teaching tools necessary.
 
Traffic is a severe problem in Ward 1 schools and there is no transportation policy to deal with congestion in residential neighbourhoods during peak times of the school day.  Alternatives like the "walking school bus" have to be promoted and expanded to reduce the impact of cars in the neighbourhood to make the school safer and greener.
 
There is no connection between citizens and their school trustee.  Ward 1 has 19 schools and over 25,000 households a trustee cannot reasonable connect with a ward of that size.  There needs to be major electoral reform to create smaller ward sizes to allow a trustee to have a personal connection with their community.  Further, there is no campaign finance rules in place and no limits to spending or disclosure of donors.   This has to change.


**Is there anything in particular you would like to change in your school division? In your ward?** 

Currently, the Winnipeg School Division pays for the maintenance and upkeep of the old Sir John Franklin school yard.  The Division cannot afford to continue to pay for land no longer used as a school but  the residents need to keep the property as a park.  I support that need.  I would advocate on behalf of residents to have the City of Winnipeg purchase the property from the School Division but only on the condition that it be rezoned as park land and maintained as green space.


**Do you have any other comments regarding your candidacy?** 

I will be a strong advocate for teachers, student and parents within the School Division.  I believe that with proper funding that Winnipeg 1 School Division can become a model for other divisions in the Province.  I want to reward innovative teaching methods and ensure that our schools are diverse, vibrant, safe and environmentally responsible communities. 
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Randall Znamirowski', office_address: '', phone_number: '', email: '', image: nil, website: 'http://vote4Randy.blogspot.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

Hi, I am your Nassau Street neighbour/taxpayer for 17 years.
I would be honoured to be your School Trustee. My goal is to bring caring, ethical, visionary leadership to a board that values modern, affordable education.

Did you know the last two school only by-elections, the winning candidate received 2,427 and 666 votes. We have 43,377 voters. That is not democracy that is a travesty.
Our children need a Modern, Affordable, Quality Education System.

We need to ensure our money is spent effectively.

Winnipeg's place in the global economy depends on the quality of our education system.

Manitoba's high-school drop out rate is the worst in Western Canada.

It’s time to fix the system and get real value for money from our tax dollars.

Are you concerned about your taxes?
Do you wonder why the School Tax portion of your Gross Property Tax Bill is more than the City portion when the City portion pays for so many more services?
Police, Fire, Ambulance, Transit, Public Works, Streets, Snow Clearing, Parks/Recreation, Libraries, Building/Health Inspections, Property Assessment, Planning/General Government cost less to operate than our schools.

Why are there six school divisions but only one Municipality & Regional Health Authority in Winnipeg?

**What experience will you bring to complement your role as school trustee?** 

We need solid financial and managerial expertise and leadership. I offer a well rounded executive leadership background as a Chartered Accountant (Bachelor of Commerce Honours), Chief Financial Officer, Auditor and a Management Consultant.
My experience in project management, consulting, facilitation, analysis and presentation skills along with the creativity, business and political acumen developed over 27 years of Public Sector and Private Practice will serve you well.
My career has focused on building the capacity of organizations by improving the effectiveness, efficiency, economy, ethics and eco-friendly aspects of operations and making work easy, error free and entertaining (Randy's Rule, the Pursuit of Excellence, the 9 E's).
I want to utilize my skills, abilities and talents to work with the Board and the Administration to help guide the Winnipeg School Division in the pursuit of excellence.
We are fortunate to have a professional dedicated staff at Winnipeg School Division.
"I will work with the board, administration and support staff to find efficient and effective ways to provide quality education."
All of our staff want to do the best job possible for the least cost but they need direction, motivation and support from the Board.

Vote for Experience, Education, Ethics and Enthusiasm.

**What are the major issues you would like to stand for and why did you choose these issues?**

The Education System Needs Fixing.

The Institute of Chartered Accountants of Manitoba 2011 MB Check-Up identifies serious issues facing our education system.  When compared to the Western Canadian Provinces and the Canadian Average, Manitoba has:

* The highest High-School dropout rate, 
* The second lowest level of education in the 25 to 54 year old workforce,
* Less than 60% of the work force has post-secondary education; one of the lowest rates in Canada,
* The average employment rate for Manitobans without high school education is under 40%; one of the factors that drives social welfare costs.

We spend a lot of money on education.

* By 2020 two-thirds of all new jobs will require some form of post secondary education.  It’s up to us to prepare our education for this challenge.
* Isn't it time we started getting value for money?
* Shouldn't our budgets, policies and programs foster successful completion of high school?

Our School System needs to emphasize the 3R’s and make the high-school curriculum workplace and life ready.
Take Action
Help me to help you save your money and invest wisely in
Our Children and Our Future.

Vote for Randall Znamirowski

**Is there anything in particular you would like to change in your school division? In your ward?** 

Manage our Finances
The Winnipeg School Division (WSD) is the largest School Division with a $342 Million budget ($11,053 per student).  WSD has 4,295 staff providing services to 29,801 students, approximately 1 staff member for every 7 students.
Every year over the last 5 years the number of students has decreased (3%) but the cost per student has increased by 18% ($1,701).
Over 50% of WSD buildings are over 50 years old and will need replacement or major repairs/maintenance.
WSD needs strong professional financial leadership.
Taxpayers need to know their tax dollars are wisely invested.

Focus on Performance 
My Performance Management leadership style will have a triple bottom line focus on:

* Financial & Economic Performance
* Social & Community Performance
* Environmental Performance

How does WSD compare to other school divisions? We need to know.

Getting Policy Right
Policy drives budgets. School Boards need a better handle on policy. How the Winnipeg School Division manages policy to address the following issues will set the course for taxation for many years to come:

* Declining enrollments matched with increasing costs.
* Over 50% of our schools are past 50 years old, our building stock is deteriorating.

**Do you have any other comments regarding your candidacy?** 

* Our children need a Modern, Affordable, Quality Education System.
* We need to ensure our money is spent effectively.
* Winnipeg's place in the global economy depends on the quality of our education system.
* Manitoba's high-school drop out rate is the worst in Western Canada.
* It's time to fix the system and get real value for money from our tax dollars.

We spend a lot of money on education.
We need solid financial and managerial expertise and leadership. I offer a well rounded executive leadership background as a Chartered Accountant (Bachelor of Commerce Honours), Chief Financial Officer, Auditor and a Management Consultant with 27 years of financial, program, operational, strategic planning and communication management experience in the public sector and private sector.

The Education System Needs Fixing. We need to:

* Manage our Finances
* Mange our Operations
* Get Policy Right
* Focus on Performance

Become part of the Solution.
Vote for Experience, Education, Ethics and Enthusiasm. I am a passionate analytical CA who gets Results, Builds Relationships and Team Spirit.

Help me to Help You Save Your Money and Invest Wisely in
Our Children and Our Future.

On Nov. 26 Vote for Randall Znamirowski.

Further information can be obtained at:

Website http://vote4randy.blogspot.com

Professional Profile can be found on LinkedIn at

http://ca.Linkedin.com/pub/randall-znamirowski/31/745/B9^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Evan Thompson', office_address: '', phone_number: '', email: 'info@evan4trustee.ca', image: nil, website: 'http://www.evan4trustee.ca', council_site: '', facebook: '', twitter: 'http://twitter.com/Evan4Trustee', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 


I am no longer able to continue with my school trustee campaign.  I would
like to instead express my support for Gerrit Theule.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Gerrit Theule', office_address: '', phone_number: '880-1598', email: 'gerrit@theule.ca', image: nil, website: 'http://www.theule.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Gerrit-Theule-For-Ward-1-Trustee/247260241992384', twitter: 'http://twitter.com/gtheule', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

I have become progressively more involved in public schools and the school division, first by working for UNICEF in schools, then by belonging to and currently chairing my son's Parent Advisory Council, and most recently I've also been appointed to the Division's French Immersion Advisory Committee.
 
When the seat became available I didn't want it to be filled by a person who was just interested in it as a stepping stone to larger political office. I wanted the next Trustee to be a parent who cares for the children of the Division, who believes in the power of public education to improve the community, and who feels that the students and teachers in our Division are best served when stewarded by someone who has first hand experience with the way that public schools work, and who has a non-self-serving interest in making them better. In an absence of these qualities in so many of the individuals who run for Trustee positions just to be politicians, I found, as I'm sure that you will, that the person who best personifies them is me, Gerrit Theule.


**What experience will you bring to complement your role as school trustee?** 

As I mentioned in the previous question, I am currently the Chair of my son's Parent Advisory Council at, I believe, the largest elementary school in the Province, Ecole Laura Secord School, where I have led a diverse group of parents in our Division through many difficult challenges over the past two years. Here, I have had the privilege to be involved in the process of re-drawing of our school's boundaries to accommodate an ever-growing student population in limited classroom space, ensuring that all of our parent's concerns were heard. More recently, I acted as the parent representative and liaison when there was a fire at the school last month. Administratively, I have assisted with the boards of two arts organizations as well as having sat on the board of the Don Quixote Housing Co-op. Within the division, my experience goes as far back as being a student representative to the Winnipeg School District's South End Advisory Committee while attending Grant Park High School. My long history in this area and with this Division speak strongly to my commitment and experience in this neighbourhood and to my knowledge and understanding of the issues that the Board faces every day.


**What are the major issues you would like to stand for and why did you choose these issues?**

I think that parents are crying out to have someone speak for them about the Comprehensive Assessment Program. This ill-planned program takes away valuable teacher time, interrupting learning in our classes and costing vast sums of money when substitutes fill in for them. C.A.P. tells us nothing and doesn't give us any data to act on. Teachers, parents, and taxpayer groups are all standing against this: it's time that someone listened to them.
 
I would like to see an increase in drug and alcohol awareness programs at school. When looking at it as a safety issue, very few of our students will see a weapon brought into school but virtually all of them will face these kinds of pressures that concern me far more as a parent.
 
Third, I would like to see our board increase graduation rates by starting to help children as young as is possible. Every study out there tells us that the earlier that we help kids, the more likely they are to graduate and the less crime we will have in this city. Don’t want your car stolen? Elect someone who will follow the research and initiate programs to help kids out early and often.


**Is there anything in particular you would like to change in your school division? In your ward?** 

I think that our School Division needs to be run more on ideas and proven research and less on ideology. When the Division makes decisions based on fear and politics the children, and ultimately society, pay the price.
 
The Comprehensive Assessment Program would be the first thing that I would like to see eliminated. It costs vast amounts of money and doesn’t tell us anything at all that the teachers don't already know about our students.
 
I would like to see our teachers have a better method of providing feedback about Division policies since they are, after all, the ones seeing first hand the immediate effects of the decisions made.
 
I would also make an effort to change the ways in which Trustees interact with their Wards. I would guess that a significant number of people who live in the Ward are unable to name their three Trustees. I would like our Trustees to be more accessible and more accountable to the people whose lives they are affecting on a daily basis.


**Do you have any other comments regarding your candidacy?** 


Only that if you are looking for another Trustee to be an MP in five years time, I'm not it. I will be a Trustee who feels that this position is an important enough one to stick with, and who didn’t get into the process as a result of shopping for a public office. I will be a Trustee whose only vested interest here is in improving things for my children as well as yours: I have no professional affiliation with education and nothing at stake in our public schools besides the best interests of our children. Finally, I have a long history with the Division and this neighbourhood: From elementary school in the Division to Grant Park High School to chairing a Division Parent Advisory Council, from playing and later volunteering for Crescentwood Grizzlies football to meeting my wife for the first time right here on these very streets, I love it here and only want to see this area, and this area's children, thrive. Ask yourself on November 26th if there is anyone else who would be better suited to be your Trustee. I think that you’ll find that I am the best choice. Thank you for reading.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ben Shedden', office_address: '', phone_number: '990-3820', email: 'benshedden@hotmail.com', image: nil, website: 'http://www.benshedden4trustee.com', council_site: '', facebook: 'http://www.facebook.com/pages/Ben-Shedden-for-Trustee/233885473307181', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

As a teacher currently working in the inner city, I believe very strongly in public education in Winnipeg. My students, who are mostly refugees, inspire me by their faith in education as a way to succeed in society and become productive citizens. I feel I owe it to them, to students throughout Winnipeg, and to their families, to bring my passion for schooling to the Winnipeg School Board. 

While my devotion to public education is important to my decision to run in the upcoming by-election, perhaps my biggest motivation comes the teaching of my parents, who have instilled in me a love of being active in my community. Teachers themselves, they've always taught me to work hard for the things in which I believe. I see the potential of students every day. I know there is more we can do as a community to improve our schools. I am willing to do whatever is asked of me by my community to make the Winnipeg School Division the best it can possibly be.

**What experience will you bring to complement your role as school trustee?** 

I am the only education professional running in this election. That brings a body of experience that provides me with unique perspective. I have worked in Winnipeg schools for the past 8 years as part of my education at the UofW. I completed my B.Ed. in 2010, which provides me with a current academic foundation. I have met numerous other teachers, many of whom I consider good friends. I have seen many different classrooms, different grades, different schools, teaching a whole host of different subjects. I am aware of all parts of the school system throughout Winnipeg.

My passion for education has led me to explore other opportunities in the education field. I have worked for alternative education programs such as Community School Investigators, Career Trek and the Selkirk Healing Center. I served as president of the Education Students Association, where we had one of our most successful years ever. I have also tutored at the Global Welcome Center at the University of Winnipeg. Currently, I sit on the Advisory Council of Safe Schools Manitoba, where I help guide policies that ensure safety in Manitoban schools. I hope I can continue my hard work at the school board level.

**What are the major issues you would like to stand for and why did you choose these issues?**

There are many issues that affect schools in the Winnipeg School Division. As a School Board Trustee in Ward 1, I will work continuously to make sure the issues that matter most to my community are represented in School Board meetings. My main focus is bringing forward the concerns of others to the table. I will work with the teachers to make sure they are given the resources and training to do their jobs. I will meet with politicians at the provincial level to make sure they understand their commitments to provide the required funding and resources to maintain a high level of instruction in Manitoba classrooms. I will bring together parents, business leaders and school administrators to communicate with each other to ensure our schools are community-minded. I will work with Universities and Colleges to ensure they are providing high quality teacher training to future teachers. Essentially, I want all issues discussed openly with all stake-holders and with the best interests of the students in mind.

**Is there anything in particular you would like to change in your school division? In your ward?** 

During the past month, as I've traveled around the ward, meeting with community members, I've encountered a lot of positivity about schooling in the area. I am not someone who is aiming to make sweeping changes or reforms. I don't believe we need to be scrapping current, effective educational practices, or digging up old, out-dated practices like standardized testing that are expensive, proven to fail, and based on tired ideology rather than research. I believe that we have made great progress over the past decade in delivering quality education in our schools and I would like to build on that success. I believe in the path our division has set and I will sit with my fellow trustees as an ally in their efforts. The only thing I might change is the minds of the few who believe that our schools are not effectively delivering quality education. Vote for me, and I will devote myself to sharing the many successes of our students to help change those minds!

**Do you have any other comments regarding your candidacy?** 

On November 26th, vote for someone who lives, breathes and bleeds public education. Vote for someone with new ideas backed by education and experience. Vote for a candidate with energy, dedication, and devotion; someone looking to work with others to bring even higher levels of success to our schools. 

I am so pleased to have met so many concerned citizens on the campaign trial over the last month, and I would be greatly honoured to have the opportunity to meet more of my constituents as the newly elected School Board Trustee in Ward 1. Thank you for your consideration.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
division = Region.create!(name: 'Louis Riel', start_date: nil, end_date: nil, region_type: school_division, region_id: nil, seats: nil)
ward = Region.create!(name: '1', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Louise Johnston', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am a passionate advocate for Public Education…so deciding to run is something I take very seriously.
It has been my great privilege to serve as your School Trustee; first in Norwood, then in St. Boniface and now in Louis Riel. I bring honesty, integrity and experience. I am currently 1 of only 2 women serving on Louis Riel’s 
9 member School Board.

**What experience will you bring to complement your role as school trustee?** 

My work as fluently Bilingual Senior Manager with over 25 years of experience in driving organizational change and growth provides me with important skills to serve as a School Trustee. I have a strong commitment to strategic planning, business development, recruitment, training and career management. I have been referred to as a creative resourceful leader with a reputation for hard work, integrity and loyalty.

As well both my husband Brian and I are lifelong residents of Louis Riel School Division, both graduates of public schools in this division, we have raised our 2 children and they have both graduated from public schools in our division; combined with my 20 years of Board experience, including serving as Board Chair I feel makes me a strong candidate.

**What are the major issues you would like to stand for and why did you choose these issues?**

* A strong focus on the equal and fair treatment of all students
* A strong, bilingual voice in providing increased opportunities for all students
* A strong need for the strengthening of vocational and arts programming
* A strong supporter of Professional Development for all employees of the Louis Riel School Division 
* A strong voice in pursuing increased provincial government financial support for Public Education while reducing the burden of higher taxes for constituents
* A strong advocate for increased awareness of physical health and wellness for students and educators in the Division

**Is there anything in particular you would like to change in your school division? In your ward?** 

Together we need to address the challenges and opportunities around declining enrolment and aging infrastructure in our ward.

**Do you have any other comments regarding your candidacy?** 

With your vote, I will continue to work on providing quality educational programming for all Louis Riel School Division students while remaining focused on being accountable to all taxpayers^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Gary Gervais', office_address: '', phone_number: '', email: 'gervais2010@mts.net', image: nil, website: 'http://garygervais.wordpress.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I was first elected to the board in 2006. I believe I have brought a fresh perspective to the board. I have more to contribute to LRSD, so running for re-election was an easy choice.

**What experience will you bring to complement your role as school trustee?** 

I own a small business in Winnipeg called Heartland International English School. Previously, I was an English teacher in Japan for 3 years. My education and business experience are a good combination in dealing with issues at the board table.

**Is there anything in particular you would like to change in your school division? In your ward?**

I will continue to champion education for sustainable development.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Chris Wilson', office_address: '', phone_number: '', email: 'chwilson@glenlawn.ca', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I ran in the 2006 election and promised myself and the voters that I would run again if I was not elected.

**What experience will you bring to complement your role as school trustee?** 

The experiences that I have from business, raising three children ( 9 years as a stay-at-home Dad ) and general street smarts coupled with secondary education, makes for a unique perspective that has been lacking in the division.

**What are the major issues you would like to stand for and why did you choose these issues?**

I believe that a student should not be advanced to the next grade if they have not developed the skills to complete the current grade. I see nothing wrong if some students have to work harder to keep pace.

I also believe that there exists a level of arrogance and elitism when it comes to Firing a Bad Teacher. How is it that people forget that we all went to school and recall great teachers and poor teachers… Guess what, those poor teachers are still teaching our kids. Great teachers should be empowered and rewarded… we may have to start over with this issue…

**Is there anything in particular you would like to change in your school division? In your ward?** 

The first thing I would change is the school divisions' mission statement…suffice it to say that until all policies are reviewed we will not know why 50% of the students don’t graduate or are unprepared for a post-secondary education.

The mission statement is weak and it can't be measured for success. It also reeks of a political ideology that has no place in our schools.

I would change the mission statement to include measurable goals such as  "Graduate 100% of the students with fundamental skills in Reading, Writing, Math and Science". The current mission statement seeks to develop responsible global citizens. After researching the genesis  of "Global Citizens" I studied "Agenda 21" from the 1992  U.N. Climate Summit in Rio de Janeiro. The 3 main goals of Agenda 21 are… 1- The elimination of Private Property Rights. 2- Education of Global Citizenship. 3- Control over human activities…..Real nice!!!

**Do you have any other comments regarding your candidacy?** 

School Trustees are usually elected under the radar. They often are in the Education System and are all too happy to march in "lockstep" with their  Comrades. Their progressivism is stealth and dangerous. The only things missing when they sing Kumbaya  at their meetings are the life sized statues of Al Gore and Chairman Mao.

Wake-up Winnipeg… our children need us^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Bob Wilson', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Believe School Board Trustees should live within the community they serve.  A successful Bob Wilson lives in Louis Riel School Division but has long history of living in Ward # 1.  The father of five, a strong public schools develop strong citizens for the future.  A candidate with experience I am committed
to doing and making decisions for all school kids.  A former sports convenor and volunteer maybe Ward  # 1 schools may adopt my ideas on physical health and wellness. 

In the 2006 campaign Bob Wilson promised new sources of revenue to offset a continuing provincial policy not to offer education a fair share of revenues. Former Chairman of Public Accounts and an advocate for prudent spending.  The voters of Ward # 1 get a bonus if  annual grants for education result from a strong Trustee who joins the present cooperative trustee group at Louis Riel School Division.

**What experience will you bring to complement your role as school trustee?** 

My modest campaign information card spells briefly experience, accessible full time providing district opportunities within the Public School System. In addition my Masters of Public Administration is a policy analysis, debate & implementation.  The exact criteria mentioned for a strong candidate by the mbschoolboards.ca TAKE 5 memo. 

Father of five with three girls still in the public educational system. The Public School system has served my family with first class education.  My conflict is my deceased wife Charlene (Rizok) Wilson was a school teacher Grade # 3  twenty years Laura Secord...my bias towards strong development for all teachers to ensure equal  treatment for all students.

Bob Wilson has a record of volunteerism, sports convenor, manager, a good neighbour a proven team to solve school division issues and concerns.

Senior's Month  Oct 16 spend the day new SS Ward # 1 new trustee voters Dawson Road S and Symington Rd 20 E  none-had met the" incumbents." vs  Bob Wilson is accessible 24/7 for all voters to express their concerns.

**What are the major issues you would like to stand for and why did you choose these issues?**

What are major issues you would like to stand for, and why did I choose them?
 
How often has the property tax bill increased because of increased education costs?  City Council holds the line and the school division gobbles up the savings thru generous budget increases.  It's time to take education costs off the propertytax bill some new creative fund through income tax.  True taxpayers would pay about the same as they do , just in a more fair and different way.  When Chairperson for Public Accounts under the Lyon Government my investigative skills found many government funded trusts funded by general revenues.

My speeches in Hansard as MLA  " why should the richest members get a grant"  while school are facing possible closures. In 2003 again reminded the lawyers their total assets of $ 32 million where for education according to the 1974 NDP agreement...grants for education.  My private members Bill would have transferred part of $ 2 million annual transfer to the Minister of Education.  In 2006, as a school candidate I promised new sources of revenue....2010 NEW SOURCES of revenue await a strong SCHOOL TRUSTEE. ON CITY COUNCIL   our slogan  " A FAIR SHARE OF TAXES ' got results from provincial finances.

Be Smart  vote for a strong candidate who lives, willing to share in Ward 1  his home riding.  Why? I can deliver results or resign!

**Is there anything in particular you would like to change in your school division? In your ward?** 

Take 5 minutes to consider:   Does Bob Wilson care about schools?

The MSBA  Manitoba School Boards Association  want and promote incumbents " the holders " Yes, a call for transparency , fairness and proper research on the full slate of strong candidates. MBSC demands quote " a full range of school division issues and concerns" no dialogue exists by this pro comfortable 'status quo'  SCHOOL BOARDS ASSOCIATION OK TO STATE candidate be capable,committed and caring
 
In the future school board elections should be fair  sample  is all rest stops  booked by incumbents? a list of  all advance polling of senior large holdings  unknown to new candidates.. Bob Wilson was tipped to only two and yes  incumbents all had mail boxes , under the door and business mail insertions all arrange the day prior to elections staff.
Full disclosure   school will close if strangers elected?  Wilson's wife a teacher  vs  incumbent an English teacher and owns education firm. Whose in conflict....  Finally, change qualifications of very large Ward # 1 ....candidates must reside in Ward for at least six months.


**Do you have any other comments regarding your candidacy?**

Do an honest research review  older schools  new programs and use....NEW ENERGY SAVINGS  RETROFITS, NEW WINDOWS, FURNACES A NEW ENERGY SAVING POLICY.   JOINT USE OF THESE SCHOOLS FOR  DAY CARES   in these under used schools.
why in private homes?  give owners  reasonable rents.  Sport activities   i.e. floor hockey , chess , arts and crafts.
Support the arts....even youth bands  underfunded for practice space....in my words  vote for change...value for trustee's paycheque!
 
KNOW ALL ABOUT THE DIFFERENCT NEIGHBORHOODS  in Ward # 1 Louis Riel School Division.  Bobby Wilson grew up in old St Vital / Norwood Grove areas.  Schools Glenwood and Glenlawn Collegiate modest 33 Clonard and 62 Ellesmere Avenue. Gordon Wilson and his two brothers all three from St Vital killed in the service for future public education and a peaceful workforce>  teenage bob  wilson joined the CNR FREIGHT and was sec_treas of cbrt&gw local #92. 
THE WILSON + GRAVENOR TEENS  MOVED TO WINDSOR PARK   21 bolder bay and then 97 HANSFORD ROAD FOR THE LAST SIX PLUS YEARS  199  KITSON STREET  in norwood grove. All located in Ward # 1  Louis Riel School Division.  Accessible  24/7  1-204-2371948   boblessing@mts.ne^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '2', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Mike Ducharme', office_address: '', phone_number: '781-2818', email: 'mjducharme@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have always valued public education and the role it plays in our communities.  As a Louis Riel Trustee these past eight years, I have worked hard to ensure that our division is a diverse, supportive environment for children and learning. 

**What experience will you bring to complement your role as school trustee?** 

I have served on the Louis Riel Board since the amalgamation of 2002.  During that time I have been Chair of the Board, Vice Chair, Finance Chair and Chair of Negotiations.  I sat on committees that conducted public consultations of the division wide lunch program and negotiated access agreements for the division’s changing role at Winnipeg Technical College.  I continue to serve provincially with the Manitoba School Boards Association Schools Insurance Committee (MSI) and have chaired that committee for the past four years.  Prior to my involvement with the Louis Riel School Division, I served in a variety of volunteer boards and positions including St. Boniface St. Vital Rotary Club, Jocelyn House fundraising and a Past President of the St. Vital Curling Club. 

**What are the major issues you would like to stand for and why did you choose these issues?**

My campaign literature confirms that trustees need to actively engage community and work cooperatively to build on what has been a successful nurturing of our division and community of schools.  Sometimes the role of a trustee requires difficult decisions and the public deserves a trustee that can make those decisions with compassion and consideration of some widely divergent points of view.   To facilitate this I remain accessible and open to the broader community.  On more than one occasion, residents have felt very comfortable to walk in the door of my business office at 755 St. Mary’s Rd. and know that I have been here to listen to them.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Louis Riel is a provincial leader in student service supports, French immersion, student evaluation & assessment and staff supports.  We need to continue to focus on policies and practices that put student education and achievement first while continuing to build classroom environments that recognize the incredible diversity of our community and also remain caring & supportive of all children.  All of the above was accomplished while not increasing our overall tax burden on the local homeowner, an accomplishment that we have maintained for the last three years.

**Do you have any other comments regarding your candidacy?** 

I would like to take this opportunity to thank the residents of Ward 2 for their support over the last eight years.  It has been a privilege to be your trustee and with your kind support, I look forward to serving you again over the next four years^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Chris Sigurdson', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '3', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 3)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 3)
person = Person.create!(name: 'Robert Page', office_address: '', phone_number: '275-1303', email: 'robertpageforeducation@gmail.com', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

Education has been my life’s work. Raising six children, four who are now adults, encourages me to contribute towards a quality school system that prepares children for life in the real world.	

**What experience will you bring to complement your role as school trustee?** 

Having served as a school trustee in Rivière Seine River School Division has given me excellent experience working with a progressive, effective school board. Serving on many committees and attending professional development conferences provided me with experience that can add value to the Louis Riel School Division.

**What are the major issues you would like to stand for and why did you choose these issues?**

Issues that require constant monitoring include an emphasis on academic achievement, keeping in mind that public school include a wide variety of children’s abilities. Learning can only develop a safe place. Board members must encourage administrators and teachers to be vigilant in the prevention of physical or spoken bullying. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

I should like to promote the addition of a proper theatre for Collège Jeanne Sauvé. It is one of the few high schools that offers theatre but has nowhere to perform. 

**Do you have any other comments regarding your candidacy?** 

Regarding my candidacy, my one comment is ...
“Vote for Robert Page: Experience Counts!”^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Wayne Ruff', office_address: '', phone_number: '254-6162', email: 'info@wayneruff.com', image: nil, website: 'http://www.wayneruff.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have served 6 years as a School Trustee and originally ran in  a bi-election as the amalgamated Board was dysfunctional and my experience on many Boards and in education, led me to believe that I could bring a sense of purpose to the Board and a re-focusing on children rather than on personal and political agendas.

**What experience will you bring to complement your role as school trustee?** 

I have personally been involved in education for 47 years ( as a teacher, coach, vice-principal, principal (6 different schools), assistant superintendent, trainer of school leaders on a provincial basis and as a  University Faculty of Education instructor. 

**What are the major issues you would like to stand for and why did you choose these issues?**

The major issues include 1. Meeting the needs of the changing demographics of public schools (immigrant learners, aboriginal learners, special needs students and gifted children (in academics, athletics, and the arts). 2. Changing demographics of school populations with housing developments in some areas and decreased student enrolment in others. 3. Funding for public schools must see greater contributions by the province to reduce the focus on property taxes as a method of funding public schools.

**Is there anything in particular you would like to change in your school division? In your ward?** 

The existing board has been very responsible with a focus on due diligence on all matters (personnel and financial ) . The Board needs to continue its focus on literacy and numeracy and data on these  two areas provided by diagnostic instruments and teacher assessment.

**Do you have any other comments regarding your candidacy?** 

I will continue to work for children and youth as I have for the past 47 years and will continue to be a supporter of PUBLIC EDUCATION as one of the key ingredients in our Canadian democratic system. 
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Alem Asghedom', office_address: '', phone_number: '254-1645 / 229-2005', email: 'electalem4schooltrustee@gmail.com', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=137455486301934&v=wall', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I care about public education as a citizen and a parent. I have seen how public education is crucial in the lives of my four children. I want to help improve our public school system. I believe that Louis Riel School Division is going through many significant challenges and faces some significant issues in the next four years. I am in favour of smaller class sizes and higher academic standards. Parent involvement is a key factor in this endeavour and I would like to see effective communication systems in place to keep parents informed so that they get a chance to talk with current board members about issues and problems that concerns them.

**What experience will you bring to complement your role as school trustee?** 

In addition to being a teacher for a decade I am open and transparent, continually communicate with, and act as the voice of the people I represent. This quality was demonstrated in my job as a teacher, librarian and social worker. In my capacity as a volunteer service provider to the community, I sat on numerous committees, and served in Immigrant communities, refugees, Non-government agencies and parent associations. I can make a difference by providing leadership and striving to continuously improve our public system.

**What are the major issues you would like to stand for and why did you choose these issues?**

There are many important issues to deal with. They include:

* Implementing programs such as physical education
* Renting out underutilized schools in older areas in favour of building or adding
to new schools in outer lying suburbs closer to where children are living so they
can walk to school. I believe are healthier alternative than always taking the
transit bus.
* Advocate for using social media like facebook in class. This will harness their
natural interest for greater learning opportunities and put the learning needs of our
children first.
* Fiscal responsibility and advocate for funding from the Provincial government.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Yes, I would like to see open and participatory discussions on budgets, programs,
and see greater parent involvement in the school system. During this campaign
these are the issues that are at the front of people’s minds.

**Do you have any other comments regarding your candidacy?** 

I would like to support inclusive (aboriginals, immigrants, refugees, special needs and gifted) quality education in our schools. Make education your priority and vote for me and if you would like to help out please call 254-1645 or email <electalem4schooltrustee@gmail.com>

Thank you^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Dave Richardson', office_address: '', phone_number: '253-1961', email: 'sarnia@mts.net', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I am an incumbent trustee in Ward Three of the Louis Riel School Division. An experienced Board works closely with parents and the community. This respectful collaboration ensures that our students receive a quality education from the Louis Riel School Division. For example, our French Immersion Program is renowned throughout this continent, our Information, Communication and Technology Department has earned recognition and received prestigious awards from Micro-Soft and our English as an Additional Language and transitioning programs for refugee and immigrant children is heralded throughout Winnipeg. This EAL Program, administered by Tim McKay, provides our young newcomers the potential to become contributing citizens rather than turning to crime and gangs because of poor language and communication skills.  The sustainability of these and many other programs, and new initiatives such as a technical vocational middle years immersion school, are the reasons I am running for the office of school trustee.

**What experience will you bring to complement your role as school trustee?** 

My career has been diversified as will be our students. I have been employed as a flight operations for Delta Airlines, an entrepreneur in the retail grocery business, and finally a teaching principal instructing students from grades 5 to 12 in a multi-age, grade, level, and English as an Additional Language, educational setting. Lifelong learning and self-directed learning skills are crucial for the success of our students in this constantly changing and competitive world. 
As a trustee in the Louis Riel School Division, I have served on many committees. Presently I am chair of the Technical Vocational Education Committee. In addition, I have served on the Winnipeg Technical College Board for years. I strongly feel that students must have access to technical vocational programs to engage in meaningful learning thereby maximizing their opportunities in the work world.

**What are the major issues you would like to stand for and why did you choose these issues?**

This Division is well governed and maintained. However, there is always room for improvement. The main role of any school division is to develop literacy and numeric programs with high expectations. I would like to see students’ work or evidence of learning to confirm that these divisional and provincial expectations are being met. I would like to expand our EAL program to include support for parents in their struggle to enhance their language skills and independence. Our increasing Aboriginal student population requires programming to connect and harmonize school and culture; graduation is critical to independence. Early learning and Child Care in our schools must be addressed. Early learning successfully prepares toddlers for Kindergarten and the shortage of licensed day care facilities are a major concern for our working and very busy parents. 
Finally, I would like to initiate a middle year's technical vocational school whereby students in grades six to eight spend a full semester introduced to vocational education: apprenticeship programs, and vocational opportunities/careers that are offered at Winnipeg Technical College and the Louis Riel Arts and Technology Centre at the High School level.

**Is there anything in particular you would like to change in your school division? In your ward?** 

I would like to see more collaboration with the community including budgetary discussions. How can we accomplish this? The Board has tried many approaches but it has not been successful. We need to hear from all voices in the community to determine need. Our student voice is strong but I would like to hear feedback from our student population regarding day to day issues in their schools.

**Do you have any other comments regarding your candidacy?** 

If you want a lawn sign or need any clarification, please call:
253-1961 or e-mail me at:
sarnia@mts.net

Thank you for reading ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Sandy Nemeth', office_address: '', phone_number: '299-6352', email: 'sandynemeth@mts.net', image: nil, website: 'http://sandynemeth.blogspot.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Sandy-Nemeth-Louis-Riel-School-Board-Ward-3/127524500631458', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I was motivated by a desire to give back to my community beyond what I had been doing as an active member of school parent advisory councils. In addition, as a parent of children in public schools in Ward 3, I was concerned that the important perspective of parents was lacking on the current board.


**What experience will you bring to complement your role as school trustee?** 

I have been a member of parent advisory councils for 10 years, including 6 in executive positions, 3 of them as Chair. This required leadership and organization, patience, the ability to work as part of a group that sometimes had competing goals, respecting the limitations of what we could accomplish in a given time frame, making decisions based on what was best for the school community, being accountable and fiscally responsible, remaining goal oriented and task focused, working with deadlines, and respecting the rules and procedures in place.

During my time as a PAC member we have organized school community BBQs, movie nights, & French Cultural events in the school; helped finance purchases of a school sign, a new scoreboard, microwaves, and projectors; we committed to donating money for students involved in school leadership and supporting their post-secondary goals; and we have added a new playground, and began a greening project which has so far seen the addition of 12 trees, 3 picnic tables, and an outdoor classroom on school grounds. In addition, we have reviewed countless policy documents as they were developed by the school board, and attended many consultation evenings.


**What are the major issues you would like to stand for and why did you choose these issues?**

I believe there needs to be more effort put into parent and community contact and consultation, as a way for ideas and information to be shared. Every day there are media reports of students dealing with physical and emotional traumas in schools and on playgrounds, so I also stand for ensuring safe, respectful, and secure schools. I support a request initiated by parents of the College Jeanne-Sauvé community for the construction of a facility for performing arts, as another way to nurture and develop student talent. Finally, I stand for the responsible

and appropriate spending and allocation of resources; human, financial, and otherwise as we all work together to build strong public schools.


**Is there anything in particular you would like to change in your school division? In your ward?** 

Given the role of technology in our lives, and the way it impacts our relationships with people, I would like to see all schools in the Division fully embrace any and all opportunities to have students learn with technology, while still respecting the critical importance and value of direct human communication. I will also encourage environmental initiatives, at both the division and school levels, and support partnerships with foundations, such as Evergreen, that will allow students to introduce and drive sustainable development in their schools and their community.


**Do you have any other comments regarding your candidacy?** 


I have been regularly attending Louis Riel School board meetings since January of this year. In addition to meeting all of the members of the school board, I have had the opportunity to become familiar with how the meetings are run, the procedures and protocols involved, and the roles and expectations of school trustees at board meetings. With this already in place, I can immediately begin to focus on the task at hand, namely the needs of students, teachers, parents, and our entire community.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '4', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 2)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 2)
person = Person.create!(name: 'Tom Parker', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Hugh Coburn', office_address: '', phone_number: '257-3921', email: 'hugh.coburn@lrsd.net', image: nil, website: 'http://www.hughcoburn.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 school board election?** 

I have been a school trustee since 1986 and at the present time I'm the President of the Manitoba School Boards Association.

**What experience will you bring to complement your role as school trustee?** 

Over the past 23 years I have been an elected school trustee in Ward 4, Louis Riel School Division. I have served as both Vice and Chairperson of the Board and have chaired all standing committees.

**What are the major issues you would like to stand for and why did you choose these issues?**

Bullying and Drugs are two of the main areas that school boards have to ensure that strong policies are in place for the protection of all students. Everyone is entitled to an education, school boards in the case of special need students have to make sure that there are the proper resources in place to assist each individual child.

**Is there anything in particular you would like to change in your school division? In your ward?** 

You are elected to support all children in all of the school divisions wards, Individuals that run for school trustee with agenda items are wrong and confused on the reason they are seeking election. It's all about "Children First and Children are our Future" and everything else is secondary. School boards can still help that future as long as we maintain our focus on what children of all ages need to learn and thrive-no matter where they live. 

**Do you have any other comments regarding your candidacy?** 

I have been elected by acclamation and look forward to the next 4 years serving the Louis Riel Community as a school trustee. School boards are comprised of citizens who invest significantly to ensure that the children in their communities are well served with programs and supports that respect unique local needs. We develop partnerships within our communities while we honour the values of stewardship. School boards make "tough decisions" at the local level to serve all students' best interests, even when we know some of those decisions will not receive universal support.
 
Please call me at 257-3883 or 257-3921 should you need a ride to the polls on voting for school trustees in Wards 1,2 and 3 in Louis Riel School Division. I would be happy to assist you. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: '2 By-Election', start_date: nil, end_date: nil, region_type: school_ward, parent_region: division, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Mike Daoust', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

I believe public education is the cornerstone of our society. It’s vital that our students are being engaged and learning at the highest level possible. As such, I believe educational accountability is a responsibility of school trustees and the boards they sit on. Taxpayers have a right to know how students are doing. Can they read, write and do math. Are they excelling emotionally, socially and physically? Trustees should be aware where students are at and set goals for higher student achievement. Overall progress must then be reviewed on a regular basis.

Are students getting the best educational value for our hard earned tax dollars? I believe this question must be answered and revisited on regular basis. Taxpayers demand the most efficient use of public revenues. Trustees have the responsibility of delivering a meaningful and engaging education that is affordable by the community. I would like to see local education taxes reduced through more efficient use of our current resources and increased funding from the provincial government.

**What experience will you bring to complement your role as school trustee?** 

I like to think that I bring a lay person’s common sense to the board table. As a trustee, I regularly asked many of the questions that parents and taxpayers would and should be asking of a school division. Tough questions must be posed on a regular basis on every single topic and issue. I brought my financial expertise as a Certified Financial Planner to the board table. I also brought my hat as a parent. I graduated from the division myself and my 2 sons did as recent as 2010. I have a nephew and a cousin in grade 4. I have sat on all committees of the school board and am able to participate immediately in crucial discussions on budget, negotiations and student achievement.

**What are the major issues you would like to stand for and why did you choose these issues?**

Educational accountability is my primary issue. Student engagement and safety (emotional and physical) are vital to student achievement and enjoyment. If students feel safe and comfortable they have the foundation set for a successful learning career. We must do a much better job engaging all students and preparing them for the work force. Only 20% of students go on to post secondary education. Our technical and vocational courses must be more readily available at all schools. While ATC provides excellent programs, too many students choose not to attend simply because they do not want leave their friends and peers.

**Is there anything in particular you would like to change in your school division? In your ward?** 

We need to improve accountability to our community, both in terms of educational and financial matters.

**Do you have any other comments regarding your candidacy?** 

If  you would like someone who cares greatly about public education, has a proven track record for asking tough questions and demands financial accountability, then I ask for your support on November 26th. If not thanks you for your interest and please vote on November 26th, 2011.  



### Questionnaire Response from the October 2010 General Election

*Mike Daoust also ran in the 2010 Winnipeg election in this ward. The following is his October 2010 response to our general election questionnaire.*

**Why did you decide to run in the 2010 school board election?** 

I believe public education is the cornerstone of our society. It’s vital that our students are being engaged and learning at the highest level possible. As such, I believe educational accountability is a responsibility of school trustees and the boards they sit on. Taxpayers have a right to know how students are doing. Can they read, write and do math. Are they excelling emotionally, socially and physically? Trustees should be aware where students are at and set goals for higher student achievement. Overall progress should then be shared with the local communities.
 
   Are we getting the best educational bang for our dollars? I believe this question should reviewed on regular basis throughout the year. Taxpayers demand the most efficient use of public revenues. Trustees have the responsibility of delivering a meaningful and engaging education that is affordable to the community. I would like to see local education taxes reduced through more efficient use of our current resources and increased funding from the provincial government^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Nancy Cooke', office_address: '', phone_number: '254-5802', email: 'nancycooke11@gmail.com', image: nil, website: 'http://www.nancycooke.wordpress.com', council_site: '', facebook: 'http://www.facebook.com/pages/Nancy-Cooke-for-School-Trustee-2011/227146744013922', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

I believe that our Public School System offers our children an enriching and diverse academic and social experience.  This experience will enhance their emotional and social development into young adults.  I have experience, as an Occupational Therapist, parent and business manager that I believe will allow me to make a valuable contribution to the Louis Riel School Board.  It is important that the School Board have a balanced representation in order to make decisions that will benefit all students and staff of the LRSD. 
 
I will work to ensure that the students and staff in the Public School System have the necessary resources available to them to support all children, while being financially responsible with taxpayers' money.  The taxpayers should be aware of how and where the money is being allocated.  Consultation with parents, staff and community members is an integral component of a successful Public School System.  This consultation ensures that the schools are meeting the needs of those who use them and those who support them.
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Brynne MacKenzie', office_address: '', phone_number: '256-4629', email: 'votebrynne@mts.net', image: nil, website: 'http://brynnemackenzieforschooltrustee.blogspot.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Brynne-Mackenzie-for-Louis-Riel-School-Trustee-2011/278752922159356', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

Taking on this challenge is something I have wanted to do for the past 10 years. I will never forget how frustrating and wrong it felt to have decisions made effecting my child’s education and school without having the right to be heard!  I will always work towards respecting our community and providing them with a satisfying mechanism to be heard.  I believe the business of educating our children is paramount.  I want to ensure that education remains a priority for our government.  The values that make young people gain confidence can start at home but are enhanced by good teachers and schools.  The public school system offers our children their first opportunity to be a part of a community of learners, and to venture into the world away from home.  As adults, it is our responsibility to ensure our children have the best environment for this learning to flourish.

**What experience will you bring to complement your role as school trustee?** 

I have a B.A. from the University of Winnipeg with a major in Developmental Psychology. For the past 3 years, I have been working as a casual Educational Assistant for LRSD.  I have worked in many classrooms across the division and each time I come away with an even stronger desire to support the important work that takes place in our schools.  Prior to this time, I worked for the University of Manitoba in in an academic administrative capacity.  I worked in Audit Services, the office of the Ombudsman and the Research Data Centres.  The governance and financial experience I have gained will serve me well in my responsibilities as a Trustee.   

**What are the major issues you would like to stand for and why did you choose these issues?**

I believe that community schools are a meeting place and a place where relationships are strengthened. It is this connection to others, and the sense of mutual responsibility that these connections bring, that will promote a healthy social conscience in our children.  I am also firm in my belief that if we invest and focus on providing our children with solid literacy and numeracy tools in Kindergarten to grade 3, the remainder of their educational experience has a much greater chance of success.  Financial accountability is also very important to me.  People work very hard to support public education through their taxes, and I want to ensure them that I will make every effort to hold LRSD accountable for its spending. 

**Is there anything in particular you would like to change in your school division? In your ward?** 

Trustees work for the people in their community.  I will foster more consultation meetings regarding important policies or initiatives that affect all children.  I will also have a website where parents can inform themselves about decisions and policies that may affect their children.  We need to encourage the relationship between home and school. A strong trusting relationship between families, their schools and school division fosters a healthy learning environment for the children.  

**Do you have any other comments regarding your candidacy?** 

Education is the best tool for breaking the cycle of poverty. Unfortunately, there is poverty in our community, and because of this, children suffer. I think we need to work together to address this, we need to listen to each other; and we need to listen to the world, because together we are stronger.  We will need that collective strength to get serious about preparing future generations to become leaders themselves.

I promise I will work hard to be your voice.  I will take on this responsibility with vision and collective wisdom.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jasmine Van Gerwen', office_address: '', phone_number: '', email: 'jasminevangerwen@gmail.com', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Jasmine-Van-Gerwen-for-LRSD-Ward-2-School-Trustee/286638184693405', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

I believe we all need to be involved, as parents and assist the School Division on how, when, where and why important decisions are made. I decided to run for School Trustee Ward 2, coincidentally after I had met with the Board Sept 20/11. At this meeting I addressed the Board on the lack of LRSD transportation for my son and his fellow students, travelling as much as 5.8 km away to a LRSD facility that would provide Mandatory Industrial Arts programs. The thing is, the bus transportation is not Mandatory.

Unfortunately, the WPG public transit bus was full that morning and drove right by him. The division had no real back up plan – that is a Major Safety Issue. There are a lot of discrepancies as to what categories these kids do & do not fall under, according to the website. As a concerned parent, I asked some very basic questions that night, and unfortunately, didn’t get justified answers. After which, the 6 page ‘No’ I received, got me concerned as a Tax-payer and area resident. Where & what is the LRSD doing with my funds?

**What experience will you bring to complement your role as school trustee?** 

I’m a full time parent with a full time job. I proudly work for Health Canada, First Nation & Inuit Health. In my current position I am with the Account Verification Unit where it is our role to examine Vendor Invoices and Billing to audit authorization, payments and discrepancies, based on the most Cost Effective means possible. This can involve reviews of anywhere from a couple of thousand dollars to hundreds of thousands of dollars on a daily basis.
I am a person of action, and in further support of my candidacy role - Several years ago, when I was a Customer Service Team Leader, with a local publishing co. for children's safety books, I singlehandedly shut down an inappropriate website after tracking down the domain company. Within 12 hours of recognizing the site as soft porn, the Domain Co took down the website. The website link (originally a legitimate website smoking prevention, but changed hands), had inadvertedly been published within company safety resource handbooks. 
This affected 66, 532 Safety Books which were distributed in 6 Canadian provinces and 9 States, and posed a threat to children.

I am committed to making sure our kids stay protected.......

**What are the major issues you would like to stand for and why did you choose these issues?**

Issues that I feel need to have more of the Board's Attention include:

* The overwhelming class sizes; a real need to reduce the amount of students per class and also focus on the real validity of integrated classes to ensure all students get the education and attention they require so no student gets left behind
* More LRSD staff feedback (Teachers, Support Staff, EA/TAs) need to be in place for smooth communication as to what works for some schools and where processes fail for others.
* Ensuring all schools have implemented safety plans in place (fire, evacuation, narcotic awareness, cyber stalking, stranger danger and lock down modes)
* More emphasis on the EA/TA roles in classrooms and supporting this valuable role in children's education in a class room setting
* With more and more students arriving during the school year from other countries, there needs to be more support systems in place to integrate them accordingly with language requirements as to not frustrate the new student and at the same time to not occupy all the teachers time from trying to get around cultural and language barriers.

**Is there anything in particular you would like to change in your school division? In your ward?** 

Transportation - Safety concerns with regards to this & not Band-Aid cures with concerns to Pubic Transit - First and Foremost it is the School District's role to provide safe and reliable transportation to all students. After I made an issue about the issue with my article in  ‘The Lance’ and then they decided to run a 2nd story on the plight of our kids the following week, so many people approached me from all 4 Wards within the School District as they are not happy that they are living with the decisions made by parents in the district 15 years or even 6 years ago. It is approaching 2012, there are valid safety reasons our children are faced with everyday such as pedophiles being released, random acts of violence and abductions. No one wants their child to become a statistic- it’s time for the LRSD Board to take a moment and re-evaluate the policies and re-evaluate the bussing expenditures.

**Do you have any other comments regarding your candidacy?** 

As a parent I believe there is nothing more important than the safety of our kids, whether its at home, in school or in between.
There is no greater peace of mind than the physical and mental well being or our children.
 
As a Taxpayer, I believe in Accountability. Everyone, including myself works hard to provide for our families and see that our kids are provided for. We all pay property taxes, a portion of which goes toward the School Division. As a taxpayer and area resident we need more information on where our money is being applied.
That's where the accountability factor comes in.
 
Last but not least, I would like to mention the emphasis of quality Education, for all kids, of all ages, of all grades. The balance of learning and development for children is a crucial and basic need. All children need an education to help them grow and in turn shape the world. I am reassured that in the LRSD, we are giving our kids just that. It is a wonderful and excellent school division that provides our kids with promise and opportunity for the future.
 
The possibilities are endless^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Sherry Liley', office_address: '', phone_number: '255-4753', email: 'saliley@mts.net', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/School-Trustee-Louis-Riel-School-Division-Ward-2/295798743781084', twitter: 'http://twitter.com/SherryLiley', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

For a number of years I have increasingly become more interested in politics and where I could fit into the process. I want to be a more active member of my community which in my eye's view details becoming involved in representing those opinions and concerns expressed to me by my neighbours, friends, and acquaintances. I am a people person and for that reason I am an excellent choice for the position of School Trustee because people of all cultures, ages, and income levels have found that I am easy to relate with. People feel comfortable in sharing their thoughts, concerns and ideas and know that I always want to help and represent them whenever I can if they themselves do not feel comfortable in doing so. The characteristics I have are that I am a good listener, excellent at researching information and very good at public speaking. I am an idea person and don't like to simply point out problems but provide solutions as well.


**What experience will you bring to complement your role as school trustee?** 

In my opinion a good trustee is one that can relate to those in the community they represent. I live in the Louis Riel School Division (LRSD) and have lived in the area for over 15 years. I first lived in Ward 2 and currently am living in Ward 3. I believe it is important that the elected individual has either attended school in the area or has children that have, or currently have enrolled children in LRSD. My three boys have attended Hastings School, Victor H.L. Wyatt, Dakota Collegiate and Glenlawn Collegiate. I take an active role in my boys’ education by being involved with volunteering in school activities and outings, being an active parent with the Parent/Teacher Council, and Safe Grad Committee. Other additional community involvement I have had is Heart & Stroke area coordinator, Canadian Diabetes canvasser, Welcome Wagon representative, co-organized Mom's group that ran out of the St. Vital Child & Family Services office, and Co-Chair for the second largest Winnipeg campaign for the United Way. These exemplify my capabilities as a leader in representing those in the division.


**What are the major issues you would like to stand for and why did you choose these issues?**

Drop-out rates of children have been on the rise and this concerns parents and educators. A way in which I think we can address this is by discontinuing the policy of pushing children ahead even when their marks do not warrant them to move on to the next grade.  Eventually it catches up and when these children do get into high school are frustrated and quit. It is our responsibility as parents and educators to show them the importance of continuing on to higher levels of education.
 
Better way to deal with bullying. Currently, the division policy is to suspend students that bully others. My personal connection as my son has been bullied in the past and was very upset on how it was handled by school administration. The student that was suspended had a few days off to basically enjoy himself at home to watch TV and play games. This did not send a good message and a better solution would be to have these children perform community volunteer work. A clearer message needs to be sent this behaviour is not okay and will not be tolerated.


**Is there anything in particular you would like to change in your school division? In your ward?** 

I believe many schools would benefit from starting a breakfast program. Many people in the area do not realize the large population of lower income families that live in LRSD, and how many depend on various agencies to assist them monthly. We need to take initiative to begin a program that supports our children with a good start to their day.
 
I do not think having a laptop computer to attend grade nine is a necessity. This past fall a pilot project was announced at Dakota Collegiate and many parents expressed concerns and frustration to me about it. Parents were not consulted, nor informed but simply told a laptop computer was a requirement, like a regular school supply item. Parents I spoke with expressed concerns that this was not an affordable expense a family could take on. Two related issues were the security of the laptop computer and how their child would be prevented from gaming, or visiting inappropriate websites. We need to get back to basics and when these children get to higher levels of education then they can choose whether or not a laptop computer is a requirement.


**Do you have any other comments regarding your candidacy?** 

Making a difference to my children and the community is of great importance to me. People that know me know my commitment is my word and I live by my word. I am a good listener and people like to share their thoughts and opinions with me because I do care. When I am elected as School Trustee my commitment to the community will be to provide better transparency on board policies. I will strive to share and include them in the decision making of policies. I will conduct focal groups to discuss issues pertinent to their area of the school division as I recognize the individuality of each area.
 
Caring about your children, you, and your tax dollars!
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Colleen Mayer', office_address: '', phone_number: '221-1721', email: 'votecolleen@shaw.ca', image: nil, website: 'http://www.colleenmayer.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 school board election?** 

My decision to run for School Trustee stems from my commitment to both public service and the citizens of St. Vital.  I have worked with numerous community organizations within St. Vital and believe that my experience, passion and commitment to our community would be best served by representing our children.  As a parent, I believe that educating our children is the best investment we can make.  Solid education, clear communication and a sense of connection to our community help shape our children and ultimately lead to vibrant and healthier communities. 

**What experience will you bring to complement your role as school trustee?** 

I have lived and worked within the St. Vital community for over a decade.  I believe the only way we truly understand the values and needs of our community and schools is by being involved.  Throughout my many years serving on community committees, I have learned that listening to the concerns of others and a willingness to remain open-minded is critical when decision-making must meet both the needs of our community and the requirements of our schools.  As a mother of two sons in the public school system, I offer a parent's perspective in understanding the day to day challenges that face many families in this community.  In my capacity as a small business owner, I understand the importance of competent financial management.  Being financially accountable is an important factor in the role of a school trustee whose position includes decision-making on spending divisional funds.  I believe my community and work experiences have given me the skills necessary to offer an open, healthy and inclusive learning environment that will enrich the school experience of children, teaching professionals and parents.


^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jeremiah Kopp', office_address: '', phone_number: '318-2109', email: '', image: nil, website: 'http://www.jkopp.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Edna Sears', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)

# Mayoral and Council Candidates from 2010

ward = Region.create!(name: 'Charleswood - Tuxedo', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Dashi Zargani', office_address: '', phone_number: '801-8912', email: 'dashiforcouncil@hotmail.com', image: nil, website: 'http://dashi.moonbooks.net/', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=140714212635519&ref=mf', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I decided to run in the 2010 civic election because I believe people need to be more directly connected to city hall. What do I mean by this statement? I mean that I am running so that people will have someone at city hall who will respond to the concerns of citizens in their ward and have a vision for the greater good of all citizens.

**2. What experience will you bring to complement your role as councillor?**

I bring a varied and extensive people background to my role as city councilor. I have worked in my own community as president of the Iraqi Community Centre and know first hand the difficulties many people face here in the city. My experience as a businessman has allowed me to hear the concerns of many in our ward who are striving to improve services for our citizens. Winnipeg is a diverse city and I believe I have the ability to to talk and listen to a wide range of people in and out of my ward to make Winnipeg a better city. At the end of the day civic government is all about people and improving their lives as well as responding to their concerns.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

There are many issues our city faces: Criminal activity by gangs, such as drug dealing and car theft, and the problem of poverty in our city. Their is a need to improve housing for many and the current level of people using food banks needs to be addressed. I choose these problems because they are issues that effect the quality of life of all citizens and all people deserve to live with dignity and respect.

The other issue is the need to continue to upgrade our city streets and sidewalks. Some of the streets and roads in Charleswood have not been repaired in many years. And finally, The issue of fair taxation needs to be addressed.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I want to show I am an active and open city councilor.

I want to hear from citizens their issues and concerns by meeting with them in a town hall setting or even smaller venues on a regular basis.

I want to work at reducing taxes not increasing them. We can do this by making the delivery of present services more efficiently.

I want to work to make Winnipeg a safe city for all citizens and to make Winnipeg a proud city; we have accomplished much in the past ten years and we can do more to make Winnipeg a prosperous and vigorous modern 21st century city^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jarret Hannah', office_address: '3418 Roblin Blvd, Winnipeg, MB  R3R 0C7 ', phone_number: '981-7488', email: 'jarret@votehannah.com', image: nil, website: 'http://www.votehannah.com', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=556626016', twitter: '', youtube: 'http://www.youtube.com/watch?v=26uw-2sVGpI', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Wendy Lenton', office_address: '', phone_number: '', email: 'lentonvote@mts.net', image: nil, website: 'http://www.votewendy.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Paula Havixbeck', office_address: '5606 Roblin Blvd. Winnipeg MB R3R 0H2', phone_number: '318-2100', email: 'paula@votepaula.ca', image: nil, website: 'http://www.votepaula.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Paula-Havixbeck/132513406768759', twitter: 'http://twitter.com/PaulaHavixbeck', youtube: 'http://www.youtube.com/watch?v=8cc4jbqVhH4', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

I am running for City Council because I am a person of action and I want to make a significant contribution to improve our ward and our city. I am passionate about being involved and giving to the community and when there are things to be done I step up and do them.  I am an excellent communicator and able to foster a balance and appreciation of the interests in a community while looking at the whole picture on a city-wide level. 

**Is there anything in particular you would like to change in our city? In your ward?**

Based on my priorities above, I would like to see city-wide changes on issues related to public safety, recreation facilities, infrastructure, poverty, revitalizing downtown, business, agriculture, capital region relationships, and taxes, to name a few. Most of all, I’d like to see a long-range plan for our city.  I do business planning with clients and am constantly getting them to look forward, set goals, and that helps them get where they’re going. We need to do this as a City.

**Do you have any other comments regarding your candidacy?**

I am committed to the community and to public service, which is why I’m running for City Council. The ward needs a strong presence on Council and former Councillor Bill Clement left a legacy, and I’m committed to continuing on with his legacy by serving the residents of this ward. I respectfully as for your vote on October 27^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Steve Szego', office_address: '', phone_number: '292-7456', email: 'steve@szego2010.com', image: nil, website: 'http://www.szego2010.com', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=142500559105113&ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I decided to run because I feel I can make a difference. I am passionate about this ward and a fully committed to representing it full time. I am a big proponent of community efforts and I believe investing in communities pays off on a larger scale. Safe, strong communities, lead to safe,strong neighbourhoods, which then lead to a safe strong city.

**2. What experience will you bring to complement your role as councillor?**

I have extensive customer service experience  and am used to dealing with the public on many issues that arise. I have presided on a board where I have learned that teamwork is vital, and have been involved in project management where I listen and engage and try to seek the best solution before making a decision.  

**3. What are the major issues you would like to stand for and why did you choose these issues?**

The major issues I like to stand for are traffic safety and the community clubs. I want to be part of affordable recreation. I have a vested interest as a constituent first, and want to do things for the community that I actually have control over. Crime is a very big concern and I feel a need for stronger police presence but with greater support and resources to enable them to do their job effectively. I actually speak to officers .Most break and enters or car thefts involve property and items that can be replaced. If someone is speeding or driving reckless in the neighbourhood, the result can lead to more severe consequences such as a fatality. That is lost forever.

**4. Is there anything in particular you would like to change in our city? In your ward?**

 I would love to be part of a cultural change. We have a great city. We need to move forward and support initiatives that make our city stronger. People have to believe in the city to make this happen and I want to be part of that. I am fortunate to live in and hopefully represent a great ward. I don't want to "'change" anything as much as enhance an already great area even more.

**5. Do you have any other comments regarding your candidacy?**

I only want to say that this is a very exciting time for our ward, but changes are coming to the entire city. I seek to represent not only my fine ward, but I also want to see what is best for all wards. I take pride in this city and I want to spread that pride to as many people as possible. I truly feel that I am the best candidate to represent us and if given the opportunity I will not disappoint. I will not offer any promises, but I will deliver results. Results that our constituents can be proud of^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Timothy Martin', office_address: '', phone_number: '885-4643', email: 'TimothyMartin2010@hotmail.com', image: nil, website: 'http://www.timothyamartin.com', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Timothy-A-Martin-for-Charleswood-Tuxedo/143636199004603?ref=ts', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

When I heard that Bill Clement had passed away, I realized it was vital to find someone as qualified as possible to represent us as councillor.  I would like to combine my professional experience as a real estate and small business lawyer, with my 46 years in our community, to be a knowledgeable, experienced and approachable advocate for our ward.  I know that I can serve as an independent, unbiased representative.  My agenda is simply to make our community the best it can be.

**2. What experience will you bring to complement your role as councillor?**

I grew up in Charleswood and have lived here all my life. My family has been involved in so many of Charleswood’s organizations since the 1960’s.  My wife and I and our two step-daughters live here and attended our schools.  I have practiced law for 18 years, 16 years in private practice in our community; dealing with issues such as senior’s estate planning, real estate and small business law.  This gives me valuable experience in dealing with community issues, the City, Province, courts, community committee meetings and municipal councils.  I’m used to helping the public navigate the complexities of bureaucracies and get results.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Infrastructure:   We need a careful watch over preserving what we value in our community, while overseeing improved roads and traffic flow, inevitable infill development, and development of new communities in open spaces.  This includes ensuring Kapyong Barracks is redeveloped in a manner that compliments the existing neighbourhood.  Transparency: I feel strongly about increased transparency in government, and believe an honest government has nothing to hide.  Fiscal responsibility:  I want to see value for my tax dollar, but see a careful need to balance that with preserving and renewing an aging infrastructure.

**4. Is there anything in particular you would like to change in our city?**

I would like to see more forward thinking and planning.  For example, proper roads should precede development.  I look forward to hearing the proposals from the Infrastructure Funding Council, as to alternatives to funding infrastructure renewal, aside from relying entirely on property taxes.  

In your ward?  Roads and drainage need more attention.  Traffic lights are needed by the senior’s centres on Grant.  Intersections and roads leading to Wilkes need improvement and traffic control.  Completion of the inner perimeter (for us, extending the Parkway South to Wilkes and beyond) will allow access to new communities being developed, relieve congestion on Kenaston and spare Charleswood homeowners who live South of Grant excessive volumes of traffic.  Whyte Ridge has traffic and traffic light design problems that need to be addressed, as well as playground maintenance issues.  Community centres need attention, and discussions need to be entered into as to how to have them best serve our community. 

**5. Do you have any other comments regarding your candidacy?**

It is my intention to scale back my law practice to make serving our community my full time priority.  I would like to set up a community advisory panel to assist me by providing their perspectives and advice from a broad range of representatives.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Livio Ciaralli', office_address: '', phone_number: '', email: 'votelivio@gmail.com', image: nil, website: 'http://www.votelivio.com', council_site: '', facebook: '', twitter: 'http://twitter.com/VoteLivio', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

The idea that UniCity had run its course and that the City needed a new Direction and a New Funding Formula crystallized. It provides the solution to mnay of our problems.

**2. What experience will you bring to complement your role as councillor?**

With an engineering background and being a Contractor for 20 years, I understand processes from Design to Tendering and bid approvals. This experience isn't taught from a book. its acquired over many years.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Municipal Funding Formual  - important  to get our independence in how we spend our money and what we want to Plan for the City in the next 50 years.

Community Funding Formula - as you probably guessed, the money must trickle down to the grassroots so they can complete projects that bring immediate relief and provide a positive impact to our neighborhoods.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like our City to stop chasing this vision that we must become some sort of cosmopolitan metropolitan metropolis. The beauty of Winnipeg is that it is small and a great place to raise your family and do your work. 

**5. Do you have any other comments regarding your candidacy**

The only thing i ask voters is that they look at what one is willing to sacrifice for them rather than the other way around. I am taking a stand and will Set an Example so people can regain some confidence in their governance.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Daniel McIntyre', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Keith Bellamy', office_address: '1318 Portage Ave, Winnipeg, MB  R3G 0V3', phone_number: '963-6310', email: 'keithbellamy@gmail.com', image: nil, website: 'http://keithbellamy.ca', council_site: '', facebook: 'http://www.facebook.com/bellamy.danielmac?ref=ts', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'John Cardoso', office_address: '828 Notre Dame Av Winnipeg, MB Canada R3A 0H3 ', phone_number: '228-9000', email: 'john@johncardoso.ca', image: nil, website: 'http://johncardoso.ca/', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=103630266361127&ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Cindy Gilroy-Price', office_address: '819 Sargent Ave, Winnipeg, MB R3E 0B9', phone_number: '781-6230', email: 'info@cindygilroy-price.ca', image: nil, website: 'http://www.cindygilroy-price.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Cindy-Gilroy-Price-for-City-Council-for-Daniel-McIntyre/139023256124257', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Harvey Smith', office_address: '546 Sargent Avenue, Winnipeg MB  R3B 3M4', phone_number: '289-1843', email: '', image: nil, website: 'http://www.voteharveysmith.net/', council_site: 'http://winnipegcity.com/', facebook: 'http://www.facebook.com/pages/Elect-Harvey-Smith-for-Daniel-McIntyre-Ward/151496278212616?v=info', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Lito Taruc', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Vote-Lito-Taruc-City-Councillor/162348070442317?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Elmwood - East Kildonan', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Rod Giesbrecht', office_address: '', phone_number: '661-5984', email: 'ragiesbrecht@shaw.ca', image: nil, website: 'http://www.rodgiesbrecht.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I am running to provide a hard working and experienced choice to the neighbourhood that I grew up and live in to make it a better place.

**2. What experience will you bring to complement your role as councillor?**

12 years as their school trustee & numerous other service experiences from helping those who need a hand up to encouraging & building community clubs.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Crime - people need to feel safe leaving their own homes for the community to improve, Health - a Wellness Centre at Concordia Hospital is a big need as well as improved active transportation options & recycling, Residential Streets - Molson street is a horrible example of neglect and their is so much more.

**4. Is there anything in particular you would like to change in our city? In your ward?**

Reverse the tradition of neglect of public facilities - ice rinks, community centres, parks - these all contribute to the quality of life we all enjoy.

**5. Do you have any other comments regarding your candidacy?**

The support given to me by the community has been wonderful.  As their city councillor I will bring a local, strong work ethic and years of experience that makes me unique among the choices people have.  Thanks for your support^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Nelson Sanderson', office_address: '', phone_number: '999-0291', email: 'jnasanderson@gmail.com', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Nelson-Sanderson-for-City-Councillor-Elmwood-East-Kildonan-Ward/105609459497558?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Shaneen Robinson', office_address: '', phone_number: '414-9030', email: 'robinsoncampaign@gmail.com', image: nil, website: 'http://www.shaneenrobinson.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Shaneen-Robinson-for-Next-ElmwoodEast-Kildonan-City-Councillor/114291435271317?ref=ts', twitter: 'http://twitter.com/shaneenthescene', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I am a lifelong resident of Elmwood/East Kildonan and I see the need for a new vision and direction for our area.  This ward is full of great people who deserve to have opportunities and strong leadership who will work for everyone.  Over the years I have seen our neighbourhood lose important community resources such as Kelvin Community Centre and Youth for Christ and we face losing more if we don’t start having our voices heard at city hall right now.  I am passionate, motivated and determined and I don’t want to risk this great community being ignored any longer and that is why I have put my name forward to run.

**2. What experience will you bring to complement your role as councillor?**

I have been an activist for people and important issues since I was just a child and as I’ve grown older I have learned that we must stand together as a community to create positive change-my strength is bringing people together.  I studied communications/journalism because I wanted to advocate for the rights of all people and our environment and bring about awareness and concern.  I am an award winning journalist/writer/emcee and activist who always stands up for what is right.  I feel my experience working well with everyone and my values and dedication will help me in my leadership.  My love for this neighbourhood and my relationship with the people in this community will guide me at city hall. 

**3. What are the major issues you would like to stand for and why did you choose these issues?**

The issues that top my list are Crime/Safety, Opportunities for Youth and Seniors, Infrastructure, Green Initiatives, Transportation, Strong Leadership and Transparency/Accountability at City Hall.  I chose these issues because as a resident that is what I feel needs to be addressed, but most importantly—this is what the citizens of Elmwood/East Kildonan want. 

**4. Is there anything in particular you would like to change in our city? In your ward?**

I want to see a fair and just city where everyone has the opportunities to be successful, feel safe and be proud of their city. 

**5. Do you have any other comments regarding your candidacy?**

I want to work for the people of this neighbourhood and once elected I promise to dedicate my life to being a strong leader who is always accountable to the citizens of this ward.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Thomas Steen', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

There are a number of reasons that compelled me to run as City Councilor. It is difficult to say which one was the most important since they all influenced me in making my decision to run. As an immigrant I have felt so grateful to the people of Winnipeg who welcomed me into their hearts and homes. As a result I have always felt a strong need to repay the hospitality the people of this city have shown me. I also believe that the city is at a turning point. I have sensed in the last few years that the city has made a noticeable positive change. I want to be part of a city council that continues to move the city forward.  Finally as a candidate in the last federal election I made a real connection with the people in the Elmwood – East Kildonan area.  When I was asked to consider running as a councilor by some of the residents of Elmwood – East Kildonan I felt honoured, seriously considered the request and was ultimately convinced to accept the challenge. 

**2. What experience will you bring to complement your role as councillor?**

Community Involvement

I founded a charity, the Amadeus Steen foundation in memory of our son which funds worthwhile projects for children and youths. Understanding Public Service is essential for a city councilor.  

Commitment to Excellence

As a professional athlete I understood the type of commitment and drive that it takes to excel at the highest level. As a City Councilor I will demand the same standard of excellence for myself, the city administration and in the services we provide to the citizens of Winnipeg.  

Leadership 

As Captain of the Winnipeg Jets players I was called upon by, fans, and team management, to motivate the players on the team to perform to their best of their abilities. In the same way I will provide leadership at city hall with my fellow councilors and ensure that we are focused on our goal, which is to provide excellent services to the citizens.     

Vision 

As a professional hockey scout I had to analyze the potential of up and coming hockey talent to determine their potential as professional. As City Councilors we are called upon to evaluate new ideas and program and quickly discern what fits with the long term plans and needs of Winnipeg.    

**3. What are the major issues you would like to stand for and why did you choose these issues?**

From my discussions with community leaders and the residents of Elmwood-East Kildonan I have developed a platform that is resonating throughout the ward. If elected I am committed to the following: 


* Ensuring the safety of our streets and homes through proven crime prevention programs that work closely with the community and the Winnipeg Police Services.

* Working with all levels of government in order to access infrastructure funds to maintain streets and services in Elmwood – E.K.   

* Developing and maintaining recreational spaces and programs.

* Demanding value for our tax dollars.

**4. Is there anything in particular you would like to change in our city? In your ward?**

City of Winnipeg

As I already mentioned I believe that the City of Winnipeg is at a turning point. We are moving in the right direction in terms of creating a positive environment. We need to continue this and finds ways to encourage more investment. We also need to have proven crime prevention programs implemented which work very closely with the community and Winnipeg Police Services to ensure that our streets and neighborhoods are safe for all. At the same time we need to create a positive environment for city employees so that they are motivated to provide excellent services. If we can maintain this momentum over time we can create a prosperous and safe city with affordable quality services. 

Elmwood – East Kildonan     

This is an area of the city that has been underrepresented by its elected officials in the past. There is a real opportunity this election to make a change from this pattern and in turn send a strong message that this area wants to contribute and be part of the revitalization of the city.  

**5. Do you have any other comments regarding your candidacy?**

I would like to say how enjoyable and important it is for me to be part of the democratic process. I would love to represent Elmwood East Kildonan on City Council and look forward to being able to serve the citizens of Winnipeg with enthusiasm and dedication in the coming term. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Gordon Warren', office_address: '', phone_number: '', email: 'gordvw@live.com', image: nil, website: 'http://www.winnipegcommunityforum.info/', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100001596338616&ref=ts', twitter: 'http://twitter.com/Gord4ElmEK', youtube: 'http://www.youtube.com/user/Gord4CityCouncil?feature=mhum', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

Mayor Katz wants to entrust our water & sewage treatment to Veolia, a French-based multinational conglomerate with an abysmal health & safety record & a notorious reputation that includes bribery of public officials, illegal political contributions, kickbacks, price-fixing & fraudulent accounting.

[http://documents.foodandwaterwatch.org/PrivatizationInFrance.pdf](http://documents.foodandwaterwatch.org/PrivatizationInFrance.pdf)

After watching Judy Wasylycia-Leis struggle in her mayoral bid, I felt compelled to join her in the quest to save our waterways & enter the race for Winnipeg City Council.

"All that is necessary for the triumph of evil is that good men (and women) do nothing."   Edmund Burke

**2. What experience will you bring to complement your role as councillor?**

In addition to my educational experience, I have spent many years working with developmentally challenged people through numerous organizations in various capacities.  

During the past 4 years, I have engaged in activism by partnering with groups & individuals to work against ethically challenged people (i.e. City Hall Caucus, OlyWest, True North Inc. & BODIES: THE EXHIBITION).  

The combination of these two disciplines plus my devotion to Green issues in the past decade have provided me with a solid ethical foundation as well as exceptional communication & networking skills.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

I believe that seeding, growing & protecting our communities must be Elmwood - East Kildonan’s #1 priority.  In order for that to happen, it is vitally important for the new city councillor to be tirelessly dedicated to ending the cycle of waste and urban decay that is perpetuated by City Hall.

The major issues I stand for are ending waste and corruption at City Hall.

**4. Is there anything in particular you would like to change in our city? In your ward?**

If Mayor Katz has taught Winnipeggers anything, it is that private interests must be kept separate from public interests.  Whether it’s Sam’s dealings with Crocus, the MTS Centre cash giveaway to Mark Chipman, Sam’s Goldeyes parking arrangement, the Asper stadium-mall-Bomber deal, or the more crucial secret water/waste management contract with Veolia, we (City Council) can’t allow private, commercial interests to compromise Winnipeg’s public interests ever again.

In regards to changing the Elmwood – East Kildonan ward, I would like to instill a sense of community & public safety in every single neighbourhood.  Every person should have a safe place to grow, be loved & realize one’s own potential.  Every citizen should be free to leave their home to walk the streets, 24/7, without the fear of being robbed or assaulted.  This can happen if we, the electorate, collectively choose to reverse the cycle of waste & urban decay.

**5. Do you have any other comments regarding your candidacy?**

I am the first and only candidate (mayoral, councilor or trustee) to construct an online forum to gather facts & opinions from local residents; it’s the official website!  The YouTube channel features a complete campaign speech.  This endeavour utilizes all available multi-media:  Email, Facebook, Twitter/my blog, YouTube, Newsfeeds plus press coverage to further the campaign.  

I don’t waste contributors’ money on yard signs because these serve no constructive purpose. Legal tags (graffiti) are what they are.  It will be the voters of Elmwood & East Kildonan who mark my territory if I am elected. 

I do visit shut-ins, ride buses & travel to malls & community centres to discuss the issues & encourage people to vote, but I don’t do trick-or-treat at people’s doorsteps—it’s passé & an unwelcome intrusion to most people.  The electorate is better served by the aforementioned technologies & open forums^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Fort Rouge - East Fort Garry', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Jenny Gerbasi', office_address: '3-901 Dorchester Ave. Winnipeg, Manitoba, R3M 0Y5', phone_number: '942-5655', email: 'mail@voteforjenny.ca', image: nil, website: 'http://www.voteforjenny.ca', council_site: 'http://jennygerbasi.ca', facebook: 'http://www.facebook.com/#!/group.php?gid=125650754137946', twitter: 'http://twitter.com/jennygerbasi', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**
 
City Council needs people who are not afraid to stand on principle and who work hard for their constituents.  I have the experience, knowledge and energy to be a mentor for newer councilors.  I also have many goals that have not yet been achieved under the current Mayor and Council. 

**2. What experience will you bring to complement your role as councilor?**
 
In my 12 years on council I have served as part of the “government” side and also as a strong voice holding the Mayor to account as opposition.  Both of these roles are needed.  I have Chaired many committees from Accessibility to Heritage to Protection and Community Services and am currently representing the city on National issues on the board of the Federation of Canadian Municipalities.  I was a community health nurse for 11 years and raised 3 children to adulthood.

**3. What are the major issues you would like to stand for and why did you choose these issues?**
 
Infrastructure and Community Safety are very big issues.  I would like to see existing infrastructure fixed and see the development of rapid transit.   We need to keep our neighborhoods vibrant, healthy and safe which means police presence but also means crime prevention by addressing the root causes of crime.   
 
I believe we must address environmental concerns such as climate change and take action on sustainable transportation and waste minimization.
 
I believe we must do something about the lack of affordable rental accommodation due to condo conversions and also create affordable downtown housing as part of a downtown revitalization plan.
 
**4. Is there anything in particular you would like to change in our city? In your ward?**
 
I  would like to see our city  be environmentally, socially and financially sustainable for the sake of future generations.
 
I would like to see a more open and inclusive way of  governing the city.  By this, I mean a more collaborative and cooperative approach by working with neighborhood groups, citizens, non profits, business and labour rather than the top down approach we have now.
 
I would like to see a better planned city with a planning department that has the capacity to do neighborhood planning and consultation better.
 
In my ward I would like to see better police presence, adequate investment in fixing existing streets and sidewalks, adequate maintenance of parks and recreation facilities.  
 
I would like city council to  address the issue of the severe shortage and the loss of affordable rental accommodation due to condo conversions. 
 
I would like to see more done to revitalize downtown including creating affordable housing so more people can live there.

**5. Do you have any other comments regarding your candidacy?**

I would like to have more safeguards in place to ensure honesty, integrity and transparency.  For example the 30 year contract for Water and Waste upgrades with Veolia should not have been kept secret.  The creation of a new Water Utility has not been properly explained or justified. 
 
I have called for the Province to create stronger Conflict of Interest Guidelines for municipal governments including the creation of an Ethics Commissioner^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Shane Nestruck', office_address: '381 Arnold Ave Winnipeg, MB', phone_number: '510-8828', email: 'shanedn@mts.net', image: nil, website: 'http://www.electnestruck2010.com/', council_site: '', facebook: 'http://www.facebook.com/#!/pages/Shane-Nestruck/115236605186014?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

Winnipeg's history is one of incredible Vision and Optimism, in Business, The Arts, and in Political Leadership. When I moved here in 1978 it was the greatest city on the prairies and known and respected across the continent!. Since then it has been declining and has lost that reputation.

Ten years ago this decline started to bother me and I became more politically involved. I have become convinced that Winnipeg's and Manitoba's biggest problem is lack of political vision and lack of confidence in the city's potential that is … unfortunately... often exacerbated by the very people we elect to govern this city and province.

I have traveled extensively in my work as a musician. That experience has convinced me that Winnipeg , situated at the centre of the continent with the cheapest and most reliable electric power on the continent, has the most exciting potential as a city of the future, but without leadership without Optimism and Vision and BELIEF in that potential , we are doomed to continue moldering along in mediocrity.
 
**2. What experience will you bring to complement your role as councillor?**
 
The main activity of a  musician is communication about all the wonders and difficulties of life through music. Without words and dealing only in the momentary existence of our creations, our integrity - the truthfulness of our message and our commitment to it – becomes obvious to the audience.

Music also demands listening skills of the highest level.
 
As a TEACHER, my ideas and communications through words, actions, and energy, were judged daily by the most critical and sensitive part of our society, our children and youth. Also my understanding, gained from those youthful associates gave me more and greater empathy with other people. Mentoring, a better concept than 'teaching', is the art of leading students to discovery and giving them the tools to understand.
Politicians would be wise to aspire to being listeners,communicators and community mentors.

As a BUSINESSMAN, owner of a music store and repair shop in Montreal, and as a musical entrepreneur, I have had to develop many skills, and most importantly a down to earth understanding of the need for planning and astute investment.

**3. What are the major issues you would like to stand for and why did you choose these issues?**
 
Integrity & Transparency, : A politician or a government that stops governing in the interests of the voters and constituents, has no integrity!

At all levels in this country Partisan Politics and the interests of Parties and their financial supporters, have taken precedence over the real needs of the voters.

When the Doer government ( the NDP party) chose money and its own needs over the city... selling the Waverley West lands and increasing urban sprawl, the cancer of this city - I awoke to the abomination that party politics had become.

Since then the over zealous partisanship of 'my' councillor and the actions of EPC, 'The 'Mayor's Cabinet' which meets behind closed doors and returns to City Council with a majority, plus the continued boondoggles happening all over town have motivated me to offer the voters a serious change in both the motivations and understanding of their representative.

The LAST thing we need at City Hall is a government of blind NDP zealots, or 'Business at all cost' Conservatives. What we need is INDEPENDENTS who vote on every issue in the interests of their constituents.

**4. Is there anything in particular you would like to change in our city? In your ward?**

The Way 'things' are done. I will use the Bike Path on Assiniboine Ave as an example of HOW the city could -  do better, save money &  actually achieve positive and constructive ends. If the city had consulted with the public, and not gone on a blind crusade for bicyclists, it might have  discovered that what was needed was a safer environment for bicyclists on the streets..   Study of situations in other cities, would have brought to light that a change in the speed limit to 30 kph in the whole area south of Broadway with speed bumps and a little enforcement of the rights and responsibilities of bicyclists would have provided that “safer environment” for everyone 

However, If and when  a bicycle path is an appropriate plan, car traffic can be separated from Bike traffic with those movable concrete curbstones we see all over town in parking lots and sometimes on the streets. The cost of that sort of re-design of a street is minimal compared with the boondoggle on Assiniboine. This procedure: Consult, Study, Think, then Plan. Would improve many aspects of our city, save a lot of money, and respect instead of aggravate citizens.
 
**5. Do you have any other comments regarding your candidacy?**
 
The Cities Agenda' Most of Winnipeg problems come down to access to tax revenues! You cannot trace where your Provincial taxes go or how well they are used. The Cities Agenda – giving cities more direct, reliable and predictable sources of funds to run the city – e.g 75% of Sales Tax & 20% of Income Tax collected in the city is the most serious and plausible solution to our city's woes.

Between this Municipal election and the Provincial election next year, city councillors must lobby hard for this issue. Because Winnipeggers represent 75% of the electorate in Manitoba we can put The Cities Agenda at forefront of the next provincial election. 

While the mayoralty candidates discuss 'solutions', make promises and argue over details which they have no ability to finance, I'd prefer to be 'straight' with you and discuss the source of those problems and the way we can move toward solving them. 

Democracy was born in cities in Greece over 2000 years ago. It is time the more direct and accountable democracy of city government regained its significance again^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ian Rabb', office_address: '723 Osborne Street Winnipeg, MB R3L 2C1', phone_number: '414-9499', email: 'info@ianrabb.com', image: nil, website: 'http://ianrabb.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Ian-Rabb/132798390100122', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Mynarski', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Greg Littlejohn', office_address: '', phone_number: '802-8528', email: 'electgreg@hotmail.com', image: nil, website: 'http://www.greglittlejohn.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Greg-Littlejohn/143850568958670?v=wall', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I first ran in Mynarski in 2006 and always planned to run again. In many ways our campaign for change has never ended. Over the past four years our supporters have become our friends. Together [we have achieved a great deal](http://www.greglittlejohn.ca/about/in-the-community/), not just in St. John’s where I live with my wife Nona, but throughout Mynarski Ward.

**2. What experience will you bring to complement your role as councillor?**

In addition to my solid record of community volunteerism, I have seven years experience working for the City of Winnipeg on streets repairs and sewer construction while I was a university student.

I have a law degree from the University of Manitoba and a degree in geography specializing in economic development from the University of Winnipeg.
 
I have been practicing law in North Winnipeg for over a decade and have considerable experience in dealing with civic matters and other issues of concern to the community.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Crime is the major issue. Many other issues are directly related to crime, such as concerns about the efficiency and effectiveness of our police services, and operations of our city community centres and recreational services.
 
The poor condition of many of our streets and infrastructure, as well as the maintenance of our urban forest is another major concern.
 
Housing is also a major issue as many people are finding it increasingly difficult to meet this basic need, especially low income housing.  
 
There are other issues of concern to residents, but I selected these three because they are most often mentioned.

**4. Is there anything in particular you would like to change in our city? In your ward?**

The economic redevelopment of Selkirk Avenue is something I am committed to working on with local businesses and other groups working on plans for this once prime commercial district.
 
I will continue to work with others on the actions necessary to restore Winnipeg’s pride in the North End. 
 
I also have a long term vision for the revitalization of our inner city. I would like to see the removal of the CPR yards to begin within the next 10 years.  A first step would be a feasibility study that looked at various options. I think we should build a sustainable community using smart building design for housing, recreation, business and transportation.

**5. Do you have any other comments regarding your candidacy?**

I have witnessed a significant change in Mynarski since I first ran here four years ago, which has inspired me with optimism for the future.
 
There are many young families and couples renovating homes and attracting others to our neighbourhoods.
 
As well, there is a huge population of young people growing up here who intend to stay. This generation is achieving higher levels of education and getting better paying jobs than the generation before.
 
This young and expanding market is exactly what profitable businesses need to become established here.
 
As an independent candidate, not beholding to any political party or association, I will put the interests of Mynarski first to build on the positive momentum in our community^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Ross Eadie', office_address: '530 Polson Ave, Winnipeg MB  R2W 0N9 ', phone_number: '963-8683', email: 'ross@rosseadie.ca', image: nil, website: 'http://www.rosseadie.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Ross-Eadie/7733811314?v=info&ref=search', twitter: 'http://twitter.com/rosseadie', youtube: 'http://www.youtube.com/rosseadie', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Jenny Motkaluk', office_address: '1385 Main Street, Winnipeg, MB R2W 3T9', phone_number: '415-5805', email: 'jenny@jennyforcouncil.com', image: nil, website: 'http://www.jennyforcouncil.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Vote4Jenny/126080587434988', twitter: 'http://twitter.com/Vote4Jenny', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

As a girl who grew up in this neighbourhood and now as a Mom of a girl who is currently growing up in this neighbourhood, I have a vested interest in making sure that our city and the ward of Mynarski in particular are properly represented. It is important to me that we send someone who is not merely educated and qualified, but someone who understands the needs and concerns of the citizens of this ward first hand.

**2. What experience will you bring to complement your role as councillor?**

I will bring my experience of having grown up and lived here in addition to my education at McGill University and University of British Columbia.  Further to that, I bring more than 15 years experience in negotiating between goverment agencies, universities and large and small companies.  I also will continue to maintain and grow my large network of associates that include friends, neighbours, community leaders and business leaders throughout North America.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

The single biggest issue of this election according to the residents, community groups and business owners in the ward of Mynarski is crime. I intend to continue working toward getting a cop on every corner to get control of the petty crime that is rampant in this city.
 
Secondly, over the years our business districts have suffered and declined to a terrible state of affairs. No one can deny this.  This absolutely has to change. Our community is filled with many young families and those families want to shop local and not always have to drive away to some other area to find shops, services and entertainment.
 
The third priority and this is very important to all of us living here in Mynarski, not just other parts of Winnipeg, is livable neighbourhoods.
 
A neighbourhood should be pleasant and relaxing, not nervewracking, ill kept or dangerous. 
A good city councillor should always be aware of the condition of the ward and everything in it. Including, the state of the playgrounds and roads and infrastructure. A good city councillor must go to city hall and fight for the good of the ward as well as the city.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like to change the reputation of our city and that of Mynarski. It hurts my feelings everytime I hear Winnipeg and Mynarski, The North End especially, described with any of these words; "poverty ridden"; "warzone"; "murder city".

This makes people think twice before visiting here, living here, investing here and certainly before moving here.
We have to get to work on fixing that.

**5. Do you have any other comments regarding your candidacy?**

As much work as this election is, it has been the most fun I have ever had. I can't say enough about what a priviledge it is to be meeting so many different people and hearing so many incredible stories. I have had so many wonderful compliments that I am often overwhelmed. Thanks to everyone who has talked to me and helped me so far^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'David Polsky', office_address: '1815 Main Street Winnipeg, MB R2V 2A2', phone_number: '415-6905', email: 'electpolsky@hotmail.com', image: nil, website: 'http://www.davidpolsky.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

As the only candidate seeking election in Mynarski Ward who is a life long resident of North Winnipeg and I have developed a clear understanding and awareness of the problems faced by the residents of our community. I believe I have the ability and leadership skills needed to influence, engage and to be a strong voice at City Hall on behalf of residents in our community. The residents and neighbourhood groups can count on me working continuously on their behalf making the necessary improvements for a safe, flourishing and robust community with a brighter future! I also believe being a City Councillor will allow me an opportunity to give back to my community.

**2. What experience will you bring to complement your role as councillor?**

I believe my 51 years of experience and knowledge of working with residents, neighbourhood associations, community leaders and other elected government officials will allow me to bring my dedication, commitment and leadership capabilities into focus towards working together with everyone for a better, safer and healthier community.   

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Firstly crime and safety is the most important issue and I am committed to making sure there is an increased presence of police, bike and foot patrols in our community. I will work towards the installation of “surveillance cameras” along Main Street and Selkirk Avenue and in other problem areas. I am also supportive of existing and new community citizen patrol programs like C.O.P.P. and Powerline. There is also the need to ensure better security lighting will be placed along residential areas that are experiencing problems with gangs, drug dealers and prostitution within neighbourhoods.

Secondly I heard many concerns from residents about the condition of our infrastructure; whether it was roads, sidewalks, curbs and back lanes.  I am committed to ensuring Mynarski Ward receives its fair share of capital funding to address the problems as crumbling infrastructure which impacts our vehicles, our ability to get to places we need to go, the value of our homes and our ability to walk safely.
Finally I am further committed to addressing the issues of affordable housing, investigating a rebate system for recycling participation, expanding community center family programming, renewal of neighbourhood parks, the elimination of wasteful spending at City Hall.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like an opportunity to bring back the historical sense of success and pride to Winnipeg’s north end. I would like to accomplish having the residents of Mynarski Ward take pride in their community, to feel safe in their neighbourhoods and celebrate their successes with each other. Our community is full of resourceful citizens, many who have started their neighbourhood efforts in this regard; but they need a caring City Councillor who is willing to work with them in achieving a brighter future.

**5. Do you have any other comments regarding your candidacy?**


Party politics is not the answer; it truly takes an independent representative who is able to work with all political parties to get things done at City Hall. This is especially true when dealing with the Provincial and Federal governments’ in requesting their support and assistance in providing funding for projects like the revitalization of our parks, housing and infrastructure renewal.

I also understand being a City Councillor is not for the faint of heart nor a part time endeavor. It requires assurance that your Councillor is prepared to help pile sandbags along the riverbanks of Scotia Street when flooding is upon us. That they will be there when you call for help or come to see first hand the problems you’re experiencing. It’s important your Councillor can provide the kind of representation you need when it comes to defending our community at City Hall. 

I make this personal pledge to you, with your support and vote on Wednesday, October 27, 2010 you can count on me being the hardest working City Councillor in Winnipeg, being there when you need me and working continuously on your behalf!^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Trevor Mueller', office_address: '', phone_number: '589-1714', email: 'electmueller@gmail.com', image: nil, website: 'http://trevormueller.weebly.com/', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Trevor-Mueller-Mynarski-Ward-Winnipeg/154077284616273', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

To say I am frustrated with how our politicians have been acting is an understatement, blatant dishonesty, back room deals, no consultation, disappearing services, this is not the way it should be at any level.  Aren’t politicians supposed to be our advocates, representing and bringing forward out needs?  I don’t see that anymore, in fact I really don’t see politicians at all, except for that 5 second sound bite on the
news while the city catches fire behind them.  Well the city isn’t just smouldering, or burning its in a raging firestorm of crime, violence, bureaucratic red tape and mismanagement that stops anything from ever getting done.  My friend was murdered this summer, how many others this fall, how many more before change comes that makes a difference, a difference that we need right now.  Events in the city continue to worsen, and it's drawn me now to focus on helping bring the voice of our neighbours back into the forefront at city hall.

**What experience will you bring to complement your role as councillor?**

I am sure others may bring wonderful skills, but I have to say I get things done, I will work with everyone and I can build consensus to resolve issues.  I have spent a lifetime doing just this working one on one with people of all ages and all backgrounds.  this for you. For 15 years I have served with CASARA Winnipeg, an organization that assists the police and military in rescue operations, the last 5 of
which I have been on the board.  More locally I spent the last year on the board of District #3 CFCA (Citizens For Crime Awareness (Neighbourhood Watch)) and helped the start of the new Faraday residents association.  We will need these skills to get our communities thriving again and I want to be the one to do it for you.

**What are the major issues you would like to stand for and why did you choose these issues?**

Personal safety and crime reduction are the main issues I stand for. We see evidence of it everyday, so much so we're running out of terms to describe it, chaotic, frightening, fatiguing, exhausting, enough
already.  Police need the tools now and the support to end this but it will take much more than just money and additional officers, and it won’t happen over night. It will take our own commitment too, our own resolve and our own engagement in the community.  I will help the growth of the WPS community support unit that will actively work with our community groups and organizations to find and solve our issues.  We to start acting now before more of our friends and family are touched by this.

**Is there anything in particular you would like to change in our city? In your ward?**

We must have open and public disclosure at City Hall so we can start to dream big again and have our citizens actively engaged and wanting it.  Malls and new stadiums with or with a roof and a public express route to match just doesn’t seen to resonate anymore with the issues at hand.  I want to see the redevelopment of Main street past Higgins, of Selkirk and Dufferin, I want to see businesses return and thrive, I want people to be safe again in there own homes.

**Do you have any other comments**

Age is not an issue, nor is rhetoric, ability and the forthrightness to work with the people and get things done is all that should matter.  If we can send 20 year olds to war then we can surely work with a 35 year old on council^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'John Petrinka', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'North Kildonan', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Jeff Browaty', office_address: '', phone_number: '663-4157', email: '', image: nil, website: '', council_site: 'http://www.jeffbrowaty.com', facebook: 'http://www.facebook.com/pages/Re-Elect-Jeff-Browaty-2010/125183614194069?ref=ts', twitter: 'http://twitter.com/jbrowaty', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I am running for office because I want to give back to my community. I choose to live in Winnipeg and North Kildonan and I want to help make it one of the most desirable places to live. I ran for office because I believed North Kildonan and northeast Winnipeg had been ignored for too long. We pay our share of taxes, but didn't get our share of the benefits. With projects like the Chief Peguis Trail extension, the Bronx Park Community Centre replacement, the Northeast Pioneer's Greenway pedestrian/bike trail between Raleigh and Gateway, the replacement of the Disraeli instead of a total closure and the Henderson Library expansion that's starting to change.

**2. What experience will you bring to complement your role as councillor?**

Prior to running for Council I worked as a real estate appraiser specializing in commercial, industrial and multi-family properties. This has given me a good background in dealing with property matters and a solid understanding of property assessment, acquisition and sale matters. I also did an internship in 2001-2002 with the University of Manitoba's Transportation Institute where I worked on various projects for the province and city. My term on council has also served as a great learning experience serving for two years on both the Standing Policy Committee on Infrastructure Renewal and Public Works and Standing Policy Committee on Property & Development. Understanding the City bureaucracy in order to get results for constituents requires a fair bit of on-the-job training and I believe I have gained a lot of experience in doing that.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

I stand for the renewal of Winnipeg's infrastructure, public safety, efficient delivery of civic services and fair taxation. Allowing our roads to crumble and not addressing them will only lead to larger repair bills in the future--we need to address our infrastructure now. Everyone deserves to feel safe in their homes and in their communities--ensuring a police presence in all areas of the city, not just downtown and the north end needs to be a priority. Finding ways to deliver civic services in the most efficient manner possible needs to be a constant process and while progress has been made, there is still room for improvement. Of every tax dollar raised, only 7.25 cents goes to municipal governments in Canada. Rather than increasing property taxes, I believe we should get a fixed portion of the current 7% PST. I also believe education taxes should be removed from property tax bills.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would really like to see Winnipeg's defeatist attitude change. I am a proud Winnipegger and I choose to live here. This won't happen with a single change but from strong leadership. We don't need to settle for second-best. In North Kildonan, one of the biggest complaints I hear is about the shortage of stores and restaurants. While there are limited opportunities to add new retail options due to a lack of available land, some older properties like the River East Plaza (Safeway mall) and the Springfield Heights mall on Rothesay are prime for renewal. I would also like to see Harbourview/Kil-Cona Park receive the attention it deserves as the major quadrant park in northeast Winnipeg. If re-elected I will work to find ways to develop the Harbourview pavilion area and make the dog park the city's premier off-leash facility.

**5. Do you have any other comments regarding your candidacy?**

It has been an absolute honour to serve the residents of North Kildonan for the past four years. If re-elected I am committed to continuing to provide prompt and proficient service to constituents contacting my office and working with residents to improve civic services^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Brian Olynik', office_address: '', phone_number: '415-5898', email: 'olynikbj@shaw.ca', image: nil, website: 'http://www.brianolynik.ca', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=141514522539064&ref=search', twitter: '', youtube: 'http://www.youtube.com/watch?v=9v29MzXfsUU', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**
 
My family and I have  lived in this wonderful area of the City  all our lives.  I am passionate about keeping North Kildonan vibrant in terms of community and economic development.  I have represented residents as a school trustee for the River East Transcona School Division  for 17 years , and want to continue to represent all the residents and ensure everyone receives the best service from City Hall.  As well, my years of supporting the community  as a volunteer at Gateway Community Centre  have kept me in touch with the residents as to their concerns as well as their ideas for improvement.   I am approachable and available to communicate with everyone and am committed to go to work for all the residents of North Kildonan.   

 
**2. What experience will you bring to complement your role as councillor?**

One of my strengths is my knowledge of public safety and policing issues, having worked more than 20 years as a teacher and counselor in the correctional system. That experience and knowledge will help in developing strategies to combat crime and increase safety.  I also have sound business knowledge  having worked many years as a professional agent for a major real estate firm in the NK area.  As a 17-year member of the Board of Trustees at River East/Transcona School Division, I was part of a team which  lead  multi-union negotiations affecting 2,000 full and part-time employees; and produced  budgets over $160,000,000.  Experience at that level is critical in working and representing the residents of North Kildonan at Winnipeg City Council when decisions are required about major expenditures and projects.  I also believe that communication and transparency is key to developing a vibrant North Kildonan.    In that regard, I am available and approachable to all the residents and will seek their input into the services and development that affect our community.   

**3. What are the major issues you would like to stand for and why did you choose these issues?**
 
Over the past several months, I have had extensive contact with the community by meeting residents personally and also by receiving many phone calls and emails.  The major issues are crime and safety; lack of transparency and communication from the City; poor infrastructure of our roads and sidewalks, as well as inefficient snow clearing on roads/sidewalks, especially in the areas with high concentrations of senior citizens’ homes.  There is also a need for more development at our local parks and walking trails; as well as business development including restaurants, shopping and local services. 
 
**4. Is there anything in particular you would like to change in our city? In your ward?**

I will hold public meetings inviting input from residents to hear their ideas so we, as a team, can ensure the viable and sustainable development of the community.

I will work with the Whellams Lane Tenants’ Association to halt development of  apartment buildings on their street. There is an elementary and junior high school at Whellams Lane and Henderson Hwy.  The traffic is extremely heavy, especially during the rush hour.  New development  will add to that issue by increasing traffic.  I am  not against development and will work with developers to locate other spaces for residential units in the area. 

I am committed to improving communication and will respond to residents about their issues from water main breaks, road repairs , littering and lack of traffic signs to slow speed on busy streets, to major projects such as the Chief Peguis Trail extension.  

As a parent and former volunteer and coach at Gateway Community Centre – I know it is important to invest in our youth and families. I will develop additional amenities at Harbourview Recreation Complex such as swimming and wading pools.  As well, the off leash dog area at Kil-Cona Park will be upgraded.   

**5. Do you have any other comments regarding your candidacy?**

I have appreciated and sincerely thank all North Kildonan residents who have contacted me and have provided their support for my candidacy for Councillor..  For those residents who do not know me, please visit my website at [www.brianolynik.ca](http://www.brianolynik.ca), email me at <olynikbj@shaw.ca> or call my election office at 415-5898.  I will return your call and would like to hear from you.  I would appreciate your support - please vote for me on October 27.  Thank you!^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Wendy Pasaluko-Plas', office_address: '', phone_number: '471-5375', email: 'wpasaluko@hotmail.ca', image: nil, website: 'http://www.wendyfornorthkildonan.ca', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=160447207315014&ref=mf', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

Well I decided to run in this year’s City Election because my mother told me, "If you don’t like the way things are done, then do it yourself!" So I am listening to her words from the past.  I am not happy with the way things have been done in my community and I believe that I can make a difference for the better. I know that it is hard work but I am not afraid. I am up to the challenge. 

**2. What experience will you bring to complement your role as councillor?**

I have worked in the Insurance Industry for over 25 years I understand people’s concerns when it comes to replacement cost values of their homes, the difference between a tax assessment value and a rebuilding value. I understand the effects of break and enter thefts and vandalism and how this can affect families, from feeling safe in their home and their neighbourhood.  

**3. What are the major issues you would like to stand for and why did you choose these issues?**

The effect of the Chief Peguis Trail Expansion, how this financial cost of over $110 million will burden taxpayers and their families for decades. How will this affect the safety of our children, pedestrians and drivers.

We need to focus on increased Neighbourhood Watch, Citizens for Crime Awareness Programs, Block Parents Programs and Anti-Graffiti Groups. We as a community need to work together with our Winnipeg Police Services in our area to make a difference.

We need to review the Police patrols that are assigned to North Kildonan in order to ensure that services are there to keep our community safe and assistance is available in time of n complete the Northeast Pioneers Greenway path, so people of the community can enjoy the green space, while chatting with a friend on a walk, jogging or riding their bike with children in tow. 

We need to develop Harbour View and Kilcona Park to make it a viable space. We should look to create a recreational space to celebrate reunions, have a family picnic, celebrate a birthday or just share a day in the sun with family or friends

Bring small business to our community to keep us going and vital part of the city.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like to help and encourage the people of Winnipeg, to realize the wonderful treasures we offer in our Great City. From our beautiful parks and trails, too many of our theatre and entertainment facilities, such as the Art Gallery or Pantages Playhouse or the Fringe Festival, or encourage families to see a Hockey or Baseball game, just to name a few ideas. We are made up of diverse people and cultures. Each bringing their own expression of beliefs, cuisine, heritage, dance, music and this can be celebrated in our city.  You just have to explore.  

**5. Do you have any other comments regarding your candidacy?**

I like to consider myself as the tortoise from the story of “The tortoise and the hare(s).” I may have been slow to start at the starting line but I will work hard, consider the pros and cons and finish the race. I do this with passion.  

You can visit my website at [www.wendyfornorthkildonan.ca](www.wendyfornorthkildonan.ca^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Old Kildonan', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Robert Chennells', office_address: '17-2595 Main St., PO Box 50025, Winnipeg, MB R2V 1M5', phone_number: '612-2245', email: 'info@robertchennells.ca', image: nil, website: 'http://www.robertchennells.ca/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

As a 30 year resident of Old Kildonan, I have experienced the area’s vibrant and dynamic climate, and feel that this energy has hit a plateau. I would like to renew that energy and promote the area as a positive community to live in.

**2. What experience will you bring to complement your role as councillor?**

As owner of a commercial contracting company specializing in retail professional and restaurant interior renovations, I have developed a great level of understanding of budgets, tenders and open communication with companies across Canada. Through personal experiences as a father, partner, volunteer, pilot, musician and friend, I bring trust, patience, dedication and approachability to City Hall.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

I feel the following are some key issues that I would like to see addressed for the ward:

* a. Promoting the area for more commercial development which would ease the taxpayer’s burden on school taxes, as we do not have a large commercial base to draw on at the moment.

* b. Upgrading the current infrastructure for safety concerns and better traffic flow

* c. A higher police presence and promoting the need for a new police district station to serve the area as well as be in a location to easily support the nearby wards as well.

* d. Upgrades to our community centres, development of splash pads/wading pools and increasing the number of bike & walking paths to promote active living.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like to see the City plan not just for the immediate future but also the put fore thought into the distant future as well when city planning. This city has such potential, as was shown in the past.  City Council has to take the step to make Winnipeg accessible to people, businesses and industries. I believe the City has started this process, but needs to push forward and increase the momentum. We have to promote that Winnipeg is a great city and not be shy about, be blatant without being rude.  Support the Bombers, Moose and Goldeyes even if they are a having a tough season, as they are our teams and representatives and ambassadors of the City as well.  Support the galleries, theatre, culture and people of Winnipeg. 

**5. Do you have any other comments regarding your candidacy?**

My run for Councillor is not for a job, but to make a better life and area for families like mine. The residents of this ward require a person sitting at City Hall who will represent their interests and concerns. A City Councillors responsibilities are to ensure that Winnipeg and it’s wards are looked after in the most appropriate way and be accountable to it’s residents^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Devi Sharma', office_address: '646 Leila Ave, Winnipeg, MB  R2V 3N7 ', phone_number: '339-9202', email: 'votesharma@mts.net', image: nil, website: 'http://www.votesharma.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Devi-Sharma-to-Winnipeg-City-Council/107803482616274', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Casey Jones', office_address: '675 Jefferson Ave, Winnipeg, MB  R2V 0P5', phone_number: '414-9199', email: 'info@caseyjones.ca', image: nil, website: 'http://www.caseyjones.ca/', council_site: '', facebook: 'http://www.facebook.com/pages/Elect-Casey-Jones-For-Old-Kildonan-in-Winnipeg-October-27-2010/147537438600471', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Point Douglas', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Mike Pagtakhan', office_address: '', phone_number: '', email: 'pagtakhan2010@gmail.com', image: nil, website: 'http://www.mikepagtakhan.ca', council_site: 'http://www.mikepagtakhan.ca/', facebook: 'http://www.facebook.com/pages/Re-Elect-Councillor-Mike-Pagtakhan/136358786397783?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

Since being elected in 2002, I have worked alongside so many awesome citizens to help propel the civic ward of Point Douglas into a place that has new homes being built in its older areas, dilapidated playgrounds are being replaced with new play structures, where a new regional recreation facility at 90 Sinclair has been built, a new Sinclair Park Community Centre is currently being constructed and where Main Street is seeing a rebirth with the completion of the new WRHA building, the soon to be completed United Way building at Main & Pacific and the construction of the new Youth Centre for Excellence at Main & Higgins. I am running again, because there is still more homes that need to be built in the inner city, our community centres need major upgrades and renovations, we need more recreational programming for children in our comunity, the rapid transit network needs to be expanded into Northwest Winnipeg, and I would like to establish McPhillips Street as a Business Improvement Zone.

**What experience will you bring to complement your role as councillor?**

The path from idea to reality is a long winding path, that requires perseverance, ingenuity, and creativity.  I know how to stick handle issues thru City Hall and have an advanced understanding of procedure.  My experience with Chairing several committees of Council such as the Standing Policy Committee on Protection & Community Services, the Citizens Equity Committee, the Winnipeg Housing & Rehabilitation Corporation, and being a member of several community organizations such as the Exchange District Business Improvement Zone, the Winnipeg Public Library Board, the Fred Douglas Foundation, and the Winnipeg Arts Council, have provided me with diverse and indepth avenues to demonstrate that I have a proven track record of making things happen: more books and computers in all Winnipeg Libraries, new homes being built in the inner city, the redevelopment of Old Market Square park, creating youth intern opportunities at City Hall, keeping our Arts & Culture fully funded, and investing in our community centres.

**What are the major issues you would like to stand for and why did you choose these issues?**

In the older areas of Pt. Douglas, stabalizing those neighbourhoods is a critical issue that is in part achieved with creating good housing stock, and upgrading our community centres with meaningful recreational infrastructure such as a skateboard park amenities, outdoor basketball courts, augmented with more recreational programming.  Keeping our neighbourhoods safe is another key issue.  Establishing a visible foot patrol presence in neighbourhoods is a strategy I will work with our Winnipeg Police Service to implement in neighbourhoods with higher incidents of crime.

**Is there anything in particular you would like to change in our city? In your ward?**

I want to see Northwest Winnipeg become more connected to both the UofW and UofM.  I see this occuring with the expansion of the Rapid Transit network along McPhillips.  This is a medium to long range vision, but advocacy needs to start now so that planning can take place to make this vision a reality!

**Do you have any other comments regarding your candidacy?**

Both mayoral candidates are discussing new revenues for our City, and this topic will continue to be discussed even more so after the election on Wed. Oct. 27th.  I strongly believe that our Provincial and Federal governments have a responsibility to provide growth income sharing with Winnipeg, the capital city of Manitoba.  Capital cities afterall are the growth engines of our country!  I will continue to be a strong advocate and call upon the area MLA's and MP's to champion growth revenue sharing for Winnipeg.  At the same time, I believe Winnipeggers desire to see more public investments in their communities and are likely ready for some form of affordable tax increase. I also know that being accountable and keeping citizen confidence for such a plan requires meaningful public consultation that I will fight to ensure takes place^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Herman Holla', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100001541363907&ref=ts', twitter: '', youtube: 'http://www.youtube.com/watch?v=XnRO1GcRo6o', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Dean Koshelanyk', office_address: '', phone_number: '269-3071', email: 'DeanKoshelanyk@shaw.ca', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/pages/Dean4PointDouglas/161287593886424', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

No candidate has expressed an interest in doing anything other then simple maintaining the status quo in our city. Decreasing crime, fixing our roads, maintaining our community centres are all great things. However these should be worked on constantly by our elected officials, not just at election time. In order for our city to move forward we need new fresh ideas and our ward desperately needs a councilor that will put the people of our ward as his top priority when making council decisions.

**What experience will you bring to complement your role as councillor?**

I have worked in and around the ward volunteering on my community centre board, hockey and soccer boards, coaching various sports teams and as a member of the GCWCC Plan 2025 committee which helped to set the focus for growth for our community centres for the next number of years. I have a background as a team lead in software quality assurance managing multiple concurrent projects and deadlines. I actively research the many issues and concerns that arise in our city and have worked with others to implement possible remedies.

**What are the major issues you would like to stand for and why did you choose these issues?**

* Crime
* Traffic flow and safety
* Transparency/Accountability
 
As a citizen of my ward, these are the most frustrating things that bother me, these are the things most talked about over coffee with a friend or pretty much anywhere you go and talk to people. People are just as tired of the petty repeat crimes as they are scared of the more violent crimes in our city.

**Is there anything in particular you would like to change in our city? In your ward?**

We are going to add one second to the yellow light timings. We are going to start using mobile radar camera data to increase the safety of our construction zones and school and park areas.  We are going to get police walking the beat throughout our ward. We are going to develop better bus service to get around our ward. As a councilor, every single expense will be listed online in detail so that residents know what the money is being spent on and they will see a lot more of that money being spent on actual ward activities.  I want to extend and greatly enhance the downtown walkway system using it to become a massive showcase for the various art and artists we have in our city.

**Do you have any other comments regarding your candidacy?**

People have grown very tired of changes that take place with seemingly little consultation, people have grown tired of hearing only negatives about Winnipeg from “outsiders”. Many new technologies allow us to communicate with residents right in their homes. If we can successfully engage people in a more meaningful and useful manner, our city will start to become the place we all want it to be. If elected I will continue to be heavily involved in and around our ward and city and will take the voice of our residents back to city hall to make this the city we can all be proud of^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'River Heights - Fort Garry', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'John Orlikow', office_address: '', phone_number: '453-1818', email: 'reelect@orlikow.ca', image: nil, website: 'http://reelect.orlikow.ca/', council_site: 'http://www.orlikow.ca', facebook: 'http://www.facebook.com/group.php?gid=62276715114', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Michael Kowalson', office_address: '1705 Corydon Ave, Winnipeg MB  R3N 0J9 ', phone_number: '414-9414', email: 'info@kowalson.ca', image: nil, website: 'http://www.kowalson.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Michael-Kowalson/140387885981190?ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. Boniface', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Dan Vandal', office_address: '126 Marion St., Winnipeg, MB R2H 0T4 ', phone_number: '890-5288', email: 'danvandalcampaign2010@gmail.com', image: nil, website: '', council_site: 'http://www.danvandal.ca', facebook: 'http://www.facebook.com/event.php?eid=131240633593119', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Christopher Watt', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. Charles', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Shawn Dobson', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I felt that the people in my Ward were left in the dark.  Decisions were being made at City Hall without any apparent  consultation with the residents.

**2. What experience will you bring to complement your role as councillor?**

The most pressing need in this City is infrastructure.  I will use my experience as a construction  carpenter to help find a long term solution to this problem.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

Transparency and Community Clubs. Transparency will bring trust back to City Hall and active Community Clubs will  bring our community together. 

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like to change the (walk) lights at intersections to numbers and increase the time allowed so that seniors and the disabled have adequate time to cross.  
   
**5. Do you have any other comments regarding your candidacy?**

I am independent and do not belong to any political party.  I will support all good ideas and will not play party politics^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Grant Nordman', office_address: '110 – 3393 Portage Avenue', phone_number: '888-7735', email: 'rgn@mts.net', image: nil, website: 'http://www.grantnordman.com/election', council_site: 'http://www.grantnordman.com', facebook: 'http://www.facebook.com/profile.php?id=697483159', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

It has been my honour to represent the citizens of St. Charles Ward at
Winnipeg City Hall for the last four years.  I am proud of the
progress that council has made during this term, and I feel that we
need to continue moving Winnipeg in the right direction.

**2. What experience will you bring to complement your role as councillor?**

* Resident of the area for 48 years.  Grew up, raised my family, ran
my businesses in St. Charles Ward.

* 10 Years Experience as President/CEO of the Assiniboia Chamber of Commerce.

* 4 Years as City Councillor (serving on Winnipeg's Committee on
Protection and Community Services & Mayor’s Seniors’ Advisory
Committee among others).

**3. What are the major issues you would like to stand for and why did you choose these issues?**

In consultation with the residents of St. Charles Ward, I have the
following priorities:

* Serving seniors through the Mayor's Seniors' Advisory Committee,
construction of affordable housing for seniors, sidewalk maintenance,
snow clearing and recreation.

* Repairing & improving our roads, back-lanes, community clubs & playgrounds.

* Supporting Winnipeg's Police Officers, Firefighters and Paramedics by giving them the tools they need to keep us safe!

* Working WITH the business community to grow our city, create jobs and
develop new opportunities like CentrePort.

* Voting to keep your property taxes low. Our friends and neighbours on
fixed incomes CANNOT afford to pay more property taxes.

I WILL NOT VOTE TO RAISE YOUR PROPERTY TAX RATE !

**4. Is there anything in particular you would like to change in our city? In your ward?**

* Greater availability of affordable seniors’ housing in West Winnipeg.

* Change city policy on gravel back-lanes to allow funding for
appropriate maintinance.

* 1% of Manitoba’s PST revenue dedicated to road and bridge repair.

**5. Do you have any other comments regarding your candidacy?**

Experience counts.  I have dedicated the last four years of my life to
dealing with the serious issues facing the City of Winnipeg and St.
Charles residents, and I will continue to do so if you support me with
your vote on election day^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Lloyd Finlay', office_address: '', phone_number: '', email: 'lfinlay1@mts.net', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/profile.php?id=100001391032424', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I'm running to make a difference and to provide a voice for the ward of St Charles.

As your councillor I will make ever effort to keep the constituents informed about the activities at city hall.

**2. What experience will you bring to complement your role as councillor?**

I have extensive experience in management and organizations of unions and associations through out the province.

I have an clear view of the needs of the ward as I'm a long term resident of the ward.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

We need to bring back Community Policing

Refurbish our parks Plan for affordable senior housing - not the kind of housing proposed for Oblate Field  on St Charles.

Provide addional support for our community clubs

Promote community and programming

Attend to infrastructures - streets and bridges. 

**4. Is there anything in particular you would like to change in our city? In your ward?**

We need to start planning and not developing in the Knee jerk fashion we have now.

When a proposal such as the expansion of Polo Park is put forward, we need to involve the public in a consultation. Further we need to conduct an environmental study  to investigate how such a development would impact the surrounding communities and the existing traffic patterns^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. James - Brooklands', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Scott Fielding', office_address: '2371 Ness Ave Winnipeg, MB R3J 1A5', phone_number: '272-0452', email: 'reelectscottfielding@gmail.com', image: nil, website: 'http://www.scottfielding.ca', council_site: 'http://www.scottfielding.ca', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I want my daughters to inherit the strong, vibrant community that I grew up in.  I was born and raised in St. James where I continue to live with my wife Michelle and daughters Paige and Brynn.  I have been involved in many community organizations and want to make a difference by enhancing the quality of life and making the community safer for the residents of St. James-Brooklands-Weston.

I feel I have accomplished much over the past 4 years but there is still much more work to be done and I have the passion and energy to make our community an even better place to live, work and raise a family.

**2. What experience will you bring to complement your role as councillor?**

I am a graduate from the University of Manitoba with an Advanced Bachelor of Arts degree in Economics and Political Studies at the University of Manitoba.

I worked for the Government of Manitoba in a variety of capacities and have over 10 years experience working in the private sector. 

I have always been an active member of the community. I served as Bourkevale Community Club’s fund-raising chairperson for three years, have been an active member of the Assiniboia Chamber of Commerce and served on the Winnipeg Convention Centre Board of Directors.  I am currently the Chair of Finance for the City of Winnipeg, the Past Chair of Property, Planning & Development and sit on the Board of Directors for the Assiniboine Park Conservancy and the St. James Biz.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

I feel there are 4 main issues:

Fighting Crime & Safety:

* Put more police officers on the street
* Support for more police cadets so our police can be on the street
* Continue to lobby the federal and provincial governments to fix the revolving door justice system
* Support local crime prevention programs

Roads & Infrastructure:

* Make the improvements necessary around Polo Park to ease traffic congestion and improve the roads
* Continue to work hard to have more evening and weekend construction so jobs get done quicker
* More funding for our roads, bridges and sidewalks
* More funding to fix our gravel back lanes.  (This would include changing the bylaw to allow for gravel to be added to lanes, having lanes graded more frequently and buy more graders)

Enhancing our Recreation & Community Facilities:

* Commit funding to upgrade 8 more parks and playgrounds
* Establishing a new facility for the St. James – Assiniboia 55+ Centre
* Committed funding for 2 new splash pads
* Provide more funding to expand the Weston Community Centre
* Providing funding to upgrade the tennis courts at Silver & Collegiate
* Provide funding for an outdoor basketball court for the Eldon Ross pool area
* Continue to fund and support all 6 community centres in the ward

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would like to make both the community and the City safer for our citizens.  More investments into our roads, infrastructure, community and recreational facilities create a sense of pride for our citizens and I believe we must continue to make the upgrades. 

**5. Do you have any other comments regarding your candidacy?**

Accountability & Transparency:

* Continue to host town hall meetings
* Continue to provide an annual newsletter to taxpayers
* Post expenses online on a monthly basis
* Continue to keep an updated website that includes all speeche^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Fred Morris', office_address: '', phone_number: '795-1583', email: 'mdmorris2@hotmail.com', image: nil, website: '', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=116396295075199&v=info&ref=search', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

I decided to run because I feel that I can do a better job dealing with our ward issues. The main issues in this ward have usually received very little attention. I am an Independent thinker who will not be let any Mayors concerns dominate those of my Ward. 

**What experience will you bring to complement your role as councillor?**

I have a university degree in Economics. I  have extensive experience in the restaurant and delivery business. I have worked in both management and non management. I have always lived in or near the ward.

**What are the major issues you would like to stand for and why did you choose these issues?**

There are a variety of local issues. We need;

* another Open House on the Sturgeon Creek Community Club Project
* the beautification of the St. James Civic Center parking lot
* the rehabilitation of the Portage Avenue at Route 90  Pedestrian Underpass
* a half signal Traffic Light at Logan and Dee
* a public library in the Brooklands and Weston area.

**Is there anything in particular you would like to change in our city? In your ward?**

I would like to change the way we schedule regular City Hall meetings. Their times should never conflict. They should be held in the evening. More of these meetings should be held away from City Hall. If we had more accessible meetings, we would eliminate  the problems of poor consultations.

**Do you have any other comments regarding your candidacy?**

I feel that I can be an effective Independent Councillor. I have no current ties with Labour, Business, or any political party. I will work for my ward^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Deanne Crothers', office_address: '1853A Portage Avenue, Winnipeg, MB, R3J 0G8', phone_number: '889-0418', email: 'deannecrothers@gmail.com', image: nil, website: 'http://www.votedeanne.ca', council_site: '', facebook: 'http://www.facebook.com/deannecrothers', twitter: 'http://twitter.com/VoteForDeanne', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

I am running because I’m frustrated with the lack of practical planning and the habit of sacrificing the well being of the city’s people for dubious gains.

City hall needs to be listening to the people it represents. It should be communicating more clearly on important issues with the public. It seems to me that decisions are being made to support projects that the public is clearly asking for more information on. The Veolia deal as an example. I’m not interested in having more high priced projects, (i.e. the water park), until the places and services of this city are brought up to date and maintained. Quality of life for Winnipeg people should be a significant part of decision-making at city hall.

**2. What experience will you bring to complement your role as councillor?**

My previous work as an Adult Literacy Instructor brought me into contact with a variety of people, many of whom were struggling with issues in their lives that were holding them back from succeeding. I learned to be a good listener, developed a deeper sense of empathy for others, and how to look at a problem from several angles to find the solution that worked best for that person, with that person. These three skills go a long way when you are problem solving and better yet, everyone feels good about it at the end of the day.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

My top three concerns are proper support for community initiatives, infrastructure and the issue of crime. I feel that with a stronger sense of community within wards, and a city hall possessing the vision to promote this, many of the issues we face would be less critical or non-existent. This requires effort on both the part of the citizenry and city.  A stronger sense of community from actively involved residents would have implications on the level of crime in neighbourhoods where people are engaged over what takes place on their streets. Time and money spent at this level is a good investment and will, I believe, be less expensive in the long run, allowing for funds to be reallocated to other city concerns.  Infrastructure is again tied to the quality of every day life for the city's people, whether it affects the roads they drive or bike on, the city owned buildings they spend time in or the operation of basic services such as water and sewer.  We can't afford to keep patching things together-we need vision.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would really like to see the city develop a comprehensive plan that would address the city’s development over the next 5-12 years.  The first 5 would be spent taking care of the great features of this city that exist, but are poorly cared for or simply neglected. The next 7 would be spent developing a few, far-sighted additions to what the city has to offer and doing those few things very well.  Winnipeg is unique. We should be making the most of what we have because it’s worth taking care of. With a clear vision and a good, solid plan we could be the example of what a healthy, cultured, innovative city should be. 

As for my ward, I’d love to see a St. James-Brooklands farmer’s market. It would be a great opportunity to develop community appreciation and there is nothing like seeing people in your area on a regular basis to deepen that sense of connection and responsibility one has for the place in which they live.

**5. Do you have any other comments regarding your candidacy?**

I am just like many other St. James-Brooklands residents. I work, pay my taxes, worry about my kids, feel like I never have enough time to do as much as I would like, but try to take in as much as I can of what this city has to offer. There are things about Winnipeg and my ward that I love and there are things that I despair over. I believe that if enough councillors at city hall have the will to find solutions by working together, through healthy debate and the spirit of cooperation, the city could quickly begin to improve the lives of all of its citizens. If given the opportunity, I intend to represent the people of my ward in this fashion^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. Norbert', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Louise May', office_address: '2445 Pembina Hwy, Winnipeg, MB  R3T 2H4 ', phone_number: '799-4076', email: 'info@louisemay.ca', image: nil, website: 'http://www.louisemay.ca/', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=120287021349531', twitter: 'http://twitter.com/StNorbertLouise', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Justin Swandel', office_address: '', phone_number: '960-8683', email: 'jswandel@hotmail.com', image: nil, website: 'http://www.swandel.ca', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. Vital', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Gord Steeves', office_address: '', phone_number: '', email: 'gordsteevescampaign2010@shaw.ca', image: nil, website: 'http://steeves2010.com', council_site: 'http://www.gordsteeves.com', facebook: 'http://www.facebook.com/profile.php?id=100001622583689', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

I've had the privilege of serving as the city councillor for the St. Vital ward since 2000.  I grew up in St. Vital, and have called it home my entire life.  My wife and I are proud to be raising our children here.  St. Vital and its people are near and dear to me - and there is no better way to affect change than by serving in public office.  I have a list of specific projects I want to complete this term in St. Vital.

**What experience will you bring to complement your role as councillor?**

I now have ten years experience as the city councillor for this ward, and previous experience as an area school trustee before that.  In my role as councillor, I have been entrusted with the chairmanship of the Protection and Community Services committee and most recently the Planning, Property and Development committee, which has afforded me a very hands on experience with countless numbers of major city issues.  I serve as Acting Deputy Mayor, giving me the opportunity to serve as an ambassador for the city for many special events.  I am also a lawyer, and have always been very involved in my community.  I have spent years building strong relationships within the community, and together we've been able to do a lot of good work here in St. Vital.

**What are the major issues you would like to stand for and why did you choose these issues?**

The main issues for me have been and continue to be public safety, infrastructure and community improvement.  We need safe, thriving neighbourhoods in which to raise our families.  

**Is there anything in particular you would like to change in our city? In your ward?**

I would like to see a decrease in crime in the city as a whole, as well as in my ward.  Being a father of young children, it's especially important to me that we raise our children in a safe environment.

**Do you have any other comments regarding your candidacy?**

The last ten years as the councillor for St. Vital have been the best ten years of my professional life, and if again given the opportunity, it will be my pleasure to continue to serve the people of St. Vital and the city of Winnipeg^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'Transcona', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Russ Wyatt', office_address: '', phone_number: '222-2930', email: 'wyattforcouncil@gmail.com', image: nil, website: 'http://www.russwyatt.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Vlad Kowalyk', office_address: '', phone_number: '224-3792', email: 'vlad2@shaw.ca', image: nil, website: 'http://vlad4council.weebly.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**1. Why did you decide to run in the 2010 Winnipeg election?**

There was a sense of frustration within the community due to the residents’ concerns not being acknowledged or addressed.  I decided to run because allowing the incumbent to win by acclamation would only increase the frustration level but more importantly residents must always have a choice of representation. 

**2. What experience will you bring to complement your role as councillor?**

As a professional engineer I will bring the following to compliment my role as councillor:

* A strong code of ethics stressing honesty, integrity and public interest/safety
* a strong problem solving background 
* the ability to set and work within budgets

**3. What are the major issues you would like to stand for and why did you choose these issues?**

* Responsibility and communication

Residents in existing neighbourhoods concerns are not being acknowledged or addressed and changes are being made without public consultation.
 
* Safety

Police resources allocated to Transcona need to stay in the area on patrol and to enforce traffic laws. 
 
A safer truck route network is needed
 
* Community

Green spaces and civic recreational facilities are not being maintained/upgraded
 
* Infrastructure

Roadways/sidewalks in existing neighbourhoods are crumbling and tree maintenance is almost non-existent

**4. Is there anything in particular you would like to change in our city? In your ward?**

Day Street, a non regional residential collector roadway running through the heart of Transcona and lined with schools, churches and residences needs to be re-designated so that heavy equipment and semi trailer trucks are restricted from operating along it^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = city_of_winnipeg
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Judy Wasylycia-Leis', office_address: '650 Portage Ave., Winnipeg, MB  R3C 0G6', phone_number: '777-5839', email: '', image: nil, website: 'http://www.judyformayor.com', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=345670435188&ref=mf', twitter: 'http://twitter.com/judy4mayor', youtube: 'http://www.youtube.com/user/judy4mayor', linkedin: '')
questionnaire = %Q^** Why did you decide to run in the 2010 Winnipeg election?**

The short answer is that I'm running because I love this city. It gives me tremendous pride to call Winnipeg home, but I also believe that this city I care about so much has some deep-rooted challenges that I don't think we can ignore any longer. We need to start doing better at City Hall, and I'm running because I know that a stronger city is within reach if we get serious about facing our challenges head on. We can't fix everything overnight, but we can start tomorrow on a plan to make things better. That's true whether we're talking about beginning to reinvest in our infrastructure, whether we're talking about giving every kid the chance at a bright future and steering them away from crime, or whether we're talking about building a rapid-transit system or rejuvenating our downtown. With some new direction at City Hall we can really start to make things happen.

** What experience will you bring to complement your role as mayor?**

I've been proud to have spent my adult career working on behalf of Winnipeggers. It gave me immense pride to represent Winnipeg families as a member of parliament in Ottawa. I know from experience how much is possible when you're willing to leverage the privilege you have as an elected official to work in partnership with people in the community to get things done. I've served as a provincial cabinet minister and before that, worked with a number of community organizations here in the city. I've tried my best to make public service my life's work, and I'm running for mayor because I know in my heart that we could be doing so much more for Winnipeg families at City Hall with a different approach and an open door.

** What are the major issues you would like to stand for and why did you choose these issues?**

First, I think Winnipeggers deserve to know that City Hall is looking after their interests. I've made it a key commitment in this campaign to bring back transparency and openness at City Hall, and that means a number of things. First, it means we don't negotiate backroom sewage deals with foreign companies that would tie our hands for decades, and on a more immediate basis it means a mayor who's out in the community showing leadership, being engaged and listening to the concerns of Winnipeggers. I also believe we need to end the neglect of our crumbling infrastructure and start to reinvest. I've put a plan on the table to do that. I've been transparent with Winnipeggers about what it would cost: about $27 next year for the average household. Those additional monies would be tied directly to infrastructure, parks and public spaces and community safety. I'm also proud of the crime-reduction platform we've announced. Winnipeg has gone six years without a comprehensive crime plan, and that needs to change. We need more policing, but we also need a mayor who understands the need to invest in the things that cause crime in our community in the first place. 

** Is there anything in particular you would like to change in our city?**

If I had to pick one thing it's this: I believe Winnipeg can and should be a place where people here can go to bed at night knowing that their city is a little bit stronger than the day before. When I think of my 21-year-old son Joe, I know that if he sees his city moving in the right direction and getting stronger day by day, then he'll stay here and enjoy a great quality of life. I want people in this city to know in their hearts that their city is on the right track, whether they're a young family, whether they're a senior citizen who has lived here their entire life, or whether they're new to our community. As Mayor, it will be my job to show Winnipeggers that we're on track and headed in the right direction, and it's a responsibility I take seriously. 

** Do you have any other comments regarding your candidacy?**

I'm just incredibly grateful for the energy and enthusiasm I've seen from every corner of our city during this campaign. I feel very privileged to be a candidate in this election, but ultimately, this is not just about me. It's about people coming together to decide the future of their city, and it's about the belief that we truly can make Winnipeg stronger. I am amazed by the energy out there, whether it's people on our Facebook page sharing their ideas for a better city, or the ideas people have when I meet them on their doorstep. The people of this city know that a stronger city is within reach, and I'm grateful to everyone who casts a ballot in this election and has a stake in Winnipeg's future.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Sam Katz', office_address: '1 – 883 Notre Dame Avenue, Winnipeg MB R3E 0M4 ', phone_number: '774-9898', email: 'info@reelectsam.ca', image: nil, website: 'http://www.reelectsam.ca/', council_site: '', facebook: 'http://www.facebook.com/group.php?gid=138423792856769&ref=search', twitter: 'http://twitter.com/ReElectSam', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: true, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Rav Gill', office_address: '67 Lansdowne Avenue Winnipeg, MB R2W 0G2', phone_number: '333-5061', email: '', image: nil, website: 'http://rav4mayor.com/index.html', council_site: '', facebook: '', twitter: 'http://twitter.com/rav4mayor', youtube: '', linkedin: '')
questionnaire = %Q^** Why did you decide to run in the 2010 Winnipeg election?**

First I would like to thank you for setting up this website and providing a quick reference point for busy Winnipeggers to evaluate and scrutinize the nominated candidates in an unbiased fashion.  I decided to run for mayor to give back to this city through the public sector.  I chose to live in Winnipeg and now I’m choosing to make Winnipeg a better place to live, work, and invest for everyone.  This means making Winnipeg safer, improving traffic and public transportation, and bringing businesses and jobs to Winnipeg.  The first step is to stop our young people and entrepreneurs from leaving Winnipeg because they believe our city doesn’t offer the amenities, culture, and economic opportunities other cities do.  I believe I have the ambition, vision, and ability to get this done working with all council members regardless of where they sit on the political spectrum.

** What experience will you bring to complement your role as mayor?**

I firmly believe this is a people person job first, so I equate experience with how well does the candidate know the people in Winnipeg?  As well, how in touch is the candidate with the needs of all Winnipeggers?  In real estate I’ve been fortunate enough to work with our citizens from all areas, of all income levels, and of all ages.  This has given me an inside perspective on their needs for safe neighbourhoods, affordable housing, traffic, public transportation, and many other issues we are dealing with in this election.  In the private sector I have also owned and operated my own businesses, as well I assisted many other Winnipeggers establish their own small or large business, across every ward in the city.  This has given me an intimate knowledge of their concerns (taxation, zoning, etc.) to bring to city hall.  My other experiences include property development, management, and financing.

** What are the major issues you would like to stand for and why did you choose these issues?**

Reducing crime and making all neighbourhoods safer is the biggest issue.  In particular my focus has been on cracking down on gang activity.  I chose this issue because having an area where criminals feel free to conduct their activity while residents don’t feel comfortable enjoying their neighbourhood is a standard of living I find unacceptable.  In the private sector I was able to convert many gang houses into affordable housing for working Peggers, making a significant impact for the entire block.  As mayor I’d like to continue this work with a dedicated police gang unit and a Crime Free Housing program, both which have proven effective in reducing crime attributed to gang activity.  I am also focusing on traffic, infrastructure, and a long term rapid transit system.  Some of our city’s biggest priorities need to include completing the inner ring road to divert traffic from downtown, and developing a light rail transit system.  My other focus is developing our downtown into a true urban neighbourhood that people of all incomes can live, work, and play in.  I have the experience of moving people and businesses downtown and would like to continue this work as mayor.

** Is there anything in particular you would like to change in our city?**

It’s unfortunate some people in our city have a defeatist attitude and don’t embrace our city with the same pride like the other half of our citizens I’ve met during the campaign.  This is evident in our low voter turnout of 38% in 2006.  It’s not that they don’t love our city, it’s because they don’t see our city providing all the amenities other cities have and don’t believe any mayor can bring about the visionary change they desire.  I choose to live in Winnipeg and I’m proud of it.  This is something I can change with strong leadership that never settles for second best or doing something on the cheap.  

** Do you have any other comments regarding your candidacy?**

It’s up the voters to decide who they trust with their tax dollars and who they want to be their mayor for the next 4 years.  Now more than ever each voter can easily research what each candidate is offering, and decide if that candidate can get it done.  The mayor only gets one vote at council but is still in position to make some real changes to our city.  I’ll also say I have enjoyed meeting so many people, especially people who never felt represented at city hall before or never voted before because they didn’t support any of the candidates.  I’m proudly running my campaign as an independent and don’t believe partisan politics have a place in the mayor’s office.  I find most Winnipeggers want someone working for them, and not a political party when making decisions.  Lastly, get out there and vote people^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Brad Gross', office_address: '', phone_number: '803-1811', email: '', image: nil, website: 'http://bradgrossformayor.com/', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2010 Winnipeg election?**

I feel Sam is not serving Winnipeg tax payers properly.

**What experience will you bring to complement your role as mayor?**

Business owner and running the city like a business.

**What are the major issues you would like to stand for and why did you choose these issues?**

Traffic lights to many, solar lights and increasing the light for street lamps, red light cameras are gone if I am mayor, (the money goes to Texas millions gets sent out of the community). Lowering taxes for seniors, small business owners would get 15 per cent off for each full time position they create and the deduction would come off the Winnipeg Personal property tax. Vacant schools will be used to home the homeless. I will expropriate the Winnipeg Park-ade back which was clear title and generating over 2 million dollars in revenue and not sold through the tendering process, I will build a parkade in the Osborne area.

**Is there anything in particular you would like to change in our city?**

Get traffic moving quicker, and Red light cameras gone, not selling city assets, tighter spending.

**Do you have any other comments regarding your candidacy?**

We pay 17 taxes in this city not including income tax, I feel we should be able to balance the budget and create revenue for the city^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
ward = Region.create!(name: 'St. Vital By-Election', start_date: nil, end_date: nil, region_type: council_ward, parent_region: nil, seats: 1)
electoral_race = ElectoralRace.create!(region: ward, election: wpg_2010, polygon: '', seats_to_fill: 1)
person = Person.create!(name: 'Harry Wolbert', office_address: '', phone_number: '294-6062', email: 'hwolbert@shaw.ca', image: nil, website: 'http://www.harrywolbertforcitycouncil.blogspot.com', council_site: '', facebook: 'http://www.facebook.com/harry.wolbert', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^### Questionnaire Response from the October 2010 General Election

*Harry Wolbert also ran in the 2010 Winnipeg election in this ward. The following is his October 2010 response to our general election questionnaire.*

**1. Why did you decide to run in the 2010 Winnipeg election?**

I have decided to run because I did not like the direction in which the current mayor and council have been taking our city. Winnipeg has once again (for the third year in a row) been designated as the Violent Crime Capital of Canada. This is unacceptable! Our City’s current approach to this and other issues just aren’t working. The current mayor and City Council have said that the poor are not their responsibility. I disagree. Our city does have a role to play in poverty reduction. The time has come for some new faces on city council with some fresh, new ideas.

**2. What experience will you bring to complement your role as councillor?**

I am a recognized leader in my community. I will bring the same passion, commitment and leadership skills to City Council that I make use of in my daily work as an advocate for the poor and persons with disabilities.

**3. What are the major issues you would like to stand for and why did you choose these issues?**

There are three issues. We need to start getting tough on crime while at the same time dealing with some of its “root causes” such as poverty, homelessness and gangs. Crime is not a Conservative or Liberal issue. Rather, crime is an issue that affects us all! In the late 1990’s my wife Valerie was the victim of a violent crime. Gang members had murdered her first husband in our city’s core area. We also need to do some about our city’s crumbling infrastructure. If there’s money for a helicopter and football stadium, then there should be the resources to maintain our roads, bridges and community centres. The final issue that I hope to champion is accountability in government. Our City Council needs to be more open, honest and transparent. If I’m elected, there will be no more secret, back-room deals.

**4. Is there anything in particular you would like to change in our city? In your ward?**

I would change the way that I as a politician communicate with the citizens of the St. Vital Ward. If elected, I would hold between 3 – 4 townhall meetings each year in order to connect with the residents of St.Vital and to discuss the issues that are of interest and concern to them. They would not just be hearing from their local politician at election time. I believe that politicians are to be servants of the people.

**5. Do you have any other comments regarding your candidacy?**

It is time for a new “vision” for the City of Winnipeg. My vision for the City is one, which includes all of its citizens (rich and poor, newcomers, Aboriginals, persons with disabilities, university students, seniors, etc.) I would like to propose that Winnipeg City Council adopt the following goal: In 10 years, Winnipeg will become the most inclusive and accessible city in all of Canada. Adopting that goal would bring out the best in all Winnipeggers. This City could be a leader and a role model for Canada and for the rest of the World^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Greg Nordman', office_address: '', phone_number: '930-5301', email: 'gregnordman@gmail.com', image: nil, website: 'http://www.gregnordman.ca', council_site: '', facebook: 'http://www.facebook.com/groups/258932427483998/', twitter: 'http://twitter.com/GregNordman', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

St. Vital Ward is home to almost 60 000 people.  For too long, persons
running for councillor have operated under the belief that the job of
representing this community involves showing up for a couple of
meetings a week and afterwards focus on the running of their private
business.  A good councillor is one who realizes that mere attendance
at meetings is only the tip of the proverbial job iceberg.  A good
councillor is one who knows that they have to be personally available
to the public to listen to their concerns and voice them within
committees, meetings and in council.  A good councillor is one who
dedicates their full attention to what is going on both within city
hall and within the communities they represent.  Greg would argue that
the number of people the councillor for St. Vital will represent,
along with the complexity of being a councillor in Winnipeg today,
means the public needs to have someone who will dedicate their time to
them first and always over anything else.


**What experience will you bring to compliment your role as Councillor?**

Greg has worked for many years in the Hospitality Industry including
managing several restaurants in Winnipeg & Toronto.  Greg’s constant
attention to efficiency and cost controls, balanced against customer
service and quality, has ensured each and every one of these
restaurants were a successful endeavor during his tenure as their
manager. For the past 12 years he has held the position of Sales and
Service Representative with a large coffee and vending company.

Sports are a big part of Greg’s life.  Since the mid 90’s, Greg has
been a very active member in the amateur sporting community in the St.
Vital area of Winnipeg, especially through his development of the
Bonivital Soccer Club.  In the course of his community involvement,
Greg Nordman has received six volunteer of the year awards from four
different community associations.

Greg has also been involved in both the improvement of existing, and
development of new, sports infrastructure in Winnipeg. This includes
the construction of the new indoor soccer facility at the University
of Manitoba and the Memorial Park Soccer complex in St. Vital.

Greg’s broad background makes him an excellent candidate to represent
and service the citizens of St. Vital Ward as their full-time city
councillor.


**What are the major issues you would like to stand for and why did you choose these issues?**

A SAFE ST. VITAL

* Will support results focused policing
* Create Community Forums on Crime Prevention
* Establish the St. Vital Youth Advisory Committee

FAST TRACK ST. MARY’S

* Extra lane to speed up  your rush hour commute
* Pave gravel back lanes on an expedited basis
* Continue with traffic light  synchronization

ACTIVE LIVING & COMMUNITY PROGRAMS

* Increase active living programs for older adults
* Maintain & expand recreation programs & facilities for persons of all ages
* Quarterly meetings at seniors residences

A GREEN ST. VITAL

* Support introduction of composting & organic collection
* Develop plans for bike paths separated from roadways
* Support Rapid Transit

YOUR FULL TIME CITY COUNCILLOR

* Greg will dedicate his full attention to his duties at City Hall.
He will not run a business or maintain a professional practice while
he is your councillor.


**Is there anything in particular you would like to change in our city? In your ward?**

a) in your ward?
With only two major river crossings to the inner city, Greg would like
to improve the flow of traffic, particularly at rush hours, on St.
Mary’s Road north of St. Anne’s.

b) in the city?
Greg believes that any new sporting facilities built in Winnipeg need
to be designed to support multi-use, and multi-age, activities.  This
will get the maximum use out of these facilities at a reduced cost as
compared to utilizing multiple single purpose sites.  Having better
multi-use facilities will also help, indirectly, reduce youth crime by
providing a centre for sporting activities for youth.


**Do you have any other comments regarding your candidacy?**


Greg will dedicate his full attention to his duties at City Hall.  He
will not run a business or maintain a professional practice while he
is your councillor.  Greg will be your full-time city councillor.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Terry Wachniak', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Mike Ducharme', office_address: '', phone_number: '', email: 'voteducharme@gmail.com', image: nil, website: 'http://www.voteducharme.blogspot.com', council_site: '', facebook: '', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

I have been present and serving St. Vital residents in public service, community organizations and business for over 27 years.  My family has served St. Vital as well, including my father Gerry, Uncle Albert and Grandfather Louis.  I was raised in St. Vital and attended Windsor School & Glenlawn Collegiate.  We know the community of St. Vital very well and the people of St. Vital even better.

This election provided the opportunity to serve in a more prominent role and do more for St. Vital by bringing strong experienced representation to City Hall.   I and my family before felt that we should always give back to the community.

**What experience will you bring to compliment your role as Councillor?**

I have tremendous experience serving the community beginning with 29 years at Ducharme Agencies Ltd. Nine years as a trustee of the Louis Riel School Board and was Board Chair in 2005-2006.  On your school board I was also vice chair, chair of finance, and chair of negotiations.  I served on the LRSD Policy, Building Maintenance & Transportation, Education, and Lunch Program Review committees. 

Right out of juniors at the St. Vital Curling Club I began coaching and coached in four provincial junior championships.  I served on the club executive and was President in 1999-2000.  I started with St. Boniface/St. Vital Rotary in 1993. I have worked on charitable events for St. Amant Centre and began working with Jocelyn House Inc. from the time they opened their doors in 1984.  In the late 1990’s I developed the Live Out Loud wall climb for Jocelyn House.  

This exciting event brought together diverse groups such as Vertical Adventures, the Alpine Club of Canada and Mountain Equipment Co-op at St. Vital Centre to raise over $50,000 for a very worthwhile local organization.

**What are the major issues you would like to stand for and why did you choose these issues?**

After four elections in 13 months St. Vital is looking for an experienced voice to engage the public after losing a long term councillor.  St. Vital is Winnipeg’s largest ward with issues as diverse as this incredible community. 

During my campaign at the doors the public has raised concerns around our community centres & public green spaces, public safety, local improvements & infrastructure, and traffic & transportation.  

**Is there anything in particular you would like to change in our city? In your ward?**

With the size of St. Vital, it will take a candidate with deep roots and knowledge of the community to tackle the many diverse issues that St. Vital presents.  I understand the concerns of residents of Elm Park having grown up on Kingston Crescent and am committed to preserving the Canoe Club green space.

I have heard the concerns of the Dakota community.  St. Vital is Winnipeg’s largest ward and must have a local police presence.  The recent closure of the Dakota Community Police office is short sighted and I will work hard with the community to restore this service to St. Vital.

Traffic and infrastructure are long term issues that require hard work, an understanding of public finance and long term thinking to resolve.  I commit to meeting with the community to review the existing strategic plan, listen to what you have to say and advance proposals that make sense for St. Vital.

**Do you have any other comments regarding your candidacy?**

I have worked hard to ensure that St. Vital is served by Winnipeg’s leading school division.  I have worked hard to ensure that Ducharme Agencies Ltd. offers the best service and value to residents.  I have worked hard to ensure that we are all served by strong vibrant community organizations that place the needs of St. Vital first.

With your kind support I hope to bring this record of service to City Hall as your new councillor on November 26. 

For more information about my campaign and background go to my website at: www.voteducharme.blogspot.com^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Hammad Khan', office_address: '', phone_number: '272-3270', email: 'votekhan2011@gmail.com', image: nil, website: 'http://votekhan2011.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Hammad-Khan-for-St-Vital/256825241034619', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

I have always believed that we deserve the strongest representation possible, standing up for the real issues facing our families. Our neighbourhoods deserve to be green, safe, healthy and strong. With the problems we face on our major arteries, green spaces, back lanes, in our community police stations and community centers, I felt as though I had the opportunity to make a real difference. If I am elected St. Vital’s next City Councilor, I will put the needs of our neighbourhoods first, and ensure St. Vital is a great place to raise our families. 

**What experience will you bring to compliment your role as Councillor?**

I have a wealth of experience in the private sector, currently I’m the owner of H.K. Enterprises LTD, an international consulting firm based in Winnipeg specializing in e-commerce. I’ve also been a manager at Convergys, and a fundraiser for Canadian Diabetes as well as the United Way. I’ve also been part of the public sector as an operations manager for Statistics Canada. 

**What are the major issues you would like to stand for and why did you choose these issues?**

My three major issues are safety, infrastructure and community centres. 

1. I want to protect our community safety police stations. They are overworked, understaffed and constantly under the threat of closure, which I will make sure doesn’t happen. They are the first and most important contact when there are security issues in the community. They help to create alliances between St. Vital residents and the police force, and just their presence is enough to make citizens feel more secure in their surroundings. 
2. Our infrastructure defines how we get around and as a city councillor I would work to make sure our roads stay in a good state and I will lead the process of paving back lanes.  People must also be able to move around within St. Vital efficiently. I will push to have Phase II of rapid transit include St. Vital. Synchronizing traffic lights and getting construction crews to work around the clock to finish repairs will help get people to work on time and home quickly. 

**Is there anything in particular you would like to change in our city? In your ward?**

St. Vital is a great place to live but there are some changes I would to see. First, our community has for far been forced to deal with unacceptable infrastructure in the form of unpaved back lanes, run down streets and backed up traffic. I believe I am the best candidate to address these serious problems. It is also important that people living in our ward feel safe. We CAN’T have our community police stations closed. They serve an important function and I will fight to make sure they stay open. I want our ward to have the finest schools, the best programs and the safest neighbourhoods. St. Vital ought to be the example other wards want to follow. If we succeed in making our area stronger, then Winnipeg as a whole will prosper.

**Do you have any other comments regarding your candidacy?**

I am asking the people of St. Vital to vote for a strong voice for themselves and their families. We need a strong voice for the true issues facing our community, building better more sustainable roads, paving our back lanes, improving our transit, keeping our community police stations working efficiently, supporting our community centres and growing our green spaces. St. Vital is the best community to live in, and I believe I can give it the strongest voice possible. I hope that on November 26th you vote for a strong voice for a strong community. I ask you to vote for me, Hammad Khan, to be the next City Councilor in St. Vital.^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Brian Mayes', office_address: '', phone_number: '231-3660', email: 'info@mayes2011.com', image: nil, website: 'http://www.mayes2011.com', council_site: '', facebook: 'http://www.facebook.com/pages/Brian-Mayes-for-St-Vital-City-Council/114714158637900', twitter: 'http://twitter.com/mayes4council', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

I have always been interested in municipal politics.  I like the idea of making a difference at the grassroots level as opposed to a top-down approach.  I have chosen to pursue politics because I believe in the power of democracy. I believe I have the experience, education, and passion for the job.  I grew up in St. Vital and I am now raising my family in St. Vital.  It's a wonderful community with vibrant businesses and culture, and yet it is also rich with park land, cross-country ski trails, tobogganing runs, picnicking areas, and other green spaces from the Seine River to St. Vital Park and beyond.  I'd like to play a part in preserving these aspects for the future of our children.  People knew me as a hard-working, fiscally responsible, and innovative school trustee. But I was also sensitive to budgetary concerns and keeping costs down. If elected as city councillor, St. Vital constituents can expect the same work ethic they have seen from me as I have canvassed door-to-door.  Constituents can also expect that I will use my passion for city politics to make St. Vital an even better place to live.

**What experience will you bring to compliment your role as Councillor?**

I have a bachelors degree in Public Administration, a Masters Degree in Industrial Relations, and a law degree.  I also have elected experience as a school trustee in Brandon.  I have worked as a civil servant and for over a decade as a lawyer.  I have owned my own business and I know something about the challenges small business owners face. I also have extensive experience as a director managing the large provincial budgets of the Deposit Guarantee Corporation of Manitoba and Workers Compensation Board of Manitoba. Given my broad-based expertise, education, and experience, and the fact that I am a resident in the ward, I am able to understand issues from a number of different perspectives. 
As a school trustee I stood for a number of things.  I was in favour of getting junk food out of schools.  I also helped introduce educational pamphlets about cultural diversity.  I got funding to increase speech language pathology services.  As budget chair, a role which I relished, I was known as a fair and fiscally responsible leader.  I'll use my expertise and experience to make constituent voices heard at city hall.


**What are the major issues you would like to stand for and why did you choose these issues?**

1. Infrastructure. Crumbling roads, sidewalks, and back lane winter maintenance all need attention.  We need to reduce St. Vital traffic, too, through a) red light synchronizing, b) lane expansion, and c) the introduction of a super express bus.
2. Crime.  St. Vital is a wonderful community; nevertheless there are some issues that need to be addressed.  Having knocked on tens of thousands of doors in St. Vital, I hear that youth gangs are the main concern. We need to fund police budgets and youth crime prevention programs.
3. Green space.  In St. Vital we have it all. We have diversity, vibrant businesses, libraries, and green space.  I'd like to ensure our spaces, such as the Canoe Club and around the Seine River remain green.
4. Diversity. St. Vital is a cosmopolitan diverse ward and we should celebrate that.  Studies show that diverse welcoming communities are healthy prosperous communities.  If elected, I would strive to promote and support programs that highlight this important aspect of our ward.
5. User fees. I've been going door-to-door since this campaign began. I'm hearing that people don't want user fees.  If elected I would work hard for my constituents to oppose user fees. 

**Is there anything in particular you would like to change in our city? In your ward?**

It's hard to imagine changing anything in a fantastic ward like St. Vital where I grew up, and I have chosen to live and raise my family.  However, we need to address some major infrastructure problems like crumbling roads, back lanes with inadequate snow removal, and certainly rush-hour congestion on Dunkirk and St. Mary's Road.  I've discussed infrastructure and of course crime as two of my major issues.  As a former school trustee, appointed director on large provincial boards, St. Vital business owner, and St. Vital resident, I understand city politics and community needs from different balanced perspectives.  As I have already mentioned, we need to increase the funding of police and crime prevention programs. The other thing we need to examine is the funding of our community centres.  Community centres are the lifeblood of our youth.  We need to invest in them and provide more opportunities for youth to get active in recreational programs, and involved in charitable community projects.  St. Vital constituents can expect me to work hard for them.  I will also be attentive to improving the quality of life of families, seniors, and all people in this ward and in the city more broadly.

**Do you have any other comments regarding your candidacy?**

I've mentioned repeatedly that I work hard.  I am not running for City Council because I want to supplement my income.  I have the experience, education, and expertise to do the job. I have been working full-time on this campaign for the last eight weeks.  If elected I would be your full-time city councillor.  Constituents can expect the same work that they have seen from me during this campaign.  I have knocked on tens of thousands of doors and I have spoken with many people more than once.  It's been fun to reconnect with former teachers, classmates, and even babysitters, who still live in the ward.  And despite the rain and the snow, this has been a thoroughly rewarding and exciting process.  I enjoy meeting people, hearing their concerns, and in a small way contributing to the community that I love.  I hope on Saturday, November 26, you will consider voting for Brian Mayes, the fifth name on the ballot.  I will work hard for my constituents, I will budget responsibly, I will listen, and I will be engaged because I live in St. Vital and I love this ward^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Steven Hennessey', office_address: '', phone_number: '219-5334', email: 'steven@votehennessey.ca', image: nil, website: 'http://www.votehennessey.ca', council_site: '', facebook: 'http://www.facebook.com/pages/Steven-Hennessey/112590002172364', twitter: 'http://twitter.com/stevenhennessey', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

There are a number of reasons I am running in this election. We have seen a movement away from community engagement and citizen involvement. While decisions are being made downtown, citizens are being left out. I want to change that and believe that I would be the best voice for St.Vital because I want to see the future of the City of Winnipeg driven by our citizens’ needs, and not by the few. 

We are also a vibrant, growing community and need to remain inclusive. With our diverse and multi-cultural community, we must remain an accessible and supportive to help our city grow. I have yet to see the city adequately support these needs. Our future relies on our ability to meet these demands and I know I can help address these needs. 

I am also running because our safety concerns have become paramount in the past five years. We have seen the police as the only fix to our growth in crime. I believe we need to take a multi-governmental and community approach to in order to help the police be more effective in controlling our crime rate. I want our streets and neighborhoods safer for everyone. 

**What experience will you bring to compliment your role as Councillor?**

As an avid volunteer on committees and boards, and as a student advocate in university, I bring a wealth of community service experience. Politics and volunteerism are in my family and I have a history of advocacy and work experience that provide me with a firm basis to serve the community as a whole. 

I also have worked in the Health, Post-Secondary, Social Services and Government fields and understand the importance of working with different groups, organizations and people. We will need to work closer with other levels of government in order to solve our infrastructure deficit. The role of partnerships and collaborations will be vital to our growth of our communities and neighborhoods. 

As a single dad of two daughters, I know the importance of family and raising our children in a safe and vibrant city. I have a working knowledge of the safety and security field and understand what we require to make our city safe. I have also worked with youth and know how important recreation and educational programs are to the empowerment and rearing of our kids. 


**What are the major issues you would like to stand for and why did you choose these issues?**

We need to increase our recreation and arts programs for our youth. We cannot continue to create inaccessible and limited opportunities for our youth in Winnipeg. This will ultimately help with some of our crime and safety issues in the city. More importantly, to engage our future is to engage our youth. We must do what we can to assure a strong foundation for our children as we move into the future.

I want to move forward our Rapid Transit System and create a city with corridors of transit that move people from their homes to all areas of the city. To effectively reduce our traffic congestion, we need alternate forms of travel. We cannot rely solely on vehicles to transport us to work and across the city. A viable, long-term vision of transit upgrades and alternatives will help our city move in the right direction.

Our crime and safety concerns cannot be solved by the City of Winnipeg alone. We need a forum on safety that involves all levels of government, non-profit organizations, business, cultural and spiritual groups, youth, seniors and families. We can no longer sit by and allow our community to be driven by fear and complacency. 


**Is there anything in particular you would like to change in our city? In your ward?**

I would like to revise our transit system so that we can better meet the needs of our constituents. With a renewed transit schedule, we can continue to move people to their destinations in a timely and efficient fashion. Neighborhood and community forums on transit will help address this issue. 

Our community police centers need to remain open and accessible. We should move towards maintaining and re-opening our centres with a focus on community involvement and input. Allowing more police officers to go into our schools and neighborhoods will benefit everyone. This will also help move our Citizens Action Network forward with an emphasis on community awareness and engagement. 

I would like to see a better working relationship with the province and federal governments so we can address the needs of our citizens. A forum with the all levels of government will help City of Winnipeg come up with long-term sustainable funding to address our infrastructure needs.

An emphasis on advisory councils for youth and seniors in St.Vital will help the City of Winnipeg directly meet the needs of the constituents. This should be a city-wide initiative attached to community centres or external organizations. 


**Do you have any other comments regarding your candidacy?**


I believe I am the strongest candidate in this race for several reasons. I live in St.Vital. There are four candidates who do not. It is important we have local and continued representation. We need someone who understands the ward from a citizen's perspective. 

I do not have business or political interests helping me. I believe in working for the community as a whole, and want to represent everyone, regardless of their politics. As a non card carrying member of any political party and a non-business person, I can represent the broadest of community interests.

I am also a new, fresh face and voice and not one that has already been driven by political or business interests. We need someone who can go in and work at our issues without other business or private practices lingering in the background. 

This election is not about personal opportunity or gain. This election is about a passion to work for the community as a citizen. We require someone who can objectively make decisions at City Hall while balancing the needs of the constituents. I will be your real voice for St.Vital and Winnipeg. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Beverley Watson', office_address: '', phone_number: '451-1106', email: 'info@beverleywatson.com', image: nil, website: 'http://www.beverleywatson.com', council_site: '', facebook: 'http://www.facebook.com/BeverleyWatsonforCityCouncil', twitter: '', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

I am passionate about this city.  We moved here from Northern Manitoba over 25 years ago to seek out the opportunities that a larger city could offer.  And we found them.  I have been very active in the community for many years, and simply want to do more to make this city greater than ever.   
When the position of City Councillor for St. Vital became available, I knew my name had to appear on that ballot.  
My registration papers were turned in to City Hall on October 18th, Person’s Day; 82 years to the day that women were finally declared as “persons” and could exercise their right to vote and to run for elected office.  I was also born in 1960, the year that Aboriginal people were recognized as persons and realized the same rights.  Running in this election is significant to me on many levels.  I can, and will, make a positive contribution to this ward and to my city.

**What experience will you bring to compliment your role as Councillor?**

I am a business owner, a former broadcaster, and a community volunteer.  I excelled in management studies at the University of Manitoba.  I am skilled in managing budgets; have a knack for marketing; and am a dynamic public speaker.  
My community involvement is extensive.  Currently, I am the Chair of the Board for the Women’s Enterprise Centre, a board member with the Downtown Biz and Uniquely Manitoba.  Recent board positions have also included Vice-Chair of the Board of Governors at Red River College and President of the Aboriginal Chamber of Commerce.  I have also served on the boards of Big Brothers/Big Sisters, Habitat for Humanity, the Manitoba School Improvement Program, and Economic Development Winnipeg.

I have cycled thousands of miles to raise money for Habitat for Humanity Cycle of Hope, and completed a full marathon to raise money for Manitobans with intellectual disabilities.  

I am energetic, tenacious, vocal and articulate.  I am ready, willing and able to represent St. Vital at City Hall.


**What are the major issues you would like to stand for and why did you choose these issues?**

SAFETY:  The one and only police station in St. Vital is slated to be shut down next spring.  St. Vital needs a voice at City Hall and needs to take immediate action to reverse the decision.  Police presence is essential for all communities.  In addition, we need to expand the Downtown Watch concept to various locations in St. Vital.  Having police and watch patrols in our neighbourhoods will deter vandals.  

TRAFFIC CONGESTION:  We need to schedule roadwork more efficiently, and NOT on two of the limited northbound routes at the same time.  We need to review limiting left turns and parking at peak hours.  Plus, we must consider REDUCING the number of cars on the road by encouraging cycling (when appropriate), carpooling, and bus use.  Currently, transit schedules and routes are simply not sufficient and must be revamped immediately.  

COMMUNITY INVOLVEMENT:  We must ensure that the members of the community are heard and are engaged.  I would:

1. Set up regularly scheduled town hall meetings to encourage input
2. Establish a Seniors Advisory Council
3. Establish a Youth Advisory Council to engage young people
4. Schedule regular neighbourhood walks and gatherings throughout the full term, not just at election time.


**Is there anything in particular you would like to change in our city? In your ward?**

First, we need to address safety and crime issues.  People need to feel safe where they live, where they work, and where they play.  We need to tackle panhandling.  We need a stronger, more visible police presence, and we need to enhance the downtown patrol programs.  And we need to involve more groups to take action help eradicate such horrible living conditions for our poorest residents.
  
As for crime, the federal crime bill has been criticized as too harsh.  The local police chief’s plan has been criticized for being too weak.  We don’t like the status quo, yet alternative solutions are not being presented.   

Secondly, we need to improve our transportation systems.  Rapid transit has been discussed for years now, and suddenly there is a realization that it needs to be funded.  And so now we’re trying to do that 25 cents at a time.  We need a better transit system period, and we need it now. 

Finally, we need to maintain and protect our green space.  A recommendation has been tabled to sell off some of the city’s golf courses to residential or commercial developers.  We need a better plan than to pave paradise.


**Do you have any other comments regarding your candidacy?**

About my family…
I grew up in Thompson; daughter of a miner, and 2nd oldest of 9 children (my mother is a saint). I married my high school sweetheart Rick and moved to Winnipeg over 25 years ago.  We had a home in Garden City where our boys grew up, then a condo in Downtown Winnipeg before choosing St. Vital as our new home 3 years ago.  I have been married to Rick for 32 years.  Our two sons Steven and Michael are both chefs right here in Winnipeg.  Steven and his wife Melanie are proud parents of Owen, my 1 year old grandson. ^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Marty Green', office_address: '', phone_number: '', email: '', image: nil, website: 'http://www.onforeignsoil.com/better_bus_system/', council_site: '', facebook: '', twitter: '', youtube: 'http://www.youtube.com/watch?v=3GDfEjVlZLs', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

I’m running for City Council for one reason only: to fix the bus system.  I have a plan to fix the bus system without spending 2 billion dollars. The City says my plan won’t work because it doesn’t take into account the needs of the elderly and the handicapped. I don’t want to sound like the Grinch Who Stole Christmas, but if you design a system to cater to the needs of the elderly and the handicapped, then that’s who’s going to ride your busses. If you want to attract the ridership of busy people who need to get from A to B in a hurry, then you’ve got to design your system for their needs. It means a little more walking and a lot less waiting. I’ve calculated the timing and laid out all the routes on my website where you can check it out at http://www.onforeignsoil.com/better_bus_system/
You can also see me advocating for my bus plan on YouTube at http://www.youtube.com/watch?v=3GDfEjVlZLs


**Do you have any other comments regarding your candidacy?**

Other than my plan to fix the bus system, I am most interested in finding areas where the existing system of regulations and bylaws creates a disincentive for people to do the right thing. I have a vague suspicion that the lack of affordable housing would be corrected by the free market if not for the adverse affect of certain regulations. And I don't think people should pay more property taxes because they improve their homes. And although I am concerned with crime in Winnipeg, I strongly oppose the omnibus crime bill. I believe all the "get-tough" rhetoric is merely playing to the peanut gallery, and the only ones to suffer would be small-time offenders who didn't have the savvy to play the system.
^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
person = Person.create!(name: 'Carl Osato', office_address: '', phone_number: '', email: '', image: nil, website: '', council_site: '', facebook: '', twitter: 'http://twitter.com/osatopm', youtube: '', linkedin: '')
questionnaire = %Q^**Why did you decide to run in the 2011 Winnipeg by-election?**

Living in St. Vital and having managed at SilverCity St. Vital for 9 years I felt that this is a great time to try and make a difference.  I believe that we can do better as a council and move the city forward.  I would like to say that I will be a councillor that will be available.  I know that there is a disconnect with city council and the residents.  This is evident by the immense amount of voter apathy, and let’s not blames the voter in this; the politicians are the ones who need to work harder to connect with the community.  I held an Open House during my campaign to offer a chance for residents to come down and meet me and my team along with some local charities and businesses. As your councillor I will do more of these. I have always brought a positive fresh look at anything I take on and doing it on a bigger scale would be extremely exciting.  Even more important to me is getting a chance to make a difference and that would be a fantastic honour and responsibility that I am very much looking forward to.  

**What experience will you bring to compliment your role as Councillor?**

Back in 2006 when I ran in Old Kildonan, I ran because I thought I could make a change.  Running against an incumbent, I was trounced but learned a lot about the process.  I knew that my chances of winning were slim but the experience would be well worth the effort.  Being a very successful manager at Cineplex Entertainment gives me an immense amount of experience in talking and dealing with the public.  It also teaches you to manage the numbers.  Both are needed and are key to having a good councillor. When I was in RRC, I managed CMOR, the campus radio station to one of its best years ever.  Being a Business Admin student doing a position designed for CreCom students, this was an achievement that I will always speak proudly of.  I have also started my own Real Estate Business, Osato Property Management that in its initial stages has been very remarkable.  I have been very successful in everything I have done and have done it with a great passion for keeping it positive.  This experience will bring a fresh new look into council.


**What are the major issues you would like to stand for and why did you choose these issues?**

* Safety - Creating more efficiency within our Fire, Paramedic and Police Services
* Health - Everything from food to bike paths to eco-friendly options in our city
* Community - Creation of the Community Awareness Network (C.A.N.) 

I will work with residents of St. Vital to create the Community Awareness Network.  CAN will be a community run organization that will be designed to work on Health and Safety issues within St. Vital.  Being proactive with our residents is important in how we go about fighting Crime.  Together we can work on the issues within St. Vital and drive our area forward in regard to all three issues.  CAN would also keep the residents of St. Vital involved in the issues that are being discussed at City Hall.  

**Is there anything in particular you would like to change in our city? In your ward?**

I really would like to see more of a connection with the residents and the City Council.  I can tell you that there is a BIG disconnect with the majority of residents and this needs to change.  I would promise to have a permanent office within St. Vital.  I promise to do monthly newsletters for residents to find out what is going on in the ward.  I will also push to work on getting better transit and road work within St. Vital.  The focus on that infrastructure would also include working on our unpaved back lanes within the ward.  As a city, we need to move forward with our transportation plans, ensuring we are planning properly and using our space efficiently and effectively.  This will also include improving our transit system and moving forward with Rapid Transit.  I would like to make City Hall more transparent, ensuring that the people of Winnipeg know what is going on with their tax dollars.  

**Do you have any other comments regarding your candidacy?**

I do not belong to any political party and I believe that party politics should stay out of council.  Being involved with a party and having their supporters, you might be inclined to vote a certain way based of party policy.  This should not play a role in decision making; you should judge each decision on its own merit and weigh the options based off of what is best for your ward and the city, not what your party objectives.  We deal with two levels of government and using the same supporters and assets could lead to leaning a certain way on issues.  I appreciate everyone who has put their hat in the ring for this seat, but unless you have firsthand knowledge and actually live in the ward, then you should not be in charge of running it at City Hall.  Last but not least, we need to keep things positive, we need to work together to move forward.  We need to change from going to “Not Bad”, two negative words, to “Pretty Good”, two positive words.  This is what I bring to the race^
candidacy = Candidacy.create!(questionnaire: questionnaire, end_date: nil, is_incumbent: false, is_winner: false, person: person, electoral_race: electoral_race)
