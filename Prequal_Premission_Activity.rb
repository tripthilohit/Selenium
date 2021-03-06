require "json"
require "selenium-webdriver"
require "rspec"
require "yaml"

include RSpec::Expectations

describe "CreateSurvey" do

  before(:each) do
	@config = YAML.load_file("config_smiley.yml")
    @driver = Selenium::WebDriver.for :firefox
    @base_url = @config['admin']['base_url']
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    #@driver.quit
    @verification_errors.should == []
  end
  
  it "test_create_survey" do
	login()
	create_newmissionhub()
	create_prequalsurvey()
	create_premissionsurvey()
	create_activity()
	missionlogic()
	end
  
	def login()
	@driver.get(@base_url + "/admins/sign_in")
    @driver.find_element(:id, "admin_email").clear
    @driver.find_element(:id, "admin_email").send_keys @config['admin']['email']
	sleep(1)
    @driver.find_element(:id, "admin_password").clear
    @driver.find_element(:id, "admin_password").send_keys @config['admin']['pass']
    @driver.find_element(:name, "commit").click
	@driver.manage.window.maximize
	sleep(2)
	end
	
	def create_newmissionhub()
	@driver.find_element(:link, "Mission Hubs").click
    @driver.find_element(:link, "New Mission Hub").click
    @driver.find_element(:xpath, "//div[@id='new_mission_hub']/div/div/div[2]/div/div/input").clear
    @driver.find_element(:xpath, "//div[@id='new_mission_hub']/div/div/div[2]/div/div/input").send_keys "Prequal+Premission+Activity"
	sleep(2)
	@driver.find_element(:css, "button.btn-default").click
	end
	
	def create_prequalsurvey()
	@driver.find_element(:css, "li.test-hub-new-survey").click
	sleep(4)
	@driver.find_element(:link, "New Survey").click
	sleep(7)
	@driver.find_element(:css, "button.btn-edit").click
    @driver.find_element(:xpath, "//body[@id='admin']/div/div/div/div[2]/div/input").clear
    @driver.find_element(:xpath, "//body[@id='admin']/div/div/div/div[2]/div/input").send_keys "Prequal Survey"
	#Single Answer Question
    @driver.find_element(:css, "span.icon-single_answer").click
	@driver.find_element(:css, "textarea.test-survey-item-field[placeholder='Type a question']").clear
	@driver.find_element(:css, "textarea.test-survey-item-field[placeholder='Type a question']").send_keys "Single Answer Question "
	sleep(1)
	@driver.find_element(:css, "button.q-list-add").click
	sleep(1)
	@driver.find_element(:css, "textarea.test-question-answer-0").clear
	@driver.find_element(:css, "textarea.test-question-answer-0").send_keys "Answer 1"
	sleep(1)
	@driver.action.send_keys(:enter).perform
	@driver.find_element(:css, "textarea.test-question-answer-1").clear
	@driver.find_element(:css, "textarea.test-question-answer-1").send_keys "Answer 2"
	sleep(1)
	@driver.action.send_keys(:enter).perform
	@driver.find_element(:css, "textarea.test-question-answer-2").clear
	@driver.find_element(:css, "textarea.test-question-answer-2").send_keys "Answer 3"
	sleep(1)
	@driver.find_element(:css, "button.test-question-create").click
	sleep(2)
	
    @driver.find_element(:link, "Prequal Survey").click
	sleep(1)
	
	#@driver.find_element(:css, "a.rowclick.test-hub-structure-item-link.ng-binding").click
	sleep(2)
	
	@driver.find_element(:css, "strong.q-list-type-reward").click

	@driver.find_element(:css, "input.reward-points-field").clear
	@driver.find_element(:css, "input.reward-points-field").send_keys "10"
	sleep(2)
	@driver.find_element(:xpath, "//button[@ng-click='src.update()']").click
	sleep(2)
   @driver.find_element(:css, "strong.q-list-type-badge").click
	sleep(2)
	puts "abc"
	@driver.execute_script('$(\'input.js-badge-image-field[type="file"]\').attr("style", "");');
	sleep(1)
	@driver.find_element(:css, "input.js-badge-image-field[type='file']").send_keys("C:\\Users\\Tripthi\\Pictures\\admin.jpe")
	sleep(3)
	@driver.find_element(:css, "textarea.test-activity-badge-name").clear
	@driver.find_element(:css, "textarea.test-activity-badge-name").send_keys "Prequal Survey Badge name"
	@driver.find_element(:xpath, "//button[@ng-click='save()']").click
	sleep(2)
	
	@driver.find_element(:link, "Prequal+Premission+Activity").click
	sleep(1)
	end
	def create_premissionsurvey()
    @driver.find_element(:css, "li.test-hub-new-survey").click
	sleep(4)
	@driver.find_element(:link, "New Survey").click
	sleep(7)
	@driver.find_element(:css, "button.btn-edit").click
    @driver.find_element(:xpath, "//body[@id='admin']/div/div/div/div[2]/div/input").clear
    @driver.find_element(:xpath, "//body[@id='admin']/div/div/div/div[2]/div/input").send_keys "Premission Survey"
	#Single Answer Question
    @driver.find_element(:css, "span.icon-single_answer").click
	@driver.find_element(:css, "textarea.test-survey-item-field[placeholder='Type a question']").clear
	@driver.find_element(:css, "textarea.test-survey-item-field[placeholder='Type a question']").send_keys "Single Answer Question "
	sleep(1)
	@driver.find_element(:css, "button.q-list-add").click
	sleep(1)
	@driver.find_element(:css, "textarea.test-question-answer-0").clear
	@driver.find_element(:css, "textarea.test-question-answer-0").send_keys "Answer 1"
	sleep(1)
	@driver.action.send_keys(:enter).perform
	@driver.find_element(:css, "textarea.test-question-answer-1").clear
	@driver.find_element(:css, "textarea.test-question-answer-1").send_keys "Answer 2"
	sleep(1)
	@driver.action.send_keys(:enter).perform
	@driver.find_element(:css, "textarea.test-question-answer-2").clear
	@driver.find_element(:css, "textarea.test-question-answer-2").send_keys "Answer 3"
	sleep(1)
	@driver.find_element(:css, "button.test-question-create").click
	sleep(2)
	
    @driver.find_element(:link, "Premission Survey").click
	sleep(1)
	
	#@driver.find_element(:css, "a.rowclick.test-hub-structure-item-link.ng-binding").click
	sleep(2)
	
	@driver.find_element(:css, "strong.q-list-type-reward").click

	
	@driver.find_element(:css, "input.reward-points-field").clear
	@driver.find_element(:css, "input.reward-points-field").send_keys "10"
	sleep(2)
	@driver.find_element(:xpath, "//button[@ng-click='src.update()']").click
	sleep(2)
   @driver.find_element(:css, "strong.q-list-type-badge").click
	sleep(2)
	puts "abc"
	@driver.execute_script('$(\'input.js-badge-image-field[type="file"]\').attr("style", "");');
	sleep(1)
	@driver.find_element(:css, "input.js-badge-image-field[type='file']").send_keys("C:\\Users\\Tripthi\\Pictures\\admin.jpe")
	sleep(3)
	@driver.find_element(:css, "textarea.test-activity-badge-name").clear
	@driver.find_element(:css, "textarea.test-activity-badge-name").send_keys "Premission Survey Badge name"
	@driver.find_element(:xpath, "//button[@ng-click='save()']").click
	sleep(2)
	
	@driver.find_element(:link, "Prequal+Premission+Activity").click
	sleep(2)
	end
	
	def create_activity()
	@driver.find_element(:css, "li.test-hub-new-activity").click
	sleep(3)
	
	@driver.find_element(:link, "New Activity").click
	sleep(7)
    @driver.find_element(:css, "button.btn-edit").click
	sleep(3)
	@driver.find_element(:css, "input.q-field.ng-pristine[placeholder='Type a activity name']").clear
	@driver.find_element(:css, "input.q-field.ng-pristine[placeholder='Type a activity name']").send_keys "Activity PPA"
	
	sleep(4)
    @driver.find_element(:css, "textarea.mission-page-title").clear
	
	sleep(2)

    @driver.find_element(:css, "textarea.mission-page-title").send_keys "Activity PPA"
	sleep(1)
	@driver.find_element(:css, "input.mission-goal").clear
	@driver.find_element(:css, "input.mission-goal").send_keys "10"
	
	#scroll
	sleep(1)
	@driver.execute_script("scroll(0, 250);")
	sleep(4)
	
	#Toggle Facebook
    @driver.find_element(:id, "switch_cb_facebook").click
	sleep(4)
	@driver.find_element(:css, "input.activity-share-url[ng-model='activity.facebook.seed_url']").clear
	@driver.find_element(:css, "input.activity-share-url[ng-model='activity.facebook.seed_url']").send_keys "http://socialmedialink.com/"
	sleep(1)
	@driver.find_element(:css, "textarea.ng-pristine[ng-model='activity.facebook.suggested_phrase']").clear
	@driver.find_element(:css, "textarea.ng-pristine[ng-model='activity.facebook.suggested_phrase']").send_keys "Suggested Phrase"
	sleep(1)
	
	#save
    @driver.find_element(:css, "button.btn.btn-sidebar.btn-primary").click
	sleep(6)
	
	@driver.find_element(:link, "Prequal+Premission+Activity").click
	sleep(1)
	
	end
	
	def missionlogic
    @driver.find_element(:link, "Mission Logic").click
	sleep(1)
	section = @driver.find_elements(:css,"li.mlogic-list-item.test-hub-logic-item-0.test-hub-logic-item-survey")
	section[0].find_element(:css, "a").click
    @driver.find_element(:id, "date-start").click
	@driver.find_element(:xpath, "//td[@class='day active']/preceding-sibling::td[@class='day'][1]").click
	#@driver.find_element(:xpath, "//td[contains(text(), '19') and @class='day']").click
    @driver.find_element(:css, "button.mlogic-add-group").click
	@driver.find_element(:xpath, "//span[text()='All Members']").click
	sleep(1)
	@driver.find_element(:css, "button.test-hub-logic-item-group-save").click
	sleep(2)
	@driver.find_element(:css, "label.switcher.ng-scope").click
	sleep(1)
	@driver.find_element(:xpath,"//div[@class='mlogic-step ng-scope']/strong[3]").click
	@driver.find_element(:xpath,"//div[@class='inline-select ng-pristine ng-valid open']/ul/li[3]").click
	sleep(2)
	
	section1 = @driver.find_elements(:css,"li.mlogic-list-item.test-hub-logic-item-1.test-hub-logic-item-survey")
	section1[0].find_element(:css, "a").click
    @driver.find_element(:id, "date-start").click
	@driver.find_element(:xpath, "//td[@class='day active']/preceding-sibling::td[@class='day'][1]").click
	#@driver.find_element(:xpath, "//td[contains(text(), '19') and @class='day']").click
	@driver.find_element(:css, "label.switcher.ng-scope").click
	sleep(1)
	@driver.find_element(:xpath,"//div[@class='mlogic-step ng-scope']/strong[3]").click
	@driver.find_element(:xpath,"//div[@class='inline-select ng-pristine ng-valid open']/ul/li[4]").click
	sleep(2)
	
	section2 = @driver.find_elements(:css,"li.mlogic-list-item.test-hub-logic-item-2.test-hub-logic-item-activity")
	section2[0].find_element(:css, "a").click
    @driver.find_element(:id, "date-start").click
	@driver.find_element(:xpath, "//td[@class='day active']/preceding-sibling::td[@class='day'][1]").click
	#@driver.find_element(:xpath, "//td[contains(text(), '19') and @class='day']").click
	sleep(1)
	@driver.find_element(:css, "label.control-checkbox-primary[for='send_sample_2']").click
	sleep(1)
	@driver.find_element(:css, "input.ng-pristine[ng-model='rule.distribution_limit']").click
	@driver.find_element(:css, "input.ng-pristine[ng-model='rule.distribution_limit']").send_keys "1"
	sleep(1)
	@driver.find_element(:xpath, "//div[@class='ng-scope']/div/label/span").click
	sleep(1)
	@driver.find_element(:css, "label.switcher.ng-scope").click
	sleep(1)
	
	@driver.find_element(:css, "button.test-hub-logic-save").click
	sleep(2)
	
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
