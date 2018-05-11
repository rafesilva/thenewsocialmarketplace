<script>
var handler = StripeCheckout.configure({
  key: 'ENV['STRIPE_PUBLISHABLE_KEY'],
  image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
  locale: 'auto',
  token: function(token) {
    // You can access the token ID with `token.id`.
    // Get the token ID to your server-side code for use.
  }
});

document.getElementById('customButton').addEventListener('click', function(e) {
  // Open Checkout with further options:
  handler.open({
    name: '@current_user.name',
    description: '@cart.item_lines',
    currency: 'aud',
    amount: '@cart.total_price'
  });
  e.preventDefault();
});

// Close Checkout on page navigation:
window.addEventListener('popstate', function() {
  handler.close();
});
</script>
   


