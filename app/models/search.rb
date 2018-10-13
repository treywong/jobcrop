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
          id: 'js',
          site: 'Jobstreet.my',
          class: 'btn-jobstreet',
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
    adjusted_params = params.gsub!(/\s+/, '+')
    document = open("https://www.glassdoor.com/Job/jobs.htm?suggestCount=0&suggestChosen=false&clickSource=searchBtn&typedKeyword=#{adjusted_params}&sc.keyword=#{adjusted_params}&locT=N&locId=170&jobType=")
    content = document.read
    parsed_doc = Nokogiri::HTML(content)
    jobs = Array.new
    parsed_doc.css('ul.jlGrid.hover').css('li.jl').each do |result|
      array = result.css('div.empLoc').text.split('')
      a = array.index('–')
      company = array.slice!(0..a-1).join('')

      if result.css('img.lazy').present?
        job = {
          id: 'gd',
          site: 'Glassdoor.com',
          class: 'btn-glassdoor',
          title: result.css('a.jobLink').text,
          company: company,
          location: result.css('span.loc').text,
          created_at: result.css('span.minor').text,
          image: result.css('img.lazy').attribute('data-original').value,
          link: "https://glassdoor.com" + result.css('a.jobLink').attribute('href').value
        }
        jobs << job
      end
    end
    return jobs
  end

  def self.parsei(params)
    documents = Array.new
    document = open("https://www.indeed.com.my/jobs?q=" + "#{params}" + "&l=Malaysia&sort=date")
    document_2 = open("https://www.indeed.com.my/jobs?q=" + "#{params}" + "&l=Malaysia&sort=date&start=10")
    document_3 = open("https://www.indeed.com.my/jobs?q=" + "#{params}" + "&l=Malaysia&sort=date&start=20")
    documents += [document, document_2, document_3]

    jobs = Array.new
    documents.each do |document|
      content = document.read
      parsed_doc = Nokogiri::HTML(content)
      parsed_doc.css('td#resultsCol > div.row.result').each do |result|
        job = {
          id: 'i',
          site: 'Indeed.com.my',
          class: 'btn-indeed',
          title: result.css('h2.jobtitle').css('a').text,
          company: result.css('span.company').text,
          location: result.css('div.location').text,
          created_at: result.css('span.date').text,
          image: 'https://pbs.twimg.com/profile_images/539816754722004993/6IS4WIhR_400x400.jpeg',
          link: "https://www.indeed.com.my" + result.css('a.turnstileLink').attribute('href').value
        }
        jobs << job
      end
    end
    return jobs
  end

  def self.parsefj(params)
    adjusted_params = params.gsub!(/\s+/, '-')
    document = open("https://www.fastjobs.my/malaysia-jobs/#{params}-jobs-search")
    content = document.read
    parsed_doc = Nokogiri::HTML(content)
    jobs = Array.new
    parsed_doc.css('div.jobs').css('a.adbox').each do |result|
        array = result.css('div.job-post').css('p.coyinfo').text.split(' ')
        a = array.index('Posted')
        created_at = array.slice(a..-1)
        job = {
          id: 'fj',
          site: 'Fastjob.my',
          class: 'btn-fastjob',
          link: result.attribute('href').value,
          title: result.css('div.job-post').css('h2').first.text,
          company: result.css('div.job-post').css('p.coyinfo > span > strong').first.text,
          location: result.css('div.job-post').css('ul.job-tag').css('li').first.text,
          created_at: created_at.join(' '),
          image: result.css('div.job-post').css('img.img-coylogo').attribute('data-src').value
        }
        if job[:image] == "/img/basic/default-logo-company.png"
          job[:image] = "https://www.fastjobs.my/img/basic/default-logo-company.png"
        end
        jobs << job
    end
    return jobs
  end

  def self.parsejstore(params)
    adjusted_params = params.gsub!(/\s+/, '-')
    document = open("https://www.jobstore.com/my/search-jobs?keyword=#{params}&location=")
    content = document.read
    parsed_doc = Nokogiri::HTML(content)
    jobs = Array.new
    parsed_doc.css('div.search_result_box').css('div.search_job_ranked').each do |result|
      image = result.css('div.search_job_logo > div').attribute('style').value.split(' ')[5]
      if image.include?('background:url')
        parsed_image = image.split('/').slice(2..-1).join('/').chomp(')')
      end
      job = {
        id: 'jstore',
        site: 'Jobstore.com',
        class: 'btn-jobstore',
        link: result.css('a').attribute('href').value,
        title: result.css('h2.search_job_title').text,
        company: result.css('p.search_job_companyname').text,
        location: result.css('div.search_job_location').text,
        created_at: result.css('div.search_job_status').text,
        image: "https://#{parsed_image}"
      }
      jobs << job
    end
    return jobs
  end
end
