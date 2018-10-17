module JobhuntersHelper
  def jobhunter?
    current_user.jobhunter.present?
  end
end
