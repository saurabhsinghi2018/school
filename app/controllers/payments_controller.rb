class PaymentsController < ApplicationController

  before_action :logged_in_user
  before_action :authorize, only: [:all]


  def new
    @candidate = Candidate.find(params[:format])
    session[:candidate_id] = @candidate.id
  end

  def create

    @candidate = Candidate.find(session[:candidate_id])
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    p=Payment.new
    p.status=true
    p.candidate_id=@candidate.id
    p.save

    payment = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  def index
    @payments = Payment.all
  end

end
