+++
title = "Random thoughts on Software Engineering and Science"
tags = ["Software Engineering","Science", "Philosophy", "Reading"]
date = "2021-07-23T19:06:35+02:00"
+++

The other day I was randomly reading some stuff on lobste.rs, when I found this post [*"What I learned from Software Engineering at Google"*](https://lobste.rs/s/9n7aic/what_i_learned_from_software_engineering). As I usually do, I skimmed through the comments and decided to stop there - more often than not it's enough information to decide if a full read is worth it or not. I know, that's not an infallible heuristic, but our time in this world is limited and I can't keep up with everything that's on the web, even if I would like to.

@peterbourgon makes a good point in the comments saying that some things could not make sense out of context and that one should take carefully such advice on software development. I can't agree more, I have seen atrocities committed by people who read a book (\*cough\*Clean code\*cough\*) or a blog post and blindly applied what they've seen to their projects.

Heck, that's what I did even myself, take a look at [github.com/glumia/polito\_dl](https://github.com/glumia/polito_dl), where I transformed a simple script into and hyper-fragmented, unreadable code base. [Before](https://github.com/glumia/polito_dl/tree/6aafd7f1d7b98a25caeba3a86006d619360af415) --> [After](https://github.com/glumia/polito_dl). *Code should be composed of small functions that do only one simple thing and are easy to test*. That's what I was repeating myself while committing that crime. That's what happens when you sell such advice as an absolute truth to an inexperienced developer. It took me some time to understand what phrases like *one single thing* and *easy to test* really mean. The truth is that encapsulation, separation of concerns, testability, are all topics that take time to be really digested and assimilated, and it isn't enough to read a single blog post (let alone a single sentence) to get them.

Among the others, one comment by @hwayne got my attention:
> Welp I’m officially nerd sniped, gonna try to do a very broad write-up tomorrow. tl;dr most of the research is pretty rotten and I don’t think there’s strong evidence either way.

This resonates with a sentiment I've been developing lately regarding software, and more in general science. Science, not as intended in Physics, Math, or other 'hard' sciences, but as it is in those fields that are inherently complex and hard to measure, where people make claims based on (weak) statistics.

I was and still am in some way a weightlifting enthusiast. I've spent my adolescence reading stuff about sports nutrition and training and it took me something like 5 years to finally realize that the things that matter are few and simple and that the rest is either snake oil or subtleties that make sense only for professional athletes.

*few and simple*: foundational concepts about nutrition like total calories intake, macronutrients balance, intensity and volume on training, etc.  
*rest*: crazy diets, 95% of food supplements, hyper-complicated training techniques, etc.

A pivotal point in making me as skeptical as I am today was studying statistics at university. When you see with your eyes how easy it is to lie with numbers you understand that you can't blindly trust anything, academic papers included. I also have to thank *ironpaolo* (a weightlifting blogger I read at the time) for teaching me to always hunt for primary sources of information and never stop to blog posts/articles.

I think those are concepts, skepticism on numbers without context and importance of primary sources of information, that really carry on to whatever field you're interested in, whether it is sports nutrition, training, software development, or any other one where people make claims backed by science™ and numbers.

Anyway, I forgot about the post and the thing stopped there, until I saw another one some days later, ["I \*\*\*\*ing hate Science"](https://lobste.rs/s/v4unx3/i_ing_hate_science). It's the write-up @hwayne promised!

This post (this time I read it) and the comments on lobste.rs are gold content,
and resonates with many ideas I've developing lately.

Some of them:
- The web is an invaluable source of information. Unfortunately, quality content is buried under piles and piles of marketing bullshittery. Searching for that content is painful and it becomes worse and worse as time goes by.

- Foundational knowledge matters and outweighs everything else. Read about algorithms, data structures, computer networks, architectures and not about language X or framework Y, or if you do, take your time to go really deep and see how they are implemented and the design decision they are backed by.

- Too many developers blindly apply *industry best practices™* to their projects ending with unmaintainable over-engineered monstrosity. It's bad when people do cowboy coding, it's even worse when they blindly follow principles they just read on the web or on a book. *Complexity is such a beast to deal with…*

Maybe I'll write about them in the future.

And you? What do you think? If you have anything to say reach out to me through
my email, I love to talk about that kind of stuff.

---

By the way, if you want to dig into it, here's the full rabbit hole that inspired this blog post:
- [What I learned from Software Engineering at Google (lobste.rs)](https://lobste.rs/s/9n7aic/what_i_learned_from_software_engineering)
- [I \*\*\*\*ing hate Science (lobste.rs)](https://lobste.rs/s/v4unx3/i_ing_hate_science)
- [I \*\*\*\*ing hate Science](https://buttondown.email/hillelwayne/archive/i-ing-hate-science/)
- [The Register article inspired by Hillel's post](https://www.theregister.com/AMP/2021/07/22/bugs_expense_bs)
- [Degrees of dishonesty](https://gist.github.com/Morendil/258a523726f187334168f11fc8331569)

