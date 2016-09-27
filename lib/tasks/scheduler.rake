desc "scheduler tasks"
task :procon_onion => :environment do
  require 'nokogiri'
  require 'open-uri'
  # Scraper.new.visit_all
end
#
# class Scraper
#     ## I picked out a few of the pro/con lists and scraped them for their content.
#
#     @@all = ["http://www.theonion.com/graphic/pros-and-cons-of-screen-time-for-kids-38445", "http://www.theonion.com/graphic/pros-and-cons-of-going-to-grad-school-38467", "http://www.theonion.com/graphic/pros-and-cons-of-the-greek-system-38515", "http://www.theonion.com/graphic/pros-and-cons-raising-minimum-wage-50476", "http://www.theonion.com/graphic/pros-and-cons-freelance-employment-51603", "http://www.theonion.com/graphic/pros-and-cons-political-correctness-52003", "http://www.theonion.com/graphic/pros-and-cons-helicopter-parenting-52130", "http://www.theonion.com/graphic/pros-and-cons-attending-college-52701", "http://www.theonion.com/graphic/pros-and-cons-profit-colleges-53065", "http://www.theonion.com/graphic/pros-and-cons-taking-gap-year-52852", "http://www.theonion.com/graphic/pros-and-cons-standardized-testing-50388", "http://www.theonion.com/graphic/the-pros-and-cons-of-open-plan-offices-38377", "http://www.theonion.com/graphic/the-pros-and-cons-of-paying-college-athletes-38321"]
#
#
#     def visit_all
#       @@all.each do |url|
#         @url = url
#         self.get_page(url)
#         self.make_list
#       end
#     end
#
#
#     def get_page(url)
#       # The .get_page instance method will be responsible
#       # for using Nokogiri and open-uri to grab the entire HTML document from the web page.
#       @doc = Nokogiri::HTML(open(url))
#     end
#
#
#     def make_list
#       list = List.new
#       list.user_id = User.find_by(username: "the_onion").id
#       list.title =  @doc.css(".content-header").text.strip
#       list.description = @doc.css(".content-text b").first.text
#       list.source = @url
#       list.save
#       @doc.css(".content-text ul").first.css("li").collect do |pro|
#         pro = Pro.create(list_id: list.id, user_id: User.find_by(username: "the_onion").id, description: pro.text, weight: Faker::Number.between(0, 10))
#         pro.save!
#       end
#       @doc.css(".content-text ul")[1].css("li").collect do |con|
#         con = Con.create(list_id: list.id, user_id: User.find_by(username: "the_onion").id, description: con.text, weight: Faker::Number.between(0, 10))
#         con.save!
#       end
#       list.save!
#     end
#
# end
#
# Scraper.new.visit_all
