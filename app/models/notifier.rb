class Notifier < ActionMailer::Base

  def succesful_registration(store)
    @store = store
    @subject = "Welcome to MarketPlace"
    @recipients = store.user.email
    @from = 'no-reply@marketplace.com'
    @headers = {}
  end

end
