package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeCross;
import flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private static inline var shape_size : Float = 50;
  private var cross_shape : FlxShapeCross;

  /**
   * Function that is called up when to state is created to set it up.
   */
  override public function create():Void
  {
    // Hide the mouse
    FlxG.mouse.visible = false;

    // setup and create shape
    var line_style:LineStyle = {
      color: FlxColor.CHARTREUSE,
      thickness: 1,
    };
    var fill_style:FillStyle = {
      hasFill: true,
      color: FlxColor.AZURE,
      alpha: 1.0
    };
    cross_shape = new FlxShapeCross(
      ( FlxG.width - shape_size ) / 2, ( FlxG.height - shape_size ) / 2,
      shape_size, shape_size/3,
      shape_size, shape_size/3,
      0.5, 0.5,
      line_style,
      fill_style
    );

    // add the shape to this state
    add(cross_shape);

    // call the superclass create() method *required*
    super.create();
  }

  /**
   * Function that is called when this state is destroyed - you might want to
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    // set sprites to null to help with gc
    cross_shape = null;

    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {



    super.update();
  }
}
