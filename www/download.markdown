---
layout: main
title: Downloads
---
# JRuby Downloads

## Current Release: JRuby 1.4.0RC2

JRuby 1.4.0RC2 is the second release candidate in the series leading
to the 1.4.0 release.

- Now Compatible with Ruby 1.8.7
- New windows installer
- New embedding api
- Improved 1.9 support
- [Full release notes](/2009/10/21/jruby-1-4-0-rc2)
 
{% assign path = 'http://jruby.kenai.com/downloads/1.4.0RC2/' %}
{% capture bin %}{{path}}jruby-bin-1.4.0RC2{% endcapture %}
{% capture src %}{{path}}jruby-src-1.4.0RC2{% endcapture %}
[JRuby 1.4.0RC2 Binary .tar.gz]({{bin}}.tar.gz) ([md5]({{bin}}.tar.gz.md5), [sha1]({{bin}}.tar.gz.sha1))<br/>
[JRuby 1.4.0RC2 Binary .zip]({{bin}}.zip) ([md5]({{bin}}.zip.md5), [sha1]({{bin}}.zip.sha1))<br/>
[JRuby 1.4.0RC2 Windows Executable]({{path}}jruby_windows_1_4_0RC2.exe)<br/>
[JRuby 1.4.0RC2 Windows Executable+JRE]({{path}}jruby_windowsjre_1_4_0RC2.exe)<br/>
[JRuby 1.4.0RC2 Source .tar.gz]({{src}}.tar.gz) ([md5]({{src}}.tar.gz.md5), [sha1]({{src}}.tar.gz.sha1))<br/>
[JRuby 1.4.0RC2 Source .zip]({{src}}.zip) ([md5]({{src}}.zip.md5), [sha1]({{src}}.zip.sha1))<br/>
[JRuby 1.4.0RC2 Complete .jar]({{path}}jruby-complete-1.4.0RC2.jar) ([md5]({{path}}jruby-complete-1.4.0RC2.jar.md5), [sha1]({{path}}jruby-complete-1.4.0RC2.jar.sha1))<br/>

## Previous Release: JRuby 1.3.1

JRuby 1.3.1 is a minor bug fix release which:

- Fixes a recently discovered security bug in BigDecimal
- Fixes a regression in timeout (0-1 second timeouts truncate to 0)
- Fixes a regression Thread.wakeup where the thread would not wake up
- [Full release notes](/2009/06/15/jruby-1-3-1)

{% assign path = 'http://jruby.kenai.com/downloads/1.3.1/' %}
{% capture bin %}{{path}}jruby-bin-1.3.1{% endcapture %}
{% capture src %}{{path}}jruby-src-1.3.1{% endcapture %}
[JRuby 1.3.1 Binary .tar.gz]({{bin}}.tar.gz) ([md5]({{bin}}.tar.gz.md5), [sha1]({{bin}}.tar.gz.sha1))<br/>
[JRuby 1.3.1 Binary .zip]({{bin}}.zip) ([md5]({{bin}}.zip.md5), [sha1]({{bin}}.zip.sha1))<br/>
[JRuby 1.3.1 Source .tar.gz]({{src}}.tar.gz) ([md5]({{src}}.tar.gz.md5), [sha1]({{src}}.tar.gz.sha1))<br/>
[JRuby 1.3.1 Source .zip]({{src}}.zip) ([md5]({{src}}.zip.md5), [sha1]({{src}}.zip.sha1))<br/>
[JRuby 1.3.1 Complete .jar]({{path}}jruby-complete-1.3.1.jar) ([md5]({{path}}jruby-complete-1.3.1.jar.md5), [sha1]({{path}}jruby-complete-1.3.1.jar.sha1))<br/>

## Previous Release: JRuby 1.3.0

The fixes in this release are primarily obvious compatibility problems
and performance enhancements. Our goal is to put out point releases
more frequently for the next several months (about 3-4 weeks a
release). We want a more rapid release cycle to better address issues
brought up by users of JRuby.

{% assign path = 'http://jruby.kenai.com/downloads/1.3.0/' %}
{% capture bin %}{{path}}jruby-bin-1.3.0{% endcapture %}
{% capture src %}{{path}}jruby-src-1.3.0{% endcapture %}
[JRuby 1.3.0 Binary .tar.gz]({{bin}}.tar.gz) ([md5]({{bin}}.tar.gz.md5), [sha1]({{bin}}.tar.gz.sha1))<br/>
[JRuby 1.3.0 Binary .zip]({{bin}}.zip) ([md5]({{bin}}.zip.md5), [sha1]({{bin}}.zip.sha1))<br/>
[JRuby 1.3.0 Source .tar.gz]({{src}}.tar.gz) ([md5]({{src}}.tar.gz.md5), [sha1]({{src}}.tar.gz.sha1))<br/>
[JRuby 1.3.0 Source .zip]({{src}}.zip) ([md5]({{src}}.zip.md5), [sha1]({{src}}.zip.sha1))<br/>
[JRuby 1.3.0 Complete .jar]({{path}}jruby-complete-1.3.0.jar) ([md5]({{path}}jruby-complete-1.3.0.jar.md5), [sha1]({{path}}jruby-complete-1.3.0.jar.sha1))<br/>

Highlights:

- Fixes so that JRuby runs in restricted environments better like GAE/J
- Accessing primitive Java arrays are about 10x faster
- timeout.rb is now ~40% faster
- Method cache performance improvements
- irb works in `--1.9` mode now
- Additional Miscellaneous 1.9 fixes
- rubygems 1.3.3, rake 0.8.7, and rspec 1.2.6 upgrades
- 66 bugs fixed since 1.2.0

## Previous Release: JRuby 1.2.0

JRuby 1.2.0 has fixed many many compatibility issues and continued to
improve general performance.  Due to popular demand we have a new versioning
system.  1.x.y was our old number system where x was the major release and y
was the minor release.  Our new system just chops off the vestigial '1.' from
the front.  1.3, 1.4, ..., 1.x will just be minor releases of our current
major release.

{% assign path = 'http://jruby.kenai.com/downloads/1.2.0/' %}
{% capture bin %}{{path}}jruby-bin-1.2.0{% endcapture %}
{% capture src %}{{path}}jruby-src-1.2.0{% endcapture %}
[JRuby 1.2.0 Binary .tar.gz]({{bin}}.tar.gz) ([md5]({{bin}}.tar.gz.md5), [sha1]({{bin}}.tar.gz.sha1))<br/>
[JRuby 1.2.0 Binary .zip]({{bin}}.zip) ([md5]({{bin}}.zip.md5), [sha1]({{bin}}.zip.sha1))<br/>
[JRuby 1.2.0 Source .tar.gz]({{src}}.tar.gz) ([md5]({{src}}.tar.gz.md5), [sha1]({{src}}.tar.gz.sha1))<br/>
[JRuby 1.2.0 Source .zip]({{src}}.zip) ([md5]({{src}}.zip.md5), [sha1]({{src}}.zip.sha1))<br/>

Highlights:

- Improved Ruby 1.9 support (via `--1.9`)
  - Compiler now works
  - Almost all of the missing 1.9 methods have been added
- New experimental --fast flag which does more aggressive optimizations
- Large scale compiler and runtime cleanup and performance audit
- Parsing is 3-6x faster now.
- Preliminary android support (Ruboto)
- Rails pathname issue fixed on Windows
- Major bug triage since last release
- 1052 revisions since 1.1.6
- 256 bugs fixed since 1.1.6
