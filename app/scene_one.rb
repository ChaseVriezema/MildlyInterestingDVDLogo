class SceneOne < SKScene
  include ScreenSizes

  attr_accessor :root

  def didMoveToView _
    self.scaleMode = SKSceneScaleModeAspectFit

    #$scene = self
    self.backgroundColor = UIColor.blackColor

    @logo = add_sprite device_screen_width.fdiv(2),
                         device_screen_height.fdiv(2),
                         'DVD_video_logo.png'

    @logo.size
    @velocity = CGVectorMake 5.0, 5.0
    @colors = Array.new
    @colors.push(UIColor.blueColor)
    @colors.push(UIColor.whiteColor)
    @colors.push(UIColor.yellowColor)
    @colors.push(UIColor.redColor)
    @colors.push(UIColor.greenColor)
    @currentColor = 0
  end


def add_sprite x, y, path
  # Sprites are created using a texture. So first we have to create a
  # texture from the png in the /resources directory.
  texture = SKTexture.textureWithImageNamed path

  # Then we can create the sprite and set it's location.
  sprite = SKSpriteNode.spriteNodeWithTexture texture
  sprite.position = CGPointMake x, y
  sprite.xScale = 0.1
  sprite.yScale = 0.1
  sprite.colorBlendFactor = 1.0
  addChild sprite
  sprite
end

def update _
  @logo.position = CGPointMake @logo.position.x + @velocity.dx, @logo.position.y + @velocity.dy
  if(@logo.position.x + (@logo.size.width/2) > device_screen_width || @logo.position.x - (@logo.size.width/2) < 0)
    @velocity.dx *= -1.0
    impact
  end
  if(@logo.position.y + (@logo.size.height/2) > device_screen_height || @logo.position.y - (@logo.size.height/2) < 0)
    @velocity.dy *= -1.0
    impact
  end
end

  def impact
    @logo.color =  @colors[@currentColor]
    @currentColor = @currentColor + 1
    if(@currentColor == @colors.size)
      @currentColor = 0
    end
  end
end