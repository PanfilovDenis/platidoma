require 'test_helper'

class ClientTest < TestCase
  def setup
    Platidoma.configure do |config|
      config.host = 'pg-test.platidoma.ru'
    end

    @stub = stub_request(:post, "https://pg-test.platidoma.ru/status.php").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => load_fixture('response.xml'), :headers => {})

    @parms = { shop_id: 1, login: "test", gate_password: "test" }
    @client = Platidoma::Client.new(@parms)
  end

  def test_get_status
    @request_params = {pd_shop_id: 1, pd_trans_id: 1, pd_rnd: "test", pd_sign: "qq"}
    response_status = @client.get_status(@request_params)
    expected_response = Platidoma::Response::GetStatus.parse(load_fixture('response.xml')) 
    assert_equal response_status, expected_response.pd_status
  end

  def test_build_payment_url
    params = { 
        shop_id: 1, 
        login: "test", 
        amount: 1, 
        order_id: 1, 
        description: "descr",
        email: "email",
        rnd: "rnd",
        sign: "sign",
    }

    url = @client.build_payment_url params
    expected_url = "https://#{Platidoma.configuration.host}/payment.php?pd_amount=1.00&pd_email=email&pd_login=test&pd_order_id=1&pd_rnd=rnd&pd_shop_id=1&pd_sign=sign"
    assert_equal expected_url, url

  end

end