module Platidoma
  
  class Client 
    attr_accessor :shop_id, :login, :gate_password, :url

    def initialize(args)
      self.shop_id = args[:shop_id]
      self.login = args[:login]
      self.gate_password = args[:gate_password]
      self.url = args[:url]
    end
    
    def build_payment_sign(args)
      amount = args[:amount]
      rnd = args[:rnd]
      #FIXME преоброзование суммы к формату .xx
      Digest::MD5.hexdigest("#{shop_id}:#{login}:#{gate_password}:#{rnd}:#{amount}.00")
    end

    def build_status_sign(args)
      amount = args[:amount]
      rnd = args[:rnd]
      trans_id = args[:trans_id]
      order_id = args[:order_id]
      Digest::MD5.hexdigest("#{shop_id}:#{login}:#{gate_password}:#{rnd}:#{trans_id}:#{order_id}:#{amount}.00")
    end

    def build_payment_url(args)
      params = { 
        pd_shop_id: shop_id, 
        pd_login: login, 
        pd_amount: "#{args[:amount]}.00", 
        pd_order_id: args[:order_id], 
        pd_email: args[:email],
        pd_rnd: args[:rnd],
        pd_sign: args[:sign]
      }

      uri = ::Addressable::URI.new
      uri.query_values = params

      "https://#{Platidoma.configuration.host}?#{uri.query}"
    
    end


    def get_status(args)
      response = client_proxy.get_status(args).perform
      Response::GetStatus.parse(response.body).pd_status if response.success?
    end

    private 
    def client_proxy
      @client_proxy ||= ClientProxy.new
    end

  end

end