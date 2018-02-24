class GameViewController < UIViewController
  include ScreenSizes

    # This hides the status bar.
    def prefersStatusBarHidden
      true
    end

    # This hides iPhone X's notch thingy at the bottom.
    def prefersHomeIndicatorAutoHidden
      true
    end

    # When the code in app_delegate is successfully executed,
    # this method is invoked. Here is where we create and present
    # our scenes.
    def viewDidLoad
      super
      self.view = sk_view
      # The first time the app is loaded. Present scene one.
      @scene_one = SceneOne.sceneWithSize(sk_view.frame.size)
      @scene_one.root = self
      sk_view.presentScene @scene_one
      $controller = self
    end

    def device_screen_width
      UIScreen.mainScreen.bounds.size.width
    end

    def device_screen_height
      UIScreen.mainScreen.bounds.size.height
    end

    def screen_rect
      CGRectMake(0, 0, device_screen_width, device_screen_height)
    end

  def sk_view
      @sk_view ||= SKView.alloc.initWithFrame screen_rect
    end
  end