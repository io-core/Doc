# Welcome to Integrated Oberon

#### What is Oberon?

Oberon is both an operating system and a computer language, first developed by professors Wirth and Gutknecht for a custom workstation in the 1980s at ETH Zurich in Switzerland. Oberon, both the language and the OS, has been extended, ported, refined, and evolved by themselves and others, with the most recent (2013) incarnation of Project Oberon being a particularly succinct implementation for a custom-designed FPGA RISC architecture.

Project Oberon is self-contained and provides a complete single-user computing experience, having its own compiler, file storage, text and graphics manipulation, and local area network clients and servers. The 2013 version of Project Oberon makes little concession to interoperability with other computing systems.

#### What is Integrated Oberon?

Integrated Oberon departs from Project Oberon by introducing features and capabilities to Oberon, taken from other systems based on pervasiveness (e.g. utf8, markdown, TTF fonts, HTML/DOM, tcp/ip) and utility (multicore and distributed computing, capability based security, the leveraging of immutable data structures and content-addressed storage for replication, deduplication, and eventual consistency, etc.)

None of the above features are implemented yet. As [Extended Oberon](https://github.com/andreaspirklbauer/Oberon-extended) has already re-introduced to 2013 Project Oberon the support for type-bound procedurs in Oberon-2 and other needed features, Integrated Oberon will start from there. 

## How to get it

To run Integrated Oberon you need a [disk image](https://github.com/io-core/io/raw/main/images/io.img) and either an [emulator](https://github.com/pdewacht/oberon-risc-emu) or an [FPGA](https://www.crowdsupply.com/radiona/ulx3s) that has been [programmed](https://github.com/emard/oberon) to implement the [Oberon RISC5 architecture.](www.projectoberon.com)

## How to use it

You can read more about how to get and use the system here:  [Introduction](./intro/Intro.md) to Oberon.

## How to code for it

development process described in Develop.md

## How to contribute to it

Links to the repo, the wiki, some guidelines, etc.

## System Concepts

summary and link to Concepts.md

## The Oberon Language

summary and link to Language.md

## The Oberon Core

summary and link to Core.md

## The Standard Libraries

summary and link to stdlibs.md



