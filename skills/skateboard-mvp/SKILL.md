---
name: skateboard-mvp
description: Plan a feature, product or idea as a series of thin, usable releases (skateboard, bicycle, motorcycle) instead of building components layer by layer. Use whenever asked to plan, scope, break down or roadmap a feature idea, a new module or tool, or "how should we build X".
---

# Skateboard MVP

Plan the way Henrik Kniberg describes in "Making sense of MVP" (https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp):

- **Not like this:** wheel, then chassis, then body, then car. Nobody can use anything until the end, and wrong assumptions stay hidden until it's too late to fix them cheaply.
- **Like this:** skateboard, then scooter, then bicycle, then motorcycle, then car. Every step is something a real person can use to get from A to B. Each step is shaped by feedback on the previous one, and the end result may not be a car at all.

The car is a metaphor. The point is to start from the user's need and get something usable in front of them as early as possible.

## Step 1: Find the need (A to B)

Before slicing anything, write down:

- **Who** has the problem? Name a real person or group, not "users".
- **What** are they trying to do? Describe the outcome, not the feature they asked for. "Wants a car" usually means "needs to get from A to B".
- **How** do they cope today? The current workaround is the bar the skateboard has to clear.
- **How much is it worth?** Set the appetite: the time this problem deserves before you see feedback, such as "three days" or "two weeks". Shape the skateboard to fit the appetite. Don't estimate it afterwards.

If any of these is unclear and a wrong guess would change the plan, ask at most three short questions first. Otherwise state your assumption in one line and carry on.

## Step 2: Name the riskiest assumptions

List the two to four assumptions that would sink the idea if they were wrong. For example: people want this at all, the data or API exists, it performs well enough, maintainers will accept the approach, people will configure it. The early slices should test these first.

Then ask: **can we test the riskiest one without building anything?** A conversation with five target users, a fake "coming soon" button that counts clicks, doing the job by hand for one client (concierge), or faking the automation behind a real-looking front end (Wizard of Oz) is often faster and cheaper than any code. If one of these would answer the question, make it the skateboard, or put it before the skateboard as a "before we build" step.

## Step 3: Slice into releases

Use Kniberg's three stages. Stop at whatever stage makes sense, and don't plan past the first two in detail.

1. **Earliest Testable Product (skateboard):** the smallest end-to-end thing a real person can try, built so you can learn. It can be rough, manual, hard-coded, behind a flag, or run on one site. It doesn't have to be code: a config recipe, a prototype, a script, or a patch shown to one maintainer can count. It should take days to build, not weeks. Keep it **narrow but complete**: it fully does one small job for one group of people, rather than half doing the big job for everyone. A skateboard gets you there. Half a car doesn't.
2. **Earliest Usable Product (bicycle):** the first version that early adopters will choose to use without being pushed.
3. **Earliest Lovable Product (motorcycle):** the version people like, recommend, or would pay for.
4. **Later (car, maybe):** one or two lines at most. Say plainly that feedback from the earlier slices will reshape it.

For each slice, give:

- **What a user can do:** one or two sentences, from the user's point of view.
- **In / out:** what's included and, just as important, what's deliberately left out.
- **What we learn:** which assumption from Step 2 it tests.
- **Feedback from whom, and how:** name the people or channel, such as a teammate, one client site, an issue queue, a meetup demo, or an alpha release.
- **Move-on signal:** what result means "go to the next slice", and what result means "change direction".
- **Keep / throw away:** which parts carry into the next slice (data model, core logic, integrations) and which are scaffolding you expect to replace (hard-coded config, manual steps, the quick UI). Decisions about the parts you keep compound, so get those roughly right even in the skateboard.
- **Rough size:** in days or weeks, within the appetite.

## Step 4: Check the slices

Rewrite the plan if any of these are true:

- **A slice is a horizontal layer** ("design the schema", "build the API", "write the UI") instead of something a person can use end to end. Layers belong inside a slice, as tasks.
- **The first slice can't be shown to anyone** at the end of it.
- **The first slice is incomplete for its job.** If the person still has to fall back on today's workaround to finish the task, narrow the job until the slice covers it fully.
- **The first slice doesn't fit the appetite.** Cut scope, or narrow the audience, until it does. Don't stretch the time.
- **Code is planned where a cheaper test would do.** If a conversation, fake door or manual run could answer the riskiest assumption, do that first.
- **Polish comes before feedback**, for example settings UIs, theming, edge cases, full test coverage, or docs sites in slice 1. (A test or two that proves slice 1 works is fine.)
- **A slice doesn't test anything.** If there's nothing to learn from it, merge it into another slice or drop it.
- **Later slices are planned in more detail than the first.** Detail should go down as slices go out.

## Step 5: Break down only the first slice

Turn the skateboard alone into concrete tasks, in build order. Data model, service, API and UI work all appear here, inside the slice. Leave the later slices at the level of Step 3, because what you learn from the skateboard will change them.

## Output format

Unless the user asks for something else, use this shape:

```
## Need
Who / what outcome / today's workaround (2-4 lines)
Appetite: <time budget before first feedback>

## Riskiest assumptions
1. ...

## Before we build (only if a no-code test fits)
<conversation / fake door / concierge / Wizard of Oz>: tests #1, ~N days

## Slices
### 1. Skateboard: <name>  (~N days)
User can: ... (narrow but complete for one job)
In: ... | Out: ...
Tests assumption: #1
Feedback: <who, how>
Move on when: ... | Change direction if: ...
Keep: ... | Throw away: ...

### 2. Bicycle: <name>
...

### 3. Motorcycle: <name>
...

### Later
...

## Slice 1 tasks
- [ ] ...
```

Keep it tight. A plan someone can scan in two minutes is better than an exhaustive one.

## When the user wants a different approach

If the user explicitly wants a component-first or big-bang plan (a fixed-scope contract, a migration that has to switch over all at once, a spec that's already been decided), follow their request. Say in one line where an early usable slice could still lower the risk, then move on.
