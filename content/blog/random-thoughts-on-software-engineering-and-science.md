+++
title = "Random thoughts on Software Engineering and Science"
tags = ["Software Engineering","Science", "Philosophy", "Reading"]
date = "2021-07-23T19:06:35+02:00"
+++

The other day I was randomly reading some stuff on lobste.rs when I found this post [*"What I learned from Software Engineering at Google"*](https://lobste.rs/s/9n7aic/what_i_learned_from_software_engineering). As I usually do, I skimmed through the comments and decided to stop there - more often than not it's enough information to decide if a full read is worth it or noth (yeah, I know, that's not an infallible heuristic, but hey, our time on this world is limited and even if I would like to I can't read and keep up with everything that's on the web).

@peterbourgon makes a good point in the comments saying that some things could not make sense out of context and that one should take carefully such advises on software development. I can't agree more, I have seen many atrocities committed by people who read `Clean Code` or the like and blindly applied what they've seen to their code base.

Heck, that's what I did even myself, take a look at [github.com/glumia/polito\_dl](https://github.com/glumia/polito_dl), where I transformed a simple script into and hyper-fragmented, over-engineered, unreadable code base. [Before](https://github.com/glumia/polito_dl/tree/6aafd7f1d7b98a25caeba3a86006d619360af415) --> [After](https://github.com/glumia/polito_dl). *Code should be composed by small functions that do only one simple thing and are easy to test*. That's what I was repeating myself while committing that crime. That's what happens when you sell such advice as an absolute truth to an inexperienced developer. If you see any novice doing the same mistake give him a copy of "A Philosophy of Software Design" by John Ousterhout and force him to read it before going back to code (you don't know it? take a look, some things are opinable but it's an awesome book).

Anway, back to the post on lobste.rs, one comment by @hwayne got my attention:
> Welp I’m officially nerd sniped, gonna try to do a very broad writeup tomorrow. tl;dr most of the research is pretty rotten and I don’t think there’s strong evidence either way.

This resonates with a sentiment I've been developing lately regarding software, and more in general 'science'.

I've spent my adolescence reading stuff about sport nutition and training (I was and still am in some way a weightlifting enthusiast) and it took me something like 5 years to finally realize that the things that matter are few and simple and that the rest is snake oil or subtetlies that make sense only for professional athletes.

*few and simple*: foundational concepts about nutrition like total calories intake, macro nutrients balance, intensity and volume on trainings, etc.  
*rest*: crazy diets, 95% of food supplements, hyper-complicated training techniques, etc.

A pivotal point in making me become as skeptical as I am today was studying statistics at university. When you see with your eyes how easy it is to lie with numbers you understand that you can't blindly trust anything, academic papers included. By the way, I also have to thank *ironpaolo* (a weightlifting blogger I read at the time) for teaching me to always hunt for primary sources of information and never stop to blog posts/articles.

I think those are concepts that really carry on to whatever field you're interested in, whether it is sport nutrition, training, software development or any other one where people make claims backed by 'science' and numbers.

Anyway, back again to lobste.rs, the thing stopped there and I forgot about it, until I saw another one some days later, ["I \*\*\*\*ing hate Science"](https://lobste.rs/s/v4unx3/i_ing_hate_science). It's the writeup @hwayne promised!

This post (this time I read it) and the comments are gold content. Really, take some tome to read them, it's worth it.

It made me think to some random ideas I've been developing but have not yet fully crystallized:
- Foundational knowledge matters and outweights everything else. Read about algorithms, data structures, computer networks, architectures and not about language X or framework Y, or if you do, take your time to go really deep and see how they are implemented and the design decision they are backed by.

- The web is an invaluable source of information. Unfortunately, quality content is buried under piles and piles of marketing bullshittery. Searching for that content is painful and it becomes worse and worse as time goes by.

- Too many developers blindly apply 'industry best practices' to their projects ending with unreadable over-engineered monstrosity. It's bad when people do cowboy coding, it's even worse when they blindly follow principles they just read on the web or on a book. *Complexity is such a beast to deal with…*

Maybe you'll see me write about the in the future.

And you? What do you think? If you have anything to say reach out to me through
my email or on twitter, I love to talk about that kind of stuff!

---

By the way, if you want to dig into it, here's the full rabbit hole that inspired this blog post:
- [What I learned from Software Engineering at Google (lobste.rs)](https://lobste.rs/s/9n7aic/what_i_learned_from_software_engineering)
- [I \*\*\*\*ing hate Science (lobste.rs)](https://lobste.rs/s/v4unx3/i_ing_hate_science)
- [I \*\*\*\*ing hate Science](https://buttondown.email/hillelwayne/archive/i-ing-hate-science/)
- [The Register article inspired by Hillel's post](https://www.theregister.com/AMP/2021/07/22/bugs_expense_bs)
- [Degrees of dishonesty](https://gist.github.com/Morendil/258a523726f187334168f11fc8331569)

