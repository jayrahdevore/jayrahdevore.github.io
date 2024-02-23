---
title: Crytographically Signed Amateur Radio
date: 2024-02-22T19:31:43-05:00
draft: false
---

Amateur radio is built around the honor system.
The difficulty of the hobby seems to be what keeps the airwaves mostly in order (as well as ability of hams to fox hunt bad actors).
For example, APRS simply uses a [hash of your callsign](https://github.com/magicbug/PHP-APRS-Passcode/blob/master/aprs_func.php).
Anyone with your callsign can enter a call sign [into this page](https://apps.magicbug.co.uk/passcode/), compute its hash, and connect to APRS-IS as you.

A little while ago, I found out [that my very own call sign was used by a pirate station](https://www.youtube.com/watch?v=wxHdKyum778).
While I believe wholeheartedly in freedom of speech, this wasn't me.
In everyday life, how can we prove identity in a time when you can't trust everything you hear?
In an emergency, it's important to know who to trust.
What would prevent a pirate station from maliciously diverting resources?

I'm unaware of the state of the hobby in respect to all of this; a bit of searching hasn't brought up much more than hams confusing digital signatures with encryption.
Cryptographic signing doesn't obscure the meaning of a message.
It is not encryption; in the security world, it's a wholly different and a necessary counterpart to encryption.
While encryption scrambles a message, singing proves that a message was originally created by you and hasn't been altered.
A signature is a hash of your private (secret) key and your message content.
The original message is untampered and the signature is added to it.
When your transmission is received, it's computed against a known public and trusted key in a pass/fail test.
Adding a signature isn't in practice much different than adding your APRS-IS password to a packet, except it's mathematically secure and ensures message integrity.

Once we can prove the origin of a message, we can:

- Limit access to a private repeater
- Provide centralized authentication services that, after a certificate is given, works without the internet
- Decentralize authentication infrastructure with a local [web of trust](https://en.wikipedia.org/wiki/Web_of_trust)
- Provide access control to privately held hardware and RF links (without encryption)

Digital text is a low hanging fruit.
Signatures can be created and computed easily with common open source tools.
For the lazy, this could be a copy-paste deal.
That said, the signatures won't work if the data packet isn't bit-for-bit perfect (that's another bug/feature of signatures as well).
This limitation may prove unwieldy for data hungry voice transmissions.
Maybe there's a place for it someday in the [M17 project](https://github.com/M17-Project/).

Stepping out of ham radio for a moment, I believe that digital signatures will become an essential part of everyday life.
With the ever-increasing prevalence of AI, it's hard to know if what is online is truly coming from a human (let alone someone you know).
The [dead internet theory](https://en.wikipedia.org/wiki/Dead_Internet_theory) has a lot more weight to it now.
For us hams, we should take note and experiment with ways that we can keep the airwaves a trustworthy way to chat with one another.
