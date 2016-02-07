# Currency Converter

### Contains Three Classes

### The Currency Class

* Created with an amount and a currency code
* Equals another currency object with the same amount and currency code
* Does NOT equal another currency object with different amount or currency code
* Contains a method used to add two currency objects together
* Contains a method used to subtract two currency objects from each other
* Contains a DifferentCurrencyCodeError if you try to add or subtract different currencies from each other
* Contains a method used to multiply a Fixnum or float to a currency object
* Has the ability to take a parameter such as "$5.00" and convert into 5 USD

### The CurrencyConverter Class

* Initialized with a Hash of currency codes and conversion rates
* Can take a Currency object and a requested country code and convert the Currency object into that requested currency
* Raises an UnknownCurrencyCodeError when you try to convert to a code that isn't within the hash

### The CurrencyTrader Class

* Initialized with two CurrencyConverter objects from two different points in time
* Contains a method used to return best investment currency over that span of time
