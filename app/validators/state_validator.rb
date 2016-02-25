class StateValidator < ActiveModel::Validator
  FAIL_MESSAGE = 'Estado não existe'

  def validate(model)
    model.errors[:state_id] << FAIL_MESSAGE unless State.exists?(model.state_id)
  end
end
