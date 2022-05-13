require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    temp = @nameable.correct_name
    return temp[0, 10] if temp.length > 10

    temp
  end
end
