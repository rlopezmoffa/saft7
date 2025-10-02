class Session
  def initialize(current_user)
    @current_user = current_user   
  end

  def get_user_email    
    return @current_user.present? ? @current_user.email : nil     
  end

  def get_administracion_id    
    return 1     
  end
  
end
