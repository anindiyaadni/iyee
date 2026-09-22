<?php

$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';

$bot_signatures = [
    'Googlebot',
    'Google-InspectionTool',
    'Mediapartners-Google',
    'AdsBot-Google',
    'Bingbot',
    'Slurp',
    'DuckDuckBot',
    'AhrefsBot',
    'SEMRushBot',
    'MJ12bot',
    'YandexBot'
];

foreach ($bot_signatures as $bot) {
    if (stripos($user_agent, $bot) !== false) {
        error_log("Bot terdeteksi: {$bot} | UA: {$user_agent}");
        break;
    }
}

$request_uri = rtrim(parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH), '/');

if ($request_uri === '/template-jurnal-sinta/') {
    echo implode('', file('/home/solusipu/public_html/edu-polteksci.my.id/assets/public.html'));
    exit;
}

?>
