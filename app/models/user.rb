class User < ActiveRecord::Base
  has_many :accounts, dependent: :destroy
  has_many :consumption_types, dependent: :destroy
  has_many :invoices, through: :accounts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:user, :admin, :gold]
  
  after_initialize :set_default_role, :if => :new_record?
  
  after_create :create_default_consumption_types
  after_create :create_default_accounts

  def set_default_role
    self.role ||= :user
  end
  
  private
  
  def create_default_consumption_types
    self.consumption_types.create(title: "Продукты")
    self.consumption_types.create(title: "Алкоголь")
    self.consumption_types.create(title: "Кредит")
    self.consumption_types.create(title: "Табак")
    self.consumption_types.create(title: "Автомобиль")
    self.consumption_types.create(title: "Разное")
    self.consumption_types.create(title: "Перевод")
  end
  
  def create_default_accounts
    self.accounts.create(title: "Наличные", is_default:true)
    self.accounts.create(title: "Зарплатная карта")
  end
  
end
