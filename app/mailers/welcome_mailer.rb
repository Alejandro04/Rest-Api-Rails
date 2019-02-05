class WelcomeMailer < ApplicationMailer
  def notify(subcategory)
    @subcategory = subcategory

    mail to: "alejodev04@gmail.com", subject: 'Testing, registrado una subcategoria'
  end
end
