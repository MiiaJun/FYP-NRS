<?php

require __DIR__ . "/config/resend.php";
require __DIR__ . "/vendor/autoload.php";

$resend = Resend::client($resendApiKey);

$resend->emails->send([
	"from" => "NRS <nrs@resend.dev>",
	"to" => ["dragrvejunz@gmail.com"],
	"subject" => "Hello World",
	"html" => "<strong>it works!</strong>",
]);