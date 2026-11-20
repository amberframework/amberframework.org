# Meet Mica: Amber V2 apps no longer link PCRE2

Make a new Amber app, add a model, build it, and ask your computer what the
finished program needs in order to run. Until today, the list included
libpcre2, a C library for regular expressions, whether or not your own code
ever used one.

As of today it does not. Amber `2.0.0-beta.11`, Grant `0.24.0`,
asset_pipeline `0.38.0` and Amber CLI `2.0.11`, all released on November 20,
2026, produce a default application that links no PCRE2. This is also where
we introduce Mica, the member of the crew who made removing it worth doing.

## What changed today

Amber took regular expressions off its request path in beta.10. In beta.11,
Grant and asset_pipeline follow: the fixed patterns they used internally, for
jobs like reading an import map or finding the imports in a JavaScript file,
are now small hand-written checks. Each one reads its input once, from start
to finish, and is tested to accept and reject the same inputs the old pattern
did.

The result is easy to check. An app made with `amber new -d sqlite` shows no
`libpcre2` in `otool -L` or `ldd` and no `pcre2_` symbol in `nm`, before and
after `amber generate scaffold` adds a Grant model. Amber CLI's CI runs that
check on macOS and Linux, next to a small control program that does use
`Regex` and must show PCRE2, so the check cannot pass by looking in the wrong
place.

A freshly generated beta.11 app is 3,948,720 bytes, which is 31,760 bytes
more than beta.10, and it links no PCRE2.

Your own regular expressions still work. Using `Regex` in your code, or a
feature that takes a pattern, links PCRE2 again, and the
[beta.11 release notes](/releases) list each of those features.

## Why Mica exists

I wanted the Amberverse to rely on its own pieces. Mica is the crew member
who reads: she parses what comes into an application, to published
standards, carrying years of lessons learned from real security failures.
She is calm, precise and a little bookish, which is what you want from the
part of your app that meets untrusted input first.

Regular expressions are a good example of why that matters. An engine that
backtracks, as PCRE2 does, can be handed a pattern and a piece of text that
together take an enormous amount of work to search. On a web server, that is
a request that ties up the server far longer than it should, and enough of
them at once can take it down.

## Mica's regex engine

Mica's regex engine is written in pure Crystal, with no C library underneath.
It is built so that the time a search takes grows in step with the length of
the text, however the pattern is written. Every search also carries a work
budget and a deadline. If a hostile pattern or a hostile input reaches either
one, the search stops with an error instead of holding the request open.

To keep that promise, Mica leaves out the few features that require
unbounded backtracking, such as backreferences and lookaround. Its
documentation lists a rewrite for each one.

Patterns written directly in your source code can take a build-time path:
Mica prepares them when the app is compiled. Those static patterns compile
in about 0.03x of PCRE2's time and allocate 0 bytes per search.

## How fast it is

We did not want to trade speed for safety, so the bar was PCRE2 with its JIT
compiler turned on, which is how Crystal runs it. The benchmark has 479 cases
in 21 groups. 112 of them are patterns built to make a regex engine hang, and
PCRE2 struggles there, so we report everyday patterns on their own. These are
geometric-mean times (a typical case, so no single outlier decides the result)
over the 367 everyday patterns:

| Measure | Mica | PCRE2-JIT | Mica is |
|---|---|---|---|
| Search with fresh text | 101.3 µs | 153.5 µs | 1.5× as fast |
| Compile a pattern | 3.2 µs | 4.6 µs | 1.4× as fast |
| First search of a new pattern | 49.9 µs | 122.5 µs | 2.5× as fast |
| First regex work after an app starts | 212.5 µs | 409.0 µs | 1.9× as fast |

On Amber's own patterns (routes, logs, CSV, templates) a search is 1.35× as
fast, 556 µs against 750 µs. On the 112 hang-prone patterns Mica is 7× as fast
and always stops on time. All 21 groups are at or under PCRE2-JIT on all four
measures, though some single patterns are still slower.

## What is not done yet

Today these numbers come from calling Mica directly. Crystal's own `Regex`
still runs on PCRE2, so your existing patterns do not get this speed yet.
Making `Regex` run on Mica, so existing code gets it without changes, is the
next milestone.

The group results are averages, and some single cases are still slower than
PCRE2-JIT. We are working through them one at a time.

Mica's code, including the regex engine and its benchmarks, is public at
[github.com/amberframework/mica](https://github.com/amberframework/mica).
The regex engine is still under review there and is not yet part of a tagged
Mica release.

To try the regex-free default app, install Amber CLI 2.0.11 and run
`amber new`. Your app is now 31,760 bytes heavier and one C library lighter.

- [See current releases and dates](/releases)
- [Read Mica's code](https://github.com/amberframework/mica)
- [Meet the whole crew](/characters)
