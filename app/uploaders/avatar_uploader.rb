class AvatarUploader < CarrierWave::Uploader::Base

 include CarrierWave::MiniMagick
  storage :file

  version :thumb do
    process :crop
    resize_to_fill(300, 300)
  end

  version :tiny, from_version: :thumb do
    process resize_to_fill: [20, 20]
  end

  version :large do
    resize_to_limit(800, 800)
  end

  def crop
    if !model.crop_x.nil? 
      resize_to_limit(800, 800)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        # [[w, h].join('x'),[x, y].join('+')].join('+') => "wxh+x+y"
        img.crop([[w, h].join('x'),[x, y].join('+')].join('+'))
      end
    end
  end
 
end
