# Specialist toolchain

These tools support the workflow in `SKILL.md`; they do not replace authorization or verification. Verify install lines, flags, credentials, and current limits on the official page before running anything. A tool being listed here is not evidence that it is installed, maintained, or appropriate for the current target.

## Level 1: usernames and public profiles

- **OSINT Framework** — branching directory of public sources. Use it to choose a starting branch, not as a scanner. Some linked resources are old or paid. <https://osintframework.com>
- **Sherlock** — checks a username across many public sites. Hits are leads; rate limits and false positives are common. <https://github.com/sherlock-project/sherlock>
- **Maigret** — deeper username checks with HTML/PDF/JSON reports. Expect timeouts and 403s; a match is not an identity. <https://github.com/soxoj/maigret>
- **social-analyzer** — public profiles with optional metadata and screenshots. Extra features may require a browser and other dependencies. <https://github.com/qeeqbox/social-analyzer>
- **Blackbird** — fast username and email checks using WhatsMyName data. Its AI profiling option is separate and optional. <https://github.com/p1ngul1n0/blackbird>
- **socialscan** — registration/availability checks on a smaller set of platforms. Fewer sites, but less noisy than broad username tools. <https://github.com/iojw/socialscan>

## Level 2: emails and phones

- **holehe** — checks whether an email is registered on many sites without alerting the inbox. It does not log in, reset a password, or prove ownership. <https://github.com/megadose/holehe>
- **h8mail** — breach and paste lookup. API keys and local breach collections are sensitive; do not publish raw dumps. <https://github.com/khast3x/h8mail>
- **GHunt** — authenticated Google-account modules. High sensitivity; use only for an authorized Google account investigation. <https://github.com/mxrch/GHunt>
- **Mosint** — Go email-OSINT wrapper. Requires a config file and API keys before it can do much. <https://github.com/alpkeskin/mosint>
- **Have I Been Pwned** — checks known breach exposure. Prefer the official site; API access is paid. <https://haveibeenpwned.com>
- **PhoneInfoga** — formats and scans a phone number; some scanners need credentials. Country code is required. <https://github.com/sundowndev/phoneinfoga>
- **Ignorant** — checks whether a phone number appears registered on a few sites. Narrow coverage; a hit is not a full profile. <https://github.com/megadose/ignorant>

## Level 3: domains, history, and files

- **theHarvester** — public domain/organization intelligence from search engines, certificate logs, DNS datasets, and other sources. Some sources need keys; follow the project's authorization warning. <https://github.com/laramies/theHarvester>
- **Amass** — OWASP attack-surface mapping. Active modes send traffic; use only on an explicitly authorized scope. <https://github.com/owasp-amass/amass>
- **waybackurls** — fetches Wayback URLs for a domain. Old URLs can leave scope or expose sensitive historical paths; filter before visiting. <https://github.com/tomnomnom/waybackurls>
- **gau** — pulls known URLs from the Wayback Machine, Common Crawl, AlienVault OTX, and URLScan. Expect noisy and out-of-scope results. <https://github.com/lc/gau>
- **waymore** — deeper archived-link collection and optional archived responses. Can be huge and slow. <https://github.com/xnl-h4ck3r/waymore>
- **Wayback Machine** — public web archive and calendar view. Captures can be incomplete or missing assets. <https://web.archive.org>
- **crt.sh** — certificate-transparency search for hostnames. A certificate name is not proof that a host is live. <https://crt.sh>
- **ExifTool** — reads and writes metadata in images, video, and documents. Metadata can be stripped or forged; inspect only files you are allowed to have. <https://exiftool.org>
- **Photon** — crawler for URLs, emails, files, and other leads. Crawling sends traffic; use only within an authorized scope. <https://github.com/s0md3v/Photon>

## Level 4: internet-wide search and frameworks

- **Shodan** — search engine for internet-connected devices and services. API and CLI require a key; query only in-scope assets. <https://www.shodan.io>
- **Censys** — internet-wide host and certificate visibility. Search APIs require credentials; the old and new CLIs can conflict. <https://github.com/censys/cencli>
- **urlscan.io** — scans and searches URLs and their network activity. Submitted scans may be publicly visible; choose visibility deliberately. <https://urlscan.io>
- **SpiderFoot** — automation framework with 200+ modules. Modules can send traffic and require keys; review before enabling. <https://github.com/smicallef/spiderfoot>
- **Recon-ng** — modular reconnaissance framework. Its marketplace modules are not all safe or appropriate by default; review each module. <https://github.com/lanmaster53/recon-ng>
- **Maltego Community** — graphical link analysis with transforms. Review each transform and keep the graph within scope. <https://www.maltego.com/downloads/>
- **sn0int** — semi-automatic OSINT framework with sandboxed modules and a package manager. Review modules before running them. <https://github.com/kpcyrd/sn0int>

## Selection heuristics

- Start with the least invasive source that can answer the question.
- Use broad username tools to generate leads, then open the candidate profile and find an independent link before attributing it.
- Treat email and phone tools as personal-data processing, not as neutral “lookups”.
- Separate passive domain review from active enumeration; say which one the user authorized.
- Internet-wide search is not a license to browse unrelated machines. Search only identifiers already in scope.

## Command safety

Install commands and flags change. Prefer the project's current README, release page, or official documentation over copied snippets. Avoid blind `curl | bash` installs when a package manager, signed release, container image, or pinned version is available. Run tools in a virtual environment or container where practical.
