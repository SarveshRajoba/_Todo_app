module TasksHelper
  def priority_class(priority)
    case priority
    when 'High'
      'bg-danger text-white px-2 py-1 rounded'
    when 'Medium'
      'bg-warning text-dark px-2 py-1 rounded'
    when 'Low'
      'bg-success text-white px-2 py-1 rounded'
    else
      'bg-secondary text-white px-2 py-1 rounded'
    end
  end
end
