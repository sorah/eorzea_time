RSpec.describe EorzeaTime do
  let(:et) { EorzeaTime.from_time(Time.utc(2015,7,23,9,0,0)) }

  describe "time calculation" do
    subject { [et.hour, et.min, et.sec] }
    it { is_expected.to eq [17,8,34] }
  end
end
