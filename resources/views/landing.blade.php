<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{csrf_token()}}">
    <title>GeekStore</title>
    <link href=" {{ mix('css/app.css') }}" rel="stylesheet">
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
    <div id="app">
        <app></app>
    </div>
    <script src="{{ mix('js/bootstrap.js') }}"></script>
    <script src="{{ mix('js/app.js') }}"></script>
</body>
</html>