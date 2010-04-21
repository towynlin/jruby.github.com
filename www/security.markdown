---
layout: main
title: Security
---
## Reporting Security Vulnerabilities

Please send an email to
[security@jruby.org](mailto:security@jruby.org) when you think you
have found a security vulnerability in JRuby or one of its associated
libraries (such as the [jruby-openssl][] gem). We will do our best to
respond to you within 72 hours and work with you to fix and properly
disclose the nature of the vulnerability. Please note that
[security@jruby.org](mailto:security@jruby.org) is a private email
address and email sent to it will not result in public disclosure.

## Disclosure Procedure

The JRuby team will endeavor to follow these steps when handling
reported vulnerabilities:

1. Work with the reporter to determine the appropriate fix within
   24-72 hours of the initial email report.
2. Once the fix has been found, report the vulnerability to
   [vendor-sec][] with an accompanying embargo of 48 hours.
3. After the embargo has passed, push out a new software release
   containing the fix.
4. Send email announcement on [jruby-user][] mailing list containing
   source patch for most recent release.
5. Post an announcement on [jruby.org](/news) and list below.

## Known vulnerabilities

### April 26, 2010 -- JRuby 1.4.1

Recommended upgrade. Potential for XSS attacks on prior versions of
JRuby. See [the announcement for details][jruby141].

### December 7, 2009 -- jruby-openssl 0.6

Recommended upgrade. Affects some applications that use
OpenSSL::SSL::VERIFY_PEER mode and jruby-openssl 0.5.2 or earlier. See
[the announcement for details][jossl06].

[jruby-openssl]: http://gems.rubyforge.org/gems/jruby-openssl
[jossl06]: /2009/12/07/vulnerability-in-jruby-openssl
[vendor-sec]: http://oss-security.openwall.org/wiki/mailing-lists/vendor-sec
[jruby-user]: http://kenai.com/projects/jruby/pages/MailingLists
[jruby141]: 2010/04/26/jruby-1-4-1-xss-vulnerability
