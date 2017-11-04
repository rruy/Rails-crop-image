module Paperclip
  class Cropper < Thumbnail
    
   def transformation_command
      if crop_command
        crop_command + super.join(' ').sub(/ -crop \S+/, '').split(' ')
      else
        super
      end
    end
    
    def crop_command
     target = @attachment.instance
    " -crop '1x#{target.height}+0+0'" if target.cropping?
    end
    
  end
end
