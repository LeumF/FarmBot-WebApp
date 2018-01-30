require "spec_helper"
require_relative "./flat_ir_helpers"

describe SecondPass do
  let :result do
    Sequence.all.destroy_all
    expect(EdgeNode.count).to eq(0)
    expect(PrimaryNode.count).to eq(0)
    SecondPass.run!(input: FlatIrHelpers.fake_first_pass)
  end

  it "wires stuff up" do
    expect(result.map(&:class).uniq).to eq([PrimaryNode])
  end
end