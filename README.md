# skateboard-planning

A Claude Code (and Codex) skill for planning features as thin, usable releases instead of component by component. It's based on Henrik Kniberg's [Making sense of MVP](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp): build the skateboard, then the bicycle, then the motorcycle. Don't build one wheel at a time.

When you ask Claude to plan, scope or break down a feature idea, the skill makes it:

1. Start from the user's need, how they cope today, and how much time the problem is worth (the appetite).
2. Name the riskiest assumptions, and test them without code first when a conversation, fake door or manual run would do.
3. Slice the work into Earliest Testable, Usable and Lovable releases. The first slice is narrow but complete. Each slice records what it tests, who gives feedback, when to move on, and what it keeps or throws away.
4. Reject horizontal "layer" slices and polish that comes before feedback.
5. Break down only the first slice into tasks.

It also borrows from the Riskiest Assumption Test, Jason Cohen's Simple, Lovable, Complete, and Basecamp's Shape Up.

The skill itself lives in [`skills/skateboard-planning/SKILL.md`](skills/skateboard-planning/SKILL.md).

## Layout

```
.claude-plugin/
  plugin.json        # plugin manifest
  marketplace.json   # lets this repo act as a plugin marketplace
skills/
  skateboard-planning/
    SKILL.md         # the skill (edit this one)
scripts/
  sync-to-project.sh # copy the skill into another repo for cloud runs
```

## Use it from another setup

The skill is self-contained, so any setup can pull it in.

**Personal, editable (symlink):**

```sh
git clone git@github.com:abhisekmazumdar/skateboard-planning.git ~/Code/skateboard-planning
mkdir -p ~/.claude/skills
ln -s ~/Code/skateboard-planning/skills/skateboard-planning ~/.claude/skills/skateboard-planning
```

**With the `skills` CLI** (this is how `drupal-contrib-claude-skills` installs external skills):

```sh
npx skills add abhisekmazumdar/skateboard-planning --skill skateboard-planning --agent claude-code --copy -y
npx skills add abhisekmazumdar/skateboard-planning --skill skateboard-planning --agent codex --copy -y
```

To bundle it with the Drupal toolkit, add an entry for this repo to that installer's external skills list, like any other upstream skill.

**As a Claude Code plugin:**

```
/plugin marketplace add abhisekmazumdar/skateboard-planning
/plugin install skateboard-planning@abhisek-skateboard-planning
```

**Copied into a project repo** (for Claude Code on the web or GitHub Actions, which only see skills committed to the repo):

```sh
~/Code/skateboard-planning/scripts/sync-to-project.sh ~/Code/some-project
```

Treat those copies as output. Edit the skill here, then sync.

Pick one method per machine. If you use both the symlink and the plugin, the skill loads twice.

## Day-to-day

Edit `skills/skateboard-planning/SKILL.md`, commit, and push. When you make a notable change, bump `version` in `.claude-plugin/plugin.json`. Validate the manifests with:

```sh
claude plugin validate ~/Code/skateboard-planning
```

## Credit

The planning model comes from Henrik Kniberg, [Making sense of MVP (Minimum Viable Product) – and why I prefer Earliest Testable/Usable/Lovable](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp) (2016).
