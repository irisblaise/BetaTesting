class Order < ApplicationRecord
  belongs_to :startup, optional: true
  belongs_to :version, optional: true

  monetize :amount_cents


  def self.initialize_with_stripe_session(version)
    order  = Order.create!(
      version: version,
      amount: Version.current_price,
      quantity: version.quantity,
      state: 'pending',
      startup: version.startup
    )

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: version.name,
        amount: Version.current_price * 100,
        currency: 'eur',
        quantity: order.quantity
      }],
      success_url: Rails.application.routes.url_helpers.edit_startup_version_url(version.startup, version, :host => ENV["DOMAIN"]),
      cancel_url: Rails.application.routes.url_helpers.dashboard_url(host: ENV["DOMAIN"])
    )

    order.update(checkout_session_id: session.id)
    order
  end
end
