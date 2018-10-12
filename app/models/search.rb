class Search < ApplicationRecord
  def self.parsejs(params)
    document = open("http://www.jobstreet.com.my/en/job-search/job-vacancy.php?key=#{params}")
    content = document.read
    parsed_doc = Nokogiri::HTML(content)
    jobs = Array.new
    parsed_doc.css('div.panel-body').each do |result|
      if result.css('a.position-title-link').present? && result.css('img.img-company-logo').present?
        link = result.css('a.position-title-link').attribute('href').value.split('')
        link.delete_at(4)
        job = {
          title: result.css('div.position-title.header-text').css('a.position-title-link').text,
          company: result.css('h3.company-name').css('a.company-name').text,
          location: result.css('li.job-location').text,
          created_at: result.css('span.job-date-text').text,
          image: result.css('img.img-company-logo').attribute('data-original').value,
          link: link.join('')
        }
        if job[:title].present?
          jobs << job
        end
      end
    end
    return jobs
  end

  def self.parsegd(params)
    document = open("https://www.glassdoor.com/Job/jobs.htm?suggestCount=0&suggestChosen=false&clickSource=searchBtn&typedKeyword=#{params}&sc.keyword=#{params}&locT=C&locId=3002296&jobType=")
    content = document.read
    parsed_doc = Nokogiri::HTML(content)
    jobs = Array.new
    parsed_doc.css('ul.jlGrid.hover').css('li.jl').each do |result|
      array = result.css('div.empLoc').text.split('')
      a = array.index('–')
      company = array.slice!(0..a-1).join('')

      if result.css('img.lazy').present?
        job = {
          title: result.css('a.jobLink').text,
          company: company,
          location: result.css('span.loc').text,
          created_at: '',
          image: result.css('img.lazy').attribute('data-original').value,
          link: "https://glassdoor.com" + result.css('a.jobLink').attribute('href').value
        }
        jobs << job
      end
    end
    return jobs
  end
end
