defmodule Tutopoint.Payment.Customer do
    @moduledoc """
        This is an internal wrapper for Stripe that will make
        functional composition by returning a single type (:id)
        in this case

    """


    alias Stripe.Customer
    alias Stripe.Charge

    @doc """
        Stripe lib wrapper. See stripity_stripe
    """
    def getCustomer(stripeid) do
        Customer.retrieve(stripeid)
    end
    
    @doc """
        Stripe lib wrapper. See stripity_stripe
    """
    def chargeCustomer(id, source, amount) do
        Charge.create(%{amount: amount, currency: "USD", customer: id, source: source})
        
    end


    @type email :: String.t
    @type name :: String.t
    @spec createCustomer(email, name) :: String.t
    def createCustomer(email, name) do
        case Customer.create(%{email: email, name: name}) do
            {:ok, cus} ->
                cus.id
            {:error, error} -> {:error, error}
        end
    end

    @type id :: String.t
    @spec listCards(id) :: String.t
    def listCards(id) do
        case Stripe.PaymentMethod.list(%{customer: id, type: "card"}) do
            {:ok, list} ->
                for card <- list.data do
                  %{src: card.id, last4: card.card.last4}

                end
            {:error, error} -> {:error, error}

        end
    end

    # TODO: Create save payment method function

end