RSpec.describe EorzeaTime do
  let(:et) { EorzeaTime.from_time(Time.utc(2015,7,23,9,0,0)) }

  describe "local time to eorzean time" do
    subject { [et.hour, et.min, et.sec] }
    it { is_expected.to eq [17,8,34] }
  end

  describe "#last_occurrence" do
    context "when an ET is before the specified local time" do
      subject { et.last_occurrence(time: Time.utc(2015,7,23,9,1,0)) }
      it { is_expected.to eq Time.utc(2015,7,23,9,0,0) }
    end

    context "when an ET is after the specified local time" do
      subject { et.last_occurrence(time: Time.utc(2015,7,23,9,0,0)) }
      it { is_expected.to eq Time.utc(2015,7,23,7,50,0) }
    end
  end

  describe "#next_occurrence" do
    context "when an ET is before the specified local time" do
      subject { et.next_occurrence(time: Time.utc(2015,7,23,8,59,0)) }
      it { is_expected.to eq Time.utc(2015,7,23,9,0,0) }
    end

    context "when an ET is after the specified local time" do
      subject { et.next_occurrence(time: Time.utc(2015,7,23,9,0,0)) }
      it { is_expected.to eq Time.utc(2015,7,23,10,10,0) }
    end
  end

end
