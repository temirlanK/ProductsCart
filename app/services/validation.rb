class Validation
  # def initialize(params)
  #   @params = params
  # end

  # def validate_params 
  #   @params.values.each do |p|
  #     unless /\A[-+]?\d+\z/ === p
  #       return false
  #     end
  #   end
  #   return true
  # end

  def self.validate_params params
    params.values.each do |p|
      unless /\A[-+]?\d+\z/ === p
        return false
      end
    end
    return true
  end

end