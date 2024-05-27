class HospitalSearchQuery
  def initialize(params)
    @params = params
  end

  def call
    hospitals = Hospital.all
    hospitals = hospitals.where('name LIKE ?', "%#{@params[:search]}%") if @params[:search].present?
    hospitals
  end
end
