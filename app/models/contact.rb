class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "doit contenir un @"}
  validates :message,  presence: true


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "Namilya9@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
