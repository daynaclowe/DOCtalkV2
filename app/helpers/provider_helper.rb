module ProviderHelper
   def present_or_rated?(provider)
    if current_user.present?
      current_user.rated?(provider)
    else
      false
    end
  end
end
