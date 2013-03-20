module Platidoma
  
  class ClientProxy < ::Weary::Client

    post :get_status, "https://#{Platidoma.configuration.host}/status.php" do |resource|
      resource.required :pd_shop_id, :pd_trans_id, :pd_rnd, :pd_sign
    end

  end

end