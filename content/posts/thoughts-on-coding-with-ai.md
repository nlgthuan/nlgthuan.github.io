---
title: 'Thoughts on a workflow driven by AI'
date: '2024-04-05T20:41:49+07:00'
draft:  false
---

> One broken window, left unrepaired for any substantial length of time, instills in the inhabitants of the building a sense of abandonment—a sense that the powers that be don't care about the building. So another window gets broken. People start littering. Graffiti appears. Serious structural damage begins. In a relatively short span of time, the building becomes damaged beyond the owner's desire to fix it, and the sense of abandonment becomes reality.
>
> -- <cite>The Pragmatic Programmer - D. Thomas, A. Hunt</cite>


When using AI to drive my daily work, usually, the feedback I receive is just sub-optimal solutions (not optimized, slightly wrong use of functions, bad design, etc…). It takes great expertise in the current language or framework to address these issues and and prevent the AI from steering in the wrong direction. Because this code just “works”, it’s challenging to detect the code smell.

When we try to produce mass code in a short time with AI, it is definitely harder to detect the code smell. Once the bad code gets into the codebase, the whole project get rotten quickly, just like [the broken window theory](https://www.freecodecamp.org/news/pragmatic-programmer-broken-windows-6916998eecbe/).


To me, working with AI is like working with a junior who knows a lot but can sometimes be annoying by not being humble and trying to make things up. You need to be really good at not letting it lead you in the wrong direction.


I believe that senior developers will benefit more from an AI driven workflow. But for junior developers or seniors when working with new languages, who have not yet been able to review code thoroughly, such workflow can cause more harm than help. We can never trust and learn from “a friend” who loves to make things up and tries to “gaslight” us all the time.


For example, last week, while I was working on the 1 Billion Rows Challenge (the post about this will be updated soon), in a language that I am not very proficient in (Golang, btw). When I tried to find a byte inside a bytes stream, I typed `bytes.I…`, Copilot quickly helped to fill in the rest with `bytes.Index(s, []{','})`, which worked perfectly.
If I weren’t curious enough to ask “why does it require an array of bytes as an argument, I just want to find a single byte”, I would never learn that the more efficient/suitable function `bytes.IndexByte` exists. And I had the same problem with `bytes.Split` and `bytes.SplitN` as well.
Had I tried to reach to the document immediately, I could have found the ideal solution on my first attempt.


If we are not careful enough when working in an AI drivent workflow, the results may initially be very good, but the pace will quickly decrease in subsequent iterations, as the poor-quality code we let in begins to ask us to pay.
