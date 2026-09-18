<?php
require_once __DIR__ . "/../vendor/autoload.php";

function sanitizeHtml($html)
{
    $config = HTMLPurifier_Config::createDefault();

    $config->set(
        "HTML.Allowed",
        "p,strong,i,ul,ol,li,h1,h2,h3,h4,h5,h6," .
        "br,blockquote," .
        "a[href|title|target]," .
        "figure[class]," .
        "div[data-oembed-url]," .
        "iframe[src|width|height|frameborder]," .
        "img[src|alt|width|height|style]"
    );

    $config->set("CSS.AllowedProperties", [
        "width",
        "aspect-ratio",
    ]);

    $config->set("URI.AllowedSchemes", [
        "http" => true,
        "https" => true,
    ]);

    $config->set("HTML.SafeIframe", true);

    $config->set(
        "URI.SafeIframeRegexp",
        "%^https://(www\\.)?youtube(?:-nocookie)?\\.com/embed/[A-Za-z0-9_-]+(?:\\?[^\\s]*)?$%"
    );

    $definition = $config->getHTMLDefinition(true);

    $definition->addElement(
        "figure",
        "Block",
        "Flow",
        "Common",
        [
            "class" => "Text",
        ]
    );

    $definition->addAttribute(
        "div",
        "data-oembed-url",
        "URI"
    );

    $purifier = new HTMLPurifier($config);

    return $purifier->purify($html);
}