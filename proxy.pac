function FindProxyForURL(url, host) {
    // Use SOCKS5 proxy for all requests
    var socks5Proxy = "SOCKS5 192.168.0.1:1080";

    // Use HTTP proxy for all requests as a backup
    var httpProxy = "PROXY 192.168.0.1:8080";

    // Fallback to HTTP proxy if SOCKS5 is unavailable
    return socks5Proxy + "; " + httpProxy;
}
