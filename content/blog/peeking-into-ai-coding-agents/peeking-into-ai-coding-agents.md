---
title: "Peeking into AI coding agents"
date: 2025-05-03T00:27:52+02:00
---

I've had a bit of free time in the past few days and I've been reading about AI
coding agents.

It looks like in the end it's mostly sophisticated wrappers around LLMs, with the
main advantage being access to tools they can use to gather more information or
execute actions.

These are all just plain text: you tell the LLM how to communicate if it wants
to use a tool, then when requested you run them and feed back their output.

I guess people tried this already in the past, but it got traction only now as
the major providers' models (Claude, GPT, Gemini) got really good at using
them.

I've been playing around with aider and cursor and, as of today, the latter
seems to overall be more "intelligent" only because it has access to a wider
set of tools (most notably text search).

It's also interesting to look at the prompts these are passing to the LLMs.

Aider's ones can be found [in its
repo](https://github.com/Aider-AI/aider/tree/main/aider/coders) (that's the
nice part of open source, one can learn so much by looking at existing
projects), cursor however hides them... unless you use
`gemini-2.5-pro-exp-03-25` and ask it to return the entire content of the
request you're sending ([here's the chat
log](/blog/peeking-into-ai-coding-agents/cursor-ask-prompt-leak-gemini-2.5-pro-exp-03-25)).

That seems to be a vulnerability of some sort in this model, I couldn't get
Claude or GPT-4o to do the same. Or maybe that's just an hallucination, who
knows.

Anyway, I hope in the future we'll move away from this trend of hiding system
prompts, and it will become normal to expose these and allow their
customization by users.

---

_Further reading_
- https://github.com/automata/aicodeguide
- https://simonwillison.net/2025/Mar/11/using-llms-for-code/
- https://ampcode.com/how-to-build-an-agent
- https://blog.sshh.io/p/how-cursor-ai-ide-works
- https://koomen.dev/essays/horseless-carriages
