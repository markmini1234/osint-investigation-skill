# Public-platform collection

This is the collection layer for authorized OSINT work. It condenses the channels exposed by the installed `agent-reach` skill. If `agent-reach` is available, its upstream references are authoritative for installation, cookies, and channel-specific quirks.

## Capability check

Check what is actually available before planning collection. Record missing channels as gaps rather than pretending a source was searched.

```bash
agent-reach doctor
command -v mcporter gh yt-dlp bird xhs bili
```

If the `agent-reach` CLI is missing but the skill is installed, read `~/.agents/skills/agent-reach/SKILL.md` and use its underlying commands directly. Record that the CLI health check failed.

## Web pages and search

```bash
# Read most public pages as Markdown
curl -s "https://r.jina.ai/URL"

# Exa web search
mcporter call 'exa.web_search_exa(query: "query", numResults: 5)'

# Exa search limited to a domain
mcporter call 'exa.web_search_exa(query: "query", numResults: 5, includeDomains: ["example.com"])'
```

Use the original page for final verification when possible; a reader proxy can omit content or alter rendering.

## X / Twitter

```bash
bird search "query" -n 10
bird read URL_OR_ID
bird user-tweets @username -n 20
bird thread URL_OR_ID
```

If `bird` is unavailable, use Exa or Jina as a fallback and mark the limitation. Do not treat a search-engine snippet as the full post.

## Reddit

```bash
curl -s "https://www.reddit.com/search.json?q=QUERY&limit=10" -H "User-Agent: osint-investigation/1.0"
curl -s "https://www.reddit.com/r/SUBREDDIT/hot.json?limit=10" -H "User-Agent: osint-investigation/1.0"
```

Reddit may block server IPs. If it does, use an official/authorized API route or record the failure; do not assume the absence of results.

## GitHub

```bash
gh search repos "query" --sort stars --limit 10
gh search code "query" --language python
gh repo view owner/repo
gh issue list -R owner/repo --state open
gh issue view 123 -R owner/repo
```

GitHub can expose commit emails, organization membership, deleted forks, and historical issue content. Keep the investigation tied to the declared target and do not scrape unrelated contributors.

## YouTube and Bilibili

```bash
yt-dlp --dump-json "URL"
yt-dlp --write-sub --write-auto-sub --sub-lang "zh-Hans,zh,en" --skip-download -o "/tmp/%(id)s" "URL"
yt-dlp --dump-json "ytsearch5:query"
```

For Bilibili, use the video URL form:

```bash
yt-dlp --dump-json "https://www.bilibili.com/video/BVxxx"
```

Subtitle text can be auto-generated and repetitive. Treat timestamps and titles as metadata, not proof of identity.

## WeChat articles

Search through Exa when a domain-limited query is enough:

```bash
mcporter call 'exa.web_search_exa(query: "搜索关键词", numResults: 5, includeDomains: ["mp.weixin.qq.com"])'
mcporter call 'exa.crawling_exa(urls: ["https://mp.weixin.qq.com/s/ARTICLE_ID"], maxCharacters: 10000)'
```

Full-text reading may require the installed Camoufox helper:

```bash
cd ~/.agent-reach/tools/wechat-article-for-ai && python3 main.py "https://mp.weixin.qq.com/s/ARTICLE_ID"
```

Jina Reader and plain `curl` often fail on WeChat because of anti-bot controls. Record the failed route instead of silently substituting a snippet.

## Weibo

```bash
mcporter call 'weibo.search_content(keyword: "query", limit: 20)'
mcporter call 'weibo.search_users(keyword: "query", limit: 10)'
mcporter call 'weibo.get_profile(uid: "UID")'
mcporter call 'weibo.get_feeds(uid: "UID", limit: 20)'
mcporter call 'weibo.get_comments(mid: "MID", limit: 50)'
```

## Xiaohongshu

```bash
xhs search "query"
xhs read NOTE_ID_OR_URL
xhs comments NOTE_ID_OR_URL
xhs hot
```

Use the URL or token returned by search. A bare `note_id` may be rejected. High-frequency requests can trigger verification; stop rather than trying to bypass it.

## Douyin

```bash
mcporter call 'douyin.parse_douyin_video_info(share_link: "https://v.douyin.com/xxx/")'
mcporter call 'douyin.get_douyin_download_link(share_link: "https://v.douyin.com/xxx/")'
```

## V2EX

```bash
curl -s "https://www.v2ex.com/api/topics/hot.json" -H "User-Agent: osint-investigation/1.0"
curl -s "https://www.v2ex.com/api/topics/show.json?node_name=python&page=1" -H "User-Agent: osint-investigation/1.0"
curl -s "https://www.v2ex.com/api/topics/show.json?id=TOPIC_ID" -H "User-Agent: osint-investigation/1.0"
curl -s "https://www.v2ex.com/api/replies/show.json?topic_id=TOPIC_ID&page=1" -H "User-Agent: osint-investigation/1.0"
curl -s "https://www.v2ex.com/api/members/show.json?username=USERNAME" -H "User-Agent: osint-investigation/1.0"
```

## Xiaoyuzhou podcast

```bash
~/.agent-reach/tools/xiaoyuzhou/transcribe.sh "https://www.xiaoyuzhoufm.com/episode/EPISODE_ID"
```

The transcription helper needs `ffmpeg` and a configured Groq API key. Output is written to `/tmp/` by default. A transcript is a secondary rendering of the audio; check the episode page and title before relying on it.

## Xueqiu

```python
from agent_reach.channels.xueqiu import XueqiuChannel

channel = XueqiuChannel()
quote = channel.get_stock_quote("AAPL")
stocks = channel.search_stock("Apple", limit=5)
posts = channel.get_hot_posts(limit=10)
```

Stock quotes are public market data, not proof that a person owns an account or a position.

## LinkedIn

```bash
mcporter call 'linkedin.get_person_profile(linkedin_url: "https://linkedin.com/in/username")'
mcporter call 'linkedin.search_people(keyword: "role", limit: 10)'
```

Fallback for a public page:

```bash
curl -s "https://r.jina.ai/https://linkedin.com/in/username"
```

LinkedIn scraping may violate its terms or require a logged-in session. Do not use a personal cookie for an unrelated target, and do not bypass access controls.

## RSS

```bash
python3 -c "
import feedparser
for entry in feedparser.parse('FEED_URL').entries[:5]:
    print(entry.title, entry.link)
"
```

## Collection rules

- Prefer official APIs, public JSON, and documented CLIs.
- Respect rate limits and platform terms. A 403, CAPTCHA, or login wall is a stop signal, not a challenge to bypass.
- Do not share cookies or credentials between cases.
- Do not use a target's account, session, or private data without explicit authorization.
- Capture the canonical URL, retrieval time, collector, and a short quoted excerpt.
- Mark search-engine snippets, cached pages, and AI summaries as secondary sources until the original is opened.
- If a platform is unavailable, record the gap and use a disclosed fallback; never fabricate coverage.
