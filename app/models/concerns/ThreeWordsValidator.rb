class ThreeWordsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.split(" ").length <= 3
      record.errors[attribute] << (options[:message] || "must be greater than 3 words")
    end
  end
end
