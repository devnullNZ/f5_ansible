when HTTP_REQUEST {
    switch -glob [HTTP::uri] {
        "/healthz" { HTTP::respond 200 content "ok" }
        "/v1/*"    { HTTP::header insert "X-API-Version" "1" }
        "/v2/*"    { HTTP::header insert "X-API-Version" "2" }
        default    { HTTP::respond 404 content "not found" }
    }
}
