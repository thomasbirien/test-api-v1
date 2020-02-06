class User < ApplicationRecord

  def check_the_pseudo(pseudo)
    message = User.exists?(pseudo: pseudo) ? (pseudo = generate_new_pseudo(pseudo)) : "OK"
    self.pseudo = pseudo
    json_to_prepare = {message: message}
  end

  def generate_new_pseudo(pseudo)
    loop do
      # generate pseudo
      pseudo = ('A'..'Z').to_a.shuffle[0,3].join
      break if !User.exists?(pseudo: pseudo)
    end
    pseudo
  end
end
