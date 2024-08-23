---
title: "Yu-Gi-Oh!"
icon: material/cards-playing
---

# Yu-Gi-Oh!

## Ideas for Yu-Gi-Oh! 2.0

<!--
Formatting is a little bit weird here since Material for MkDocs
use a syntax for description lists that is not parsed by the formatter:

`Description entry`

:   Descripion paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

    Another description paragraph. Ut enim ad minim veniam, quis nostrud exercitation ullamco
    laboris nisi ut aliquip ex ea commodo consequat.
-->

Here are some ideas that I would implement if I were designing Yu-Gi-Oh!.

`One normal summon per main phase`

: This is undoubtedly the most ambitious idea,
and it would require adjustments to the ban list to be properly balanced.
However, it could significantly improve the experience of going second,
as it would allow players to establish their board
through problematic floodgate monsters that you need to run over
(I'm looking at you, Apollos).

`No restriction on setting monsters`

: This idea comes from a suggestion from Farfa's chat during an episode of _Hearth of the Cast_.
The concept is that setting monsters would no longer count as a Normal Summon,
allowing players to set as many monsters as they wish or can afford to.
This change could potentially bring back flip monsters,
which have all but vanished from the game.
It would also provide a defensive option for players who have been severely disrupted by hand traps
(i.e., hand-trapped to death, gotta love that Snake-Eyes format),
allowing them to build a wall.

    However,
    if this rule were to be implemented, cards like Ninjas and other effects that flip cards face-up
    would need to be carefully balanced.
    It should not be possible, or at least not easy, to flip all your set monsters on the first turn.

`Old field spell rules`

: I'm not a fan of the current field spell mechanics.
In my opinion, field spells should function more like they do in the anime,
where they create a shared playing field that affects both player equally.
Remember the Mystic Mine format? The strategy often boiled down to "draw the out".
Under the old field spell rules, you'd have more outs by simply replacing the field spell.

    Under this ruling, field spells that allow players to add cards upon activation
    should offer this benefit to both players.
    For example, here's how [Primeval Planet Perlereino] could be reimagined:

    > When this card is activated: _Both players_ can add 1 "Tearlaments" monster
    or 1 "Visas Starfrost" from their Deck to their hand.
    Fusion Monsters and "Tearlaments" monsters ~~you control~~ on the field gain 500 ATK.
    If a "Tearlaments" monster _controlled by the turn player_ or in _their_ GY
    is shuffled into the Deck or Extra Deck (except during the Damage Step):
    _That player_ can target 1 card on the field; destroy it.
    _The turn player_ can only use this effect of "Primeval Planet Perlereino" once per turn.
    You can only activate 1 "Primeval Planet Perlereino" per turn.

<!-- markdownlint-disable MD053 (cannot detect reference in indented block)-->

[Primeval Planet Perlereino]: https://yugipedia.com/wiki/Primeval_Planet_Perlereino

<!-- markdownlint-enable MD053 -->

## Rulings

### Token rulings

Tokens exist as monsters on the board and are always treated as **normal monsters**,
even if they are given an effect.
Precisely, some monster tokens have effects applied to them by the card that summon them,
but these are not effects of the token themselves, so they cannot be negated by Skill Drain.

Tokens can only exist on the field, and not anywhere else.
They cannot be attached as Xyz material,
because Xyz materials are not considered to be on the field.

Tokens can only exist face-up. Thus, they cannot be targeted by, and are unaffected by,
effects that would flip them face-down such as Book of Moon.
Similarly, tokens cannot be banished face-down, and are unaffected by card effects that would do so.

If a token would leave the field, it simply ceases to exist and is removed from game.
This also applies to tokens that are temporarily banned,
and such will not return to the field at the time specified by the effect.

### Buster Blader Swordsman vs The Ultimate Creature of Destruction

[Buster Blader, the Dragon Destroyer Swordsman] imposes the following lock on Dragon monsters:

> Change all Dragon monsters your opponent controls to Defense Position,
> also Dragon monsters in your opponent's possession cannot activate their effects.

In the OCG text, it states instead that

> Your opponent cannot activate the effects of Dragon-type monsters.

This means that the second part of the lock affects the player and not the monster.
They cannot activate the effect of Dragon monsters.
According to Jeri Sama,
the consensus in TCG is that "X monster cannot activate its effects" always affect the player.
In that way, if a Dragon monster is made unaffected by card effects
with cards such as [The Ultimate Creature of Destruction] or Number 81,
it would be possible to change it to Attack Position
but not to activate its effects under the Buster lock.

[Buster Blader, the Dragon Destroyer Swordsman]: https://yugipedia.com/wiki/Buster_Blader,_the_Dragon_Destroyer_Swordsman
[The Ultimate Creature of Destruction]: https://yugipedia.com/wiki/The_Ultimate_Creature_of_Destruction

### Necrovalley and Horus monsters (inherent summons from the graveyard)

While [Necrovalley] is active,
[Horus] monsters cannot be special summoned from the graveyard with their [inherent summon] effect:

> Imsety, Glory of the Horus:
> _If you control "King's Sarcophagus", you can Special Summon this card (from your GY)._

Even if inherent summons are non-activated effect (they do not start a chain),
they are still effects and are therefore negated by Necrovalley:

> Necrovalley:
> _Negate any effect that would move a card in the GY to a different place._

On the other hand,
Necrovalley cannot negate **summoning condition** such as [The Bystial Lubellion]'s:

> The Bystial Lubellion:
> _Must be Special Summoned (from your hand or GY) by Tributing 1 Level 6 or higher DARK Dragon monster._

[Necrovalley]: https://yugipedia.com/wiki/Necrovalley
[Horus]: https://yugipedia.com/wiki/Imsety,_Glory_of_Horus
[The Bystial Lubellion]: https://yugipedia.com/wiki/The_Bystial_Lubellion
[inherent summon]: https://ygoprodeck.com/article/important-yu-gi-oh-rulings-inherent-summons-16080

### Pendulum Monsters under Macro Cosmos

The game rules state that

> Whenever one of your Pendulum Monster Cards on the field
> (regardless of which Zone it is in, or even if it is a monster or not)
> would be sent to the Graveyard,
> place it face-up on your Extra Deck instead.

[Macro Cosmos] (or [Dimension Shifter]) redirection
apply on top of the redirection of Pendulum monsters
and then banishes them when they hit the graveyard (before they are placed on the Extra Deck).

Keep in mind that Pendulum cards are placed face-up in the Extra Deck
**only if they are sent from the field**.
This is the reason why you can use Dragon Shrine to foolish [Darkwurm]
to activate its graveyard effect.

[Macro Cosmos]: https://yugipedia.com/wiki/Macro_Cosmos
[Dimension Shifter]: https://yugipedia.com/wiki/Dimension_Shifter
[Darkwurm]: https://yugipedia.com/wiki/Supreme_King_Dragon_Darkwurm

### Hieratic Seal and Spell Cards (Return Spell Card to Hand)

When a Normal, Quick-Play or Ritual Spell Card, or a Normal or Counter Trap Card is activated,
it cannot be returned from the field to the hand during
that chain unless it has an effect that would cause it to remain on the field after activation,
such as Swords of Revealing Light.

For that reason Hieratic Seal cannot bounce Spell/Traps cards unless there are Continuous Spells.
