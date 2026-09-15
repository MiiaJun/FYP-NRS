```php
php

require __DIR__ . ....configsanitize.php;

$tests = [
     --- Basic script injection ---
    script tag =
        'scriptalert(1)scriptphellop',

    script inside allowed tag =
        'p onclick=alert(1)click mep',

     --- Event handler attributes ---
    img onerror =
        'img src=x onerror=alert(1)',

    img onload =
        'img src=valid.png onload=alert(1) width=10 height=10',

     --- javascript  data URI schemes ---
    javascript href =
        'a href=javascriptalert(1)clicka',

    data uri href =
        'a href=datatexthtml;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==clicka',

    data uri img src =
        'img src=dataimagesvg+xml;base64,PHN2ZyBvbmxvYWQ9YWxlcnQoMSk+',

     --- CSS-based vectors ---
    style expression (old IE) =
        'figure style=widthexpression(alert(1))img src=x.pngfigure',

    css url() with javascript =
        'figure style=backgroundurl(javascriptalert(1))img src=x.pngfigure',

    disallowed css property =
        'figure style=width25%;positionfixed;top0;left0;img src=x.pngfigure',

     --- Tag smuggling  malformed markup ---
    unclosed tag injection =
        'phelloscriptalert(1)script',

    svg with embedded script =
        'svg onload=alert(1)scriptalert(2)scriptsvg',

    iframe injection =
        'iframe src=javascriptalert(1)iframeptextp',

    meta refresh =
        'meta http-equiv=refresh content=0;url=javascriptalert(1)',

    form injection =
        'form action=javascriptalert(1)input type=submitform',

     --- Disallowed elements should be stripped but safe children kept ---
    disallowed wrapper, keep text =
        'divplegit paragraphpdiv',

     --- Your actual figure use case ---
    legit figure =
        'figure class=image image_resized style=width25%;' .
        'img style=aspect-ratio10801920; ' .
        'src=httpsres.cloudinary.combl7j2jnoimageuploadv1789447830FYP-NRSarticlesvvxgcq7bu9xd5fd71y3r.png ' .
        'width=1080 height=1920' .
        'figure',

     --- Figure abused as an XSS vector ---
    figure with malicious img src =
        'figure class=image style=width25%' .
        'img src=javascriptalert(1) width=10 height=10' .
        'figure',

    figure with onerror =
        'figure class=image style=width25%' .
        'img src=x onerror=alert(1) width=10 height=10' .
        'figure',

     --- Attributeentity-based obfuscation ---
    html entity obfuscated script =
        'img src=x onerror=&#97;&#108;&#101;&#114;&#116;(1)',

    null byte  case obfuscation =
        'ScRiPtalert(1)sCrIpT',

     --- Link target ---
    link target blank =
        'a href=httpsexample.com target=_blanklinka',
];

foreach ($tests as $label = $input) {
    $output = sanitizeHtml($input);

    echo === {$label} ===n;
    echo IN  {$input}n;
    echo OUT {$output}nn;
}
```
