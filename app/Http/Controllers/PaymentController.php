<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function paymentProcess()
    {
        \Stripe\Stripe::setApiKey('sk_test_t2fFW2FZ5GTzbX4hWSiBnJWp00Vr7Q6DEQ');
        $token = $_POST['stripeToken'];
        $charge= \Stripe\Charge::create([
            'amount' => 10000,
            'currency' => 'usd',
            'description' => 'Eample charge',
            'source' => $token,
        
            ]);
        }
}
