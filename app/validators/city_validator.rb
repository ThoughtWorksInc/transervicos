class CityValidator < ActiveModel::Validator
  FAIL_MESSAGE = 'não existe'

  def validate(model)
    model.errors[:city_id] << FAIL_MESSAGE unless City.exists?(model.city_id)
  end
end
