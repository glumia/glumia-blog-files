---
title: "Peeking into AI coding agents"
date: 2025-05-03T00:27:52+02:00
---

I've had a bit of free time in the past few days and I've been reading about AI
coding agents/assistants.

Looks like in the end it's mostly sophisticated wrappers around LLMs, with the
big deal being the access to "tools" they can use to gather more information or
execute actions.

It's interesting how in the end it's all just plain text and conventions for
how the LLM needs to respond if it wants to use a tool. I guess people tried
this already in the past, but it's getting traction only now as the latest
iteration of the major models (claude, gpt, gemini) got purposely trained to
make effective use of them.

They're really good at it. I've been playing around with aider and cursor and,
as of today, the latter seems to overall be more "intelligent" only because it
has access to a wider set of tools (most notably searching for text in the
repository).

It's also interesting to look at the prompts these are passing to the LLMs.

aider's ones can be found [in its
repo](https://github.com/Aider-AI/aider/tree/main/aider/coders) (that's the
nice part of open source, one can learn so much by looking at existing
projects), cursor however hides them... unless you use
`gemini-2.5-pro-exp-03-25` and ask it to return back the entire content of the
request you're sending ([here's the chat
log](/blog/peeking-into-ai-coding-agents/cursor-ask-prompt-leak-gemini-2.5-pro-exp-03-25)).

That seems to be a limitation/vulnerability of some sort of this model, I
couldn't get claude or the gpt 4o to do the same. Or maybe that's just an
hallucination, who knows.

Anyway, I hope in the future we'll move away from this trend of hiding system
prompts, and it will become normal to expose these to users and allow them
to customize them as they see fit.

Further reading:
- https://github.com/automata/aicodeguide
- https://simonwillison.net/2025/Mar/11/using-llms-for-code/
- https://ampcode.com/how-to-build-an-agent
- https://blog.sshh.io/p/how-cursor-ai-ide-works
- https://koomen.dev/essays/horseless-carriages
