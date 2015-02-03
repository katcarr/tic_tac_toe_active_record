require('spec_helper')
describe Space do
  it{ should belong_to(:player)}
  it{ should belong_to(:board)}

  describe("#markby")
  it("lets the player mark the space") do
    space = Space.create({:x_coordinate => 1, :y_coordinate => 1})
    player = Player.create({:mark => "x"})
    space.markby(player)
    expect(space.player).to(eq(player))
  end
end
