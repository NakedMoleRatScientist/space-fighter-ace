



class Test_Space_Object_Movement < Test::Unit::TestCase
  context "Simulate 10 seconds worth of movement" do
    setup do
      @object = SpaceObject.new("data/game/enemy.png")
      @object.simulate()
    end
    should "should have 10 objects.." do
      assert @object.movement.length == 10
    end
  end
end
