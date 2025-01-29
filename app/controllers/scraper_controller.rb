require 'selenium-webdriver'
require 'nokogiri'

class ScraperController < ApplicationController
  def home
    @tracker = Tracker.find(params[:tracker])
    path = Rails.root.join("FOLDER", "#{@tracker.cn}.html")

    if File.exist?(path)
      puts 
      puts " * * * "
      puts "File found. #{@tracker.cn}.html"
      @file = "File found. #{@tracker.cn}.html"
    else
      puts "File #{@tracker.cn} does not exist."
      @file = "File #{@tracker.cn} does not exist."
    end

    @roa = Roa.where(tracker_id: @tracker.id).first     

  end

  def get_roa
    puts "in get_roa method."
    puts 
    puts params.inspect
    puts params[:tracker].inspect 
    @tracker = Tracker.find(params[:tracker])
    puts "Tracker cn: #{@tracker.cn}"
    # 37-2023-00028893-CU-WT-CTL
    @obj = Spider.new(@tracker.cn)
    @obj.launch
  end

  def read_roa
    @tracker = Tracker.find(params[:tracker])

    Dir.chdir(Rails.root.join("FOLDER"))
    file = File.open("#{@tracker.cn}.html").read
    @page = Nokogiri::HTML(file)

  
    puts " + + "
    rows = @page.xpath("//*[@id='events-all']/tbody/tr").count
    count = 1
  
    while rows > count 
      puts count 
      puts @page.xpath("//*[@id='events-all']/tbody/tr[#{count}]/td[1]").text
      if /\d/.match?(@page.xpath("//*[@id='events-all']/tbody/tr[#{count}]/td[1]").text)
        puts "Number found"
        @lroa = @page.xpath("//*[@id='events-all']/tbody/tr[#{count}]/td[1]").text.strip
        break
      else
        puts "No number found."
      end
      count += 1
    end

    # puts /\d/.match?(@check)
  
    #@lroa = @page.xpath("//*[@id='events-all']/tbody/tr[2]/td[1]").text

# //*[@id="events-all"]/tbody/tr[1]/td[1]
  end

  def list_roas
    Dir.chdir(Rails.root.join("FOLDER"))
    puts " = = = = = = "
    puts Dir.glob('*.html')
    puts 
  end
end 


class Spider
  def initialize(cn)
    @cn = cn 
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to "https://odyroa.sdcourt.ca.gov/" # disclaimer page
    puts "Spider model instantiated."
    puts "Current url: #{@driver.current_url}"
    puts "Webpage title: #{@driver.title}"
  end
  def rand_sleep
    puts "started rand_sleep method."
    random_number = rand(1..6)
    puts "selected random number of #{random_number} to sleep for z zz zzz."
    puts "Current url: #{@driver.current_url}"
    puts "Webpage title: #{@driver.title}"
    sleep(random_number)
  end
  def tear_down
    puts "tear down method called."
    @driver.quit
    puts "goodbye."
  end
  def click_btn
    puts 
    puts "in click_btn method."
    puts "check for btn selector"
    xpath_selector = "//html/body/div/main/div[3]/form/a"
    ele = @driver.find_element(:xpath, xpath_selector)
    puts " - - - "
    puts ele.inspect
    ele.click
    puts 
  end
  def enter_cn
    puts "in enter_cn method."
    if @driver.current_url == "https://odyroa.sdcourt.ca.gov/Cases"
      puts "on the correct webpage."
      xpath_to_input = "//*[@id='CaseNumber']"
      ele = @driver.find_element(:xpath, xpath_to_input)
      ele.send_keys @cn # heuberger
      ele.submit
    end
  end
  def save_page
    page_source = @driver.page_source
    Dir.chdir(Rails.root.join("FOLDER"))
    File.open("#{@cn}.html", 'w') do |file|
      file.write(page_source)
      puts "ROA saved to folder."
    end
  end
  def launch
    rand_sleep
    click_btn
    rand_sleep
    enter_cn
    rand_sleep
    save_page
    tear_down
  end
end
