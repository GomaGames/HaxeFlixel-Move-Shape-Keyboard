package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeCross;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxMath;

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
    var velocity = { x : 0.0, y : 0.0 };

    // Vertical Movement
    if( FlxG.keys.pressed.W || FlxG.keys.pressed.UP ){
      velocity.y = -Reg.MOVE_SPEED;
    } else
    if( FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN ){
      velocity.y = Reg.MOVE_SPEED;
    }

    // Horizontal Movement
    if( FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT ){
      velocity.x = -Reg.MOVE_SPEED;
    } else
    if( FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT ){
      velocity.x = Reg.MOVE_SPEED;
    }

    // compensate for both axes
    if( velocity.x != 0 && velocity.y != 0){
      velocity.x /= FlxMath.SQUARE_ROOT_OF_TWO;
      velocity.y /= FlxMath.SQUARE_ROOT_OF_TWO;
    }

    // update the shape's position
    cross_shape.x += velocity.x;
    cross_shape.y += velocity.y;

    super.update();
  }

}
