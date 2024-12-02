function FindProxyForURL(url, host) {
    // Use HTTP proxy first
    var httpProxy = "PROXY 192.168.0.1:8080";

    // Fallback to SOCKS5 proxy if HTTP proxy is unavailable
    var socks5Proxy = "SOCKS5 192.168.0.1:1080";

    // Return the proxies in the desired order
    return httpProxy + "; " + socks5Proxy;
}
