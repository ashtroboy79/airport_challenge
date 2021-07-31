require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to :land_airplane
  end

  it 'a plane can take-off' do
    plane = Plane.new
    subject.land_airplane(plane)
    subject.takeoff_airplane(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'prevents landing if airport is full' do
    plane = Plane.new
    expect {(Airport::DEFAULT_CAPAPCITY + 1).times { subject.land_airplane Plane.new }}.to raise_error "airport full"
  end

  it 'prevents landing if plane is not flying' do
    plane1 = Plane.new
    subject.land_airplane(plane1)
    expect { subject.land_airplane(plane1)}.to raise_error "plane already landed"
  end

end
