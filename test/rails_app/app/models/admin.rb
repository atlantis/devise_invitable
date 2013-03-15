class Admin < PARENT_MODEL_CLASS
  if DEVISE_ORM == :mongoid
    include Mongoid::Document
    ## Database authenticatable
    field :email,              :type => String, :default => ""
    field :encrypted_password, :type => String, :default => ""
    validates_presence_of :email
    validates_presence_of :encrypted_password

    ## Confirmable
    field :confirmation_token,   :type => String
    field :confirmed_at,         :type => Time
    field :confirmation_sent_at, :type => Time
    field :unconfirmed_email,    :type => String # Only if using reconfirmable

  end



  devise :database_authenticatable, :validatable, :registerable
  include DeviseInvitable::Inviter
end
