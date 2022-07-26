# Kiramoji

Kiramoji is a modified version of Kareha. Kareha is an anonymous message board, popular in Japan. No registration is required to post.

Anonymous message boards tend to put more emphasis on posted content, freeing the message authors from limitations and negative experiences typically present when using other messaging platforms. Should you wish to, you can, however, use the nickname everyone knows you by.

Kiramoji can operate in two modes, as an image board or a text board.

Kareha itself is an incredibly impressive achievement, many features are pushing Perl's boundaries, mostly using core dependencies and not a single C extension.

## About this version

This is a modified version of The original [Kareha](https://wakaba.c3.cx/s/web/wakaba_kareha), written by Dag Ågren/WAHa.06x36 in Perl. Later, it was further modified by [hotaru2k3](https://github.com/hotaru2k3), fixing WebKit/related issues, as well as adding some minor changes.

This fork is based on the above mentioned modified version, with a few changes added here and there and it is probably the most recent and maintained version out there.

I am by no means a Perl expert, so pull requests and issues are more than welcome!

This is the version that runs on our [KiraMoji page](https://kiramoji.ga), feel free to stop by and say hi!

There exists an older [PSGI version here](https://github.com/marlencrabapple/kareha-psgi) based on 3.1.4.

Similarly to Kareha's license, this mod is released into the public domain.

## Changes in this version

- Added Spanish template (thanks to [Guilevi](https://github.com/guilevi))
- Templates are modified to have some [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) attributes, edit fields in particular, as well as some links are properly labelled for screen readers.
- If the board operates in paged mode, page navigation controls are displayed at the bottom of the page for text boards.
- param-related bugs have been fixed, so there are no CGI warnings anymore.
- Added a dice roller for the link field. The syntax is: size d NumberOfDice +/-modifier (optional) a/d (ascending/descending sorting, optional). (for example 6d5+100d will roll 5 6-sided die, add 100 and sort the result in descending order)
- Switched the encoding to UTF-8. This means that messages, templates and the config file are expected to be encoded using UTF-8.
- Swapped out the *SillyName* generator to an adjective/noun-based one, based on https://github.polettix.it/ETOOBUSY/2020/01/28/generate-name/
- Added a *protocol* option which can be changed in *wakautils.pl*, used when generating page links and feeds.
- A more up-to-date spam file, taken from the official Kiramoji instance.

## Known issues

- The Japanese template does not have the ARIA fixes nor pagination, as I unfortunately do not speak Japanese. Pull requests are welcome!

## Changes in hotaru2k3!s fork

This is a modified version of Kareha. some bugs that can cause xhtml errors have been fixed, and a few minor features have been added.

## Installation

### Requirements

First and foremost, you will need a webserver. Apache is a good choice, or [Caddy](https://caddyserver.com) if you prefer something more modern and awesome.

#### Caddy 1

When you download/build Caddy, you will need the [http.cgi](https://caddyserver.com/docs/http.cgi) middleware. Add it in the plugins section.

#### Caddy 2

When building Caddy 2 via [xcaddy](https://github.com/caddyserver/xcaddy), you can use https://github.com/aksdb/caddy-cgi instead. See examples on the same Github page.

#### Kiramoji

Kiramoji does not require much, it should work on most distributions out of the box. The only exceptions are Perl's *CGI* and *utf8::all* modules. You can use a package manager, such as cpan or cpanminus to install them.

_WARNING_: Your version of Perl must be 5.24 or newer.

In case your server does not come with Perl by default, you can install it via your package manager, or [perlbrew](https://github.com/gugod/App-perlbrew). Refer to its documentation for help, usually _man packageManagerName_ will do the trick.

### Setting up Kiramoji

1. git clone https://github.com/Flameborn/Kiramoji
2. Copy everything to your cgi-bin directory.
3. Make sure _kiramoji.pl_ and _admin.pl_ has execute permission (+x).
4. Make sure that the main _Kiramoji_ directory and the _res_ directory are writable (+w).
5. Copy everything from one of the _mode_ directories, either _message_ or _image_, depending on what kind of board you wish to have.
6. Modify _config.pl_, in particular uncomment and change _ADMIN_PASS__ and _SECRET_.
7. If your web server uses https and it does not redirect to it from http by default, edit *wakautils.pl* and change the *$protocol* variable to https. This is for generated links only, it does not add TLS support.
8. Open _YourDomain.com/kiramoji.pl_ to generate the index page.

Enjoy!

## FAQ

### How do I run multiple boards?

You can install Kiramoji in multiple directories (see the installation steps above), or you can symlink the files. The _Lndir_ command is quite useful to do this.

### What are tripcodes and Capcodes and how do I use them?

Tripcodes are special hashes of a poster, they are generally used for authenticity. You can use them in the _name_ field when posting. For example:

_YourName#password_ (less secure)

Or:

_YourName##password_ (more secure, based on the SECRET you've changed in the config file.)

Capcodes are defined in _config.pl_, and they are used to replace shown tripcodes with arbitrary text. For example: _!!S5RPiYbB_ could be replaced with _Admin_.

### What is sage and how do I use it?

Sage is a way to post without bumping a thread, i.e. moving it to the top of the list. You can post using _sage_ by entering _sage_ in the _Link_ field.

### My board's title contains accented characters and it does not display correctly. Why?

Kiramoji is now using UTF-8. Please make sure that your configuration file _config.pl_ is encoded as UTF-8.

### My template has accented characters and it does not display correctly. Why?

Kiramoji is now using UTF-8. Please make sure that your template file _templates.pl_ for your language (e.g. JP) is encoded as UTF-8.

### How do I switch to a new template?

You need to edit __kiramoji.pl_ and change the line:

_BEGIN { require 'templates.pl'; }_

to reflect the new templates filename.

An alternative method is to rename whatever templates file you wish to have to templates.pl. Make sure you have a backup version of the old _templates.pl_ file, in case you wish to switch back to the original.
