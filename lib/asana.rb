module Asana
  require 'httparty'

  class Task
    include HTTParty

    BASE_URL = 'https://app.asana.com/api/1.0'
    AUTH = {:username => ENV["ASANA_API_KEY"], :password => ""}
    
    def self.create(task_name, task_notes)

      query_params = {
        "assignee" => ENV["ASANA_ASIGNEE"], 
        "assignee_status" => "today",
        "name" => task_name,
        "notes" => task_notes,
        "workspace" => ENV["ASANA_WORKSPACE"], 
        "due_on" => "#{Time.now.strftime '%Y-%m-%d'}",
        "projects" => ENV["ASANA_PROJECT"]
      }

      response = HTTParty.post("#{BASE_URL}/tasks", {:query => query_params, :basic_auth => AUTH})
      
      Rails.logger.fatal "Task couldn't be created in asana. #{response.code} - #{response.message}" unless response.code == 201
    end
  end
end