class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_indexed :fields => [:email, :name, :company]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :company, :phone, :site, :activity

  has_many :attachments, :class_name => "Account::Attachment", :foreign_key => "account_id"

  has_many :orders, :foreign_key => "account_id"

  has_attached_file :avatar,
    :default_url => '/images/no-avatar.png',
      :default_style => :normal,
    :styles => {
      :large => {
        :geometry => "300x300>",
        :format => :png
      },
      :normal => {
        :geometry => "125x125#",
        :format => :png
      },
      :thumb => {
        :geometry => "50x50#",
        :format => :png
      }
    }

  accepts_nested_attributes_for :attachments, :allow_destroy => true

  validates_attachment_size :avatar, :less_than => 2.megabytes, :if => 'avatar?'
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :if => 'avatar?'

  default_scope order('created_at DESC')

  def title
    name || email
  end



end