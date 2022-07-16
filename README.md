# Go ACME Lego container

The latest release of https://github.com/go-acme/lego bundled in a RHEL 9 UBI container image.

A built container image may be pulled from:
https://quay.io/repository/sirwalrus/go-lego


```
$ podman pull quay.io/sirwalrus/go-lego
Trying to pull quay.io/sirwalrus/go-lego:latest...
Getting image source signatures
[...]

$ podman run -i -t registry.skunkfu.org/container-builders/acme-lego:latest 
NAME:
   lego - Let's Encrypt client written in Go

USAGE:
   lego [global options] command [command options] [arguments...]

VERSION:
   v4.8.0

COMMANDS:
   run      Register an account, then create and install a certificate
   revoke   Revoke a certificate
   renew    Renew a certificate
   dnshelp  Shows additional help for the '--dns' global option
   list     Display certificates and accounts information.
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --domains value, -d value    Add a domain to the process. Can be specified multiple times.
   --server value, -s value     CA hostname (and optionally :port). The server certificate must be trusted in order to avoid further modifications to the client. (default: "https://acme-v02.api.letsencrypt.org/directory")
   --accept-tos, -a             By setting this flag to true you indicate that you accept the current Let's Encrypt terms of service. (default: false)
   --email value, -m value      Email used for registration and recovery contact.
   --csr value, -c value        Certificate signing request filename, if an external CSR is to be used.
   --eab                        Use External Account Binding for account registration. Requires --kid and --hmac. (default: false)
   --kid value                  Key identifier from External CA. Used for External Account Binding.
   --hmac value                 MAC key from External CA. Should be in Base64 URL Encoding without padding format. Used for External Account Binding.
   --key-type value, -k value   Key type to use for private keys. Supported: rsa2048, rsa4096, rsa8192, ec256, ec384. (default: "ec256")
   --filename value             (deprecated) Filename of the generated certificate.
   --path value                 Directory to use for storing the data. (default: "/.lego") [$LEGO_PATH]
   --http                       Use the HTTP challenge to solve challenges. Can be mixed with other types of challenges. (default: false)
   --http.port value            Set the port and interface to use for HTTP based challenges to listen on.Supported: interface:port or :port. (default: ":80")
   --http.proxy-header value    Validate against this HTTP header when solving HTTP based challenges behind a reverse proxy. (default: "Host")
   --http.webroot value         Set the webroot folder to use for HTTP based challenges to write directly in a file in .well-known/acme-challenge. This disables the built-in server and expects the given directory to be publicly served with access to .well-known/acme-challenge
   --http.memcached-host value  Set the memcached host(s) to use for HTTP based challenges. Challenges will be written to all specified hosts.
   --tls                        Use the TLS challenge to solve challenges. Can be mixed with other types of challenges. (default: false)
   --tls.port value             Set the port and interface to use for TLS based challenges to listen on. Supported: interface:port or :port. (default: ":443")
   --dns value                  Solve a DNS challenge using the specified provider. Can be mixed with other types of challenges. Run 'lego dnshelp' for help on usage.
   --dns.disable-cp             By setting this flag to true, disables the need to wait the propagation of the TXT record to all authoritative name servers. (default: false)
   --dns.resolvers value        Set the resolvers to use for performing recursive DNS queries. Supported: host:port. The default is to use the system resolvers, or Google's DNS resolvers if the system's cannot be determined.
   --http-timeout value         Set the HTTP timeout value to a specific value in seconds. (default: 0)
   --dns-timeout value          Set the DNS timeout value to a specific value in seconds. Used only when performing authoritative name servers queries. (default: 10)
   --pem                        Generate a .pem file by concatenating the .key and .crt files together. (default: false)
   --pfx                        Generate a .pfx (PKCS#12) file by with the .key and .crt and issuer .crt files together. (default: false)
   --pfx.pass value             The password used to encrypt the .pfx (PCKS#12) file. (default: "changeit")
   --cert.timeout value         Set the certificate timeout value to a specific value in seconds. Only used when obtaining certificates. (default: 30)
   --user-agent value           Add to the user-agent sent to the CA to identify an application embedding lego-cli
   --help, -h                   show help (default: false)
   --version, -v                print the version (default: false)

```

Excellent LEGO documentation may be found at https://go-acme.github.io/lego/.
