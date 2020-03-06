Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_W18dGjLtM7cf7Pw0kUTkUIiT00NC8ulRp2'],
  secret_key:      ENV['sk_test_qzCvFjBvG1EIr8HSSfg69jL900TdceNSed']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
