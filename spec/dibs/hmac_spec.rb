require 'spec_helper'

describe DIBS::HMAC do
  
  hmac_key = "366b2c24397034366e4175727e44527076617d6f41457c3525433b302d32504272486b623b485b7b5a466a32625e53324a404c40435a7578666c2a4726327872"
  
  describe '.calculate' do
    
    subject { DIBS::HMAC }
    
    it 'should calculate a correct mac value' do
      
      mac = subject.calculate({:amount => "100", :merchant => "2222"}, hmac_key)
      mac.should == "9c4d30a74ade9f93dfeca46edbdac110c8ec9b250185aab25a4555b3575d3ddc"
      
      mac = subject.calculate({:amount => "100", :merchant => "2222", :orderId => "3423432"}, hmac_key)
      mac.should == "f78bebd663d45c67916b5a19690b65cb961dceb6c346dcb202fa591213e6f14f"
    end
    
    it 'should ignore unkown params' do
      mac1 = subject.calculate({:amount => "100", :merchant => "2222"}, hmac_key)
      mac2 = subject.calculate({:amount => "100", :merchant => "2222", :none => "this is not included"}, hmac_key)
      mac1.should == mac2
    end
    
    it 'should include params prefixed with s_' do
      mac1 = subject.calculate({:amount => "100", :merchant => "2222"}, hmac_key)
      mac2 = subject.calculate({:amount => "100", :merchant => "2222", :s_none => "this is included"}, hmac_key)
      mac1.should_not == mac2
      mac2.should == '2e94c4b78a0c75101c769b0592960cdd8f44556feea5a4f0c334184a3beb1b2c'
    end
    
    it 'should include order rows' do
      mac1 = subject.calculate({:amount => "100", :merchant => "2222"}, hmac_key)
      mac2 = subject.calculate({:amount => "100", :merchant => "2222", :oiRow1 => "1;something,100"}, hmac_key)
      mac1.should_not == mac2
      mac2.should == "cab07080a501a38154482017505af601a5ab6823cbac450b2d48b15df38ceeb4"
    end
  end
  
  describe ".valid?" do
    
    subject { DIBS::HMAC }
    
    it 'should be true' do
      
      mac = "9c4d30a74ade9f93dfeca46edbdac110c8ec9b250185aab25a4555b3575d3ddc"
      subject.valid?({:amount => "100", :merchant => "2222", :MAC => mac}, hmac_key).should be_truthy
      
    end
    
    it 'should be false' do
      
      mac = "9c4d30a74ade9f93dfeca46edbdac110c8ec9b250185aab25a4555b3575d3ddc"
      subject.valid?({:amount => "100", :MAC => mac}, hmac_key).should be_falsey
      
    end
    
  end
  
end