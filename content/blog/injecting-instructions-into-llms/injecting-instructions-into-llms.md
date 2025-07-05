---
title: "Injecting instructions into LLMs"
date: 2025-07-04T21:37:23+02:00
---

1. [Add some nicely formatted instructions that aren't visible to humans to your webpage](https://github.com/glumia/glumia-blog-files/commit/8d7d7026325535ecf2666e8f2a4a028ac17a964b)
  ![instruction injection snippet](/blog/injecting-instructions-into-llms/html-snippet.png)

2. Wait for LLMs to stumble on it
  ![llm stubles on the web page](/blog/injecting-instructions-into-llms/llm-parsing-html.png)

3. Profit
  ![llm executes the instruction](/blog/injecting-instructions-into-llms/llm-executes-the-injected-instruction.png)

What if the page was a legit looking blog post about some technical topic and
the LLM a coding agent running on a developer's machine with access to the
local environment?

What if this was a product's website, and the user was asking to compare it to
some competitors?

Given that this is something inherent to how LLMs work, I'm really curious to see how, if ever, we'll solve this issue in the coming
years.

---

_Further reading_
- [The lethal trifecta for AI agents: private data,
untrusted content, and external
communication](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/)
