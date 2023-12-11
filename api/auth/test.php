<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="http://127.0.0.1/music/api/auth/register" method="post">
        <input type="text" name="client_pseudo" id="client_pseudo" value="zod">
        <input type="text" name="client_profile" id="client_profile" value="John">
        <input type="text" name="client_gender" id="client_gender" value="male">
        <input type="email" name="client_email" id="client_email" value="jdoe@gmail.com">
        <input type="text" name="client_phone" id="client_phone" value="099234567">
        <input type="password" name="client_password" id="client_password" value="1234">
        <input type="password" name="conf_client_password" id="conf_client_password" value="1234">
        <input type="submit" value="send">
    </form>
</body>
</html>