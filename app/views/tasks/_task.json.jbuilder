json.extract! task, :id, :title, :description, :due_date, :completed, :priority, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
