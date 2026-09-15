<?php

require_once __DIR__ . "/../vendor/autoload.php";

function sanitizeHtml($html)
{
    $config = HTMLPurifier_HTML5Config::createDefault();

    $config->set(
        "HTML.Allowed",
        "p,strong,i,ul,ol,li,h1,h2,h3,h4,h5,h6," .
        "br,blockquote," .
        "a[href|title|target]," .
        "figure[class|style]," .
        "img[src|alt|width|height|style]"
    );

    $config->set("CSS.AllowedProperties", [
        "width",
        "aspect-ratio"
    ]);

    $config->set("URI.AllowedSchemes", [
        "http" => true,
        "https" => true
    ]);

    $purifier = new HTMLPurifier($config);

    return $purifier->purify($html);
}