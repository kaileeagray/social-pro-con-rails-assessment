task :procon_onion => :environment do
  require 'nokogiri'
  require 'open-uri'
    ## I picked out a few of the pro/con lists and scraped them.

    all = ["http://www.theonion.com/graphic/pros-and-cons-raising-minimum-wage-50476", "http://www.theonion.com/graphic/pros-and-cons-freelance-employment-51603", "http://www.theonion.com/graphic/pros-and-cons-political-correctness-52003", "http://www.theonion.com/graphic/pros-and-cons-helicopter-parenting-52130", "http://www.theonion.com/graphic/pros-and-cons-attending-college-52701", "http://www.theonion.com/graphic/pros-and-cons-profit-colleges-53065", "http://www.theonion.com/graphic/pros-and-cons-taking-gap-year-52852", "http://www.theonion.com/graphic/pros-and-cons-standardized-testing-50388", "http://www.theonion.com/graphic/the-pros-and-cons-of-open-plan-offices-38377", "http://www.theonion.com/graphic/the-pros-and-cons-of-paying-college-athletes-38321"]

    all.each do |url|
      @url = url
      @doc = Nokogiri::HTML(open(url))
      list = List.new
      user_id = User.find_by(email: "onion@onion.co").id
      list.user_id = user_id
      list.title =  @doc.css(".content-header").text.strip
      list.description = @doc.css(".content-text h4").text
      list.source = @url
      list.save
      @doc.css(".content-text ul").first.css("li").each do |pro|
        pro = Item.create(list_id: list.id, user_id: user_id, description: pro.text, weight: Faker::Number.between(0, 10), pro_con: true)
        pro.save
      end
      @doc.css(".content-text ul")[1].css("li").each do |con|
        con = Item.create(list_id: list.id, user_id: user_id, description: con.text, weight: Faker::Number.between(0, 10), pro_con: false)
        con.save
      end
      list.save
    end

end
