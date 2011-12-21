require 'digest'
class User < ActiveRecord::Base
  attr_accessible :username, :real_name, :password, :email, :password_confirmation, :photo
  attr_accessor :password
  
  has_many :user_bookmarks
  has_many :bookmarks, :through => :user_bookmarks
  has_attached_file :photo,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }
  
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => 'image/jpeg'


  validates :password, :presence     => true,
                       :length       => { :within => 7..40 }

  before_save :encrypt_password
  
  validates :username, :presence  => true,
                        :uniqueness => true
  validates :real_name, :presence => true,
                        :length => { :within => 2..75 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password, :message => "Doesn't  match Confirmation"

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(username, submitted_password)
    user = find_by_username(username)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    return nil  if user.nil?
    return user if user.salt == cookie_salt
  end

  def encrypt_password
    if password.present?
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  end
  
  def set_avatar(uploaded_file)
    self.avatar = Base64.encode64(uploaded_file.read)
    self.save
  end
    private
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
  
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
  
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end