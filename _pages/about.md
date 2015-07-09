---
layout: page
permalink: /about/
title: About
---

I'm an artist, writer and hacker from the UK based in Vancouver, Canada. This is my personal site and the opinions expressed here are my own.

You can contact me via:

[Keybase](https://keybase.io/)

[Onename](https://onename.com/robmyers)

[email](mailto:rob@robmyers.orgDELETE_THIS_BIT)

[GNU social](https://quitter.se/robmyers)

[Twitter](https://twitter.com/robmyers)

[Facebook](https://www.facebook.com/r0bmyers)

[Linkedin](http://uk.linkedin.com/in/robertmyers)

And I have a character called Yarrel on LambdaMOO and Second Life.

<h3>Tip Me With Bitcoin</h3>
<style>
.bitpay-donate ul, .bitpay-donate li {padding:0;margin:0;list-style:none;}
.bitpay-donate li {padding:10px 0;}
input.bitpay-donate-error {border:2px solid red;}
</style>
<form class="bitpay-donate" action="https://bitpay.com/checkout" method="post" onsubmit="return checkRequiredFields(this);">
<input name="action" type="hidden" value="checkout">
<fieldset>
<ul>
<li class="bitpay-donate-field"><label>Your Email:</label><br /><input class="bitpay-donate-field-email" name="orderID" type="email" placeholder="Email address (optional)" maxlength="50" autocapitalize="off" autocorrect="off"/><br />
</li>
<li class="bitpay-donate-field"><label>Amount:</label><br /><input class="bitpay-donate-field-price" name="price" type="number" value="10.00" placeholder="Amount" maxlength="10" min="0.000006" step="0.000001"/>
<select class="bitpay-donate-field-currency" name="currency" value="">
<option selected="selected" value="USD">USD</option>
<option value="BTC">BTC</option>
<option value="EUR">EUR</option>
<option value="GBP">GBP</option>
<option value="AUD">AUD</option>
<option value="BGN">BGN</option>
<option value="BRL">BRL</option>
<option value="CAD">CAD</option>
<option value="CHF">CHF</option>
<option value="CNY">CNY</option>
<option value="CZK">CZK</option>
<option value="DKK">DKK</option>
<option value="HKD">HKD</option>
<option value="HRK">HRK</option>
<option value="HUF">HUF</option>
<option value="IDR">IDR</option>
<option value="ILS">ILS</option>
<option value="INR">INR</option>
<option value="JPY">JPY</option>
<option value="KRW">KRW</option>
<option value="LTL">LTL</option>
<option value="LVL">LVL</option>
<option value="MXN">MXN</option>
<option value="MYR">MYR</option>
<option value="NOK">NOK</option>
<option value="NZD">NZD</option>
<option value="PHP">PHP</option>
<option value="PLN">PLN</option>
<option value="RON">RON</option>
<option value="RUB">RUB</option>
<option value="SEK">SEK</option>
<option value="SGD">SGD</option>
<option value="THB">THB</option>
<option value="TRY">TRY</option>
<option value="ZAR">ZAR</option>
</select>
</li>
</ul>
<input type="hidden" name="data" value="yYMCiiz6smvjiF27NB3St0uRef7qKEFqzNF/76kFHn0ZyG3ZN9AQjYG98HjAh6dvKah33JTESvqYEausZnYuksjIcJ1cg/Cu13ckPB35cDRjpncSRxfs1F1gFxjct/72fspCpBv046lX1BZBGxy5Oick2pOmVL4z8HhtxJRurDAXi2vjTqskvr+6TDEUR7Wh4ufRvIx2wTcm58Nl6t1ewjY//IrJK0efjduAjfzTg4XxAwJYYffj4gosEVqdGgrR"> 
<div class="bitpay-donate-button-wrapper">
<input class="bitpay-donate-button" name="submit" src="https://bitpay.com/img/donate-button.svg" onerror="this.onerror=null; this.src='https://bitpay.com/img/donate-button-md.png'" width="126" height="48" type="image" alt="BitPay, the easy way to pay with bitcoins." border="0">
</div>
</fieldset>
</form>
<script type="text/javascript">
function checkRequiredFields(form){
function isFilled(field){
if (field.value.length < 1){
return false;
}
return true;
}
var elements = form.elements;
var invalid = false;
for(var i=0; i<elements.length; i++) {
elements[i].className = elements[i].className.replace('bitpay-donate-error', '');
if(elements[i].className.indexOf("required") != -1) {
if(!isFilled(elements[i])){
elements[i].className = elements[i].className + ' bitpay-donate-error';
invalid = true;
};
};
}
if ( invalid ) {
return false;
}
var donationElement = document.getElementById('donation-value');
if(donationElement){
var enteredDonation = Number(donationElement.value);
var maximumDonation = Number(document.getElementById('reference-maximum').value);
if(enteredDonation > maximumDonation){
alert("Your donation was larger than the allowed maximum of " + Number(maximumDonation).toFixed(2))
return false;
};
};
return true;
};
</script>