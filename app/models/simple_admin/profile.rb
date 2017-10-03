module SimpleAdmin
  class Profile < Base
    belongs_to :user

    mount_uploader :avatar, ProfileAvatarUploader
  end
end
