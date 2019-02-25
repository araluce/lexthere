class CheckExercisingService

  def initialize(user)
    @user = user
  end

  def check
    response = LawyerService.new(@user.name, @user.surname, @user.collegiate_number).perform

    check_status(response)

    response['result']
  end

  private

  def check_status(response)
    raise('KO status') unless  response['status'] == 'OK'
  end

end