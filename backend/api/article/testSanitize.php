<?php

require __DIR__ . "/../../config/sanitize.php";

// Prevent the browser from executing the XSS test inputs
header("Content-Type: text/plain; charset=UTF-8");

$tests = [
    // --- Basic script injection ---
    "script tag" =>
        "<script>alert(1)</script><p>hello</p>",

    "script inside allowed tag" =>
        '<p onclick="alert(1)">click me</p>',

    // --- Event handler attributes ---
    "img onerror" =>
        '<img src="x" onerror="alert(1)">',

    "img onload" =>
        '<img src="valid.png" onload="alert(1)" width="10" height="10">',

    // --- javascript / data URI schemes ---
    "javascript href" =>
        '<a href="javascript:alert(1)">click</a>',

    "data uri href" =>
        '<a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==">click</a>',

    "data uri img src" =>
        '<img src="data:image/svg+xml;base64,PHN2ZyBvbmxvYWQ9YWxlcnQoMSk+">',

    // --- CSS-based vectors ---
    "style expression (old IE)" =>
        '<figure style="width:expression(alert(1))"><img src="x.png"></figure>',

    "css url() with javascript" =>
        '<figure style="background:url(javascript:alert(1))"><img src="x.png"></figure>',

    "disallowed css property" =>
        '<figure style="width:25%;position:fixed;top:0;left:0;"><img src="x.png"></figure>',

    // --- Tag smuggling / malformed markup ---
    "unclosed tag injection" =>
        '<p>hello<script>alert(1)</script>',

    "svg with embedded script" =>
        '<svg onload="alert(1)"><script>alert(2)</script></svg>',

    "iframe injection" =>
        '<iframe src="javascript:alert(1)"></iframe><p>text</p>',

    "meta refresh" =>
        '<meta http-equiv="refresh" content="0;url=javascript:alert(1)">',

    "form injection" =>
        '<form action="javascript:alert(1)"><input type="submit"></form>',

    // --- Disallowed elements should be stripped but safe children kept ---
    "disallowed wrapper, keep text" =>
        '<div><p>legit paragraph</p></div>',

    // --- Actual figure use case ---
    "legit figure" =>
        '<figure class="image image_resized" style="width:25%;">' .
        '<img style="aspect-ratio:1080/1920;" ' .
        'src="https://res.cloudinary.com/bl7j2jno/image/upload/v1789447830/FYP-NRS/articles/vvxgcq7bu9xd5fd71y3r.png" ' .
        'width="1080" height="1920">' .
        '</figure>',

    // --- Figure abused as XSS vector ---
    "figure with malicious img src" =>
        '<figure class="image" style="width:25%">' .
        '<img src="javascript:alert(1)" width="10" height="10">' .
        '</figure>',

    "figure with onerror" =>
        '<figure class="image" style="width:25%">' .
        '<img src="x" onerror="alert(1)" width="10" height="10">' .
        '</figure>',

    // --- Attribute/entity-based obfuscation ---
    "html entity obfuscated script" =>
        '<img src="x" onerror="&#97;&#108;&#101;&#114;&#116;(1)">',

    "case obfuscation" =>
        '<ScRiPt>alert(1)</sCrIpT>',

    // --- Link target ---
    "link target blank" =>
        '<a href="https://example.com" target="_blank">link</a>',
];

foreach ($tests as $label => $input) {
    $output = sanitizeHtml($input);

    echo "=== {$label} ===\n";
    echo "IN:  {$input}\n";
    echo "OUT: {$output}\n\n";
}