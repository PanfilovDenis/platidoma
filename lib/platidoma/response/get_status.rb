module Platidoma
  module Response
    class GetStatus
      include HappyMapper

      tag 'transaction'

      element :pd_trans_id, Integer
      element :pd_order_id, Integer
      element :pd_amount, String
      element :pd_status, String
      element :pd_payment_number, String
      element :pd_auth_code, String
      element :pd_rnd, String
      element :pd_sign, String
      element :pd_creation_time, String
      element :pd_paid_time, String
      element :pd_reversed_time, String
      element :pd_declined_time, String
    end
  end
end