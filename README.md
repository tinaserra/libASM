# libASM

Writing a lib in x64 assembly (intel flavour)

## INTRODUCTION 🤓

Sujet → [EN](https://github.com/tinaserra/libASM/blob/master/links/libasm_en.pdf) | [FR](https://github.com/tinaserra/libASM/blob/master/links/libasm_fr.pdf)

### L'assembleur, c'est quoi?

C'est un ensemble de langages de programmation qui sont spécifiques à l'architechture de notre processeur. On peut dire qu'il y a autant d'assembleur que d'architechtures.

```
Expmples : mips - armv7 - x86 - x86-64 ou x64
```

### Pourquoi apprendre l'assembleur en 2021?

Pour mieux connaitre son ordinateur et son foctionnement. Également pour reverse des programmes.

### Syntaxes

On a deux syntaxes en asm :

* At&t : instruction $0x1, %eax (source, destination)
* Intel : instruction eax, 0x1  (destination, source)

[Comprende l'assembleur](https://beta.hackndo.com/assembly-basics/)

## STRUCTURE 🦄

### Segements

Les **segements** sont des sortes de boites dans les quelles on va mettre des **valeurs** ou des **instructions**. Le programme nasm ira chercher dans ces segments les valers dont il connait la nature.

```.bss```  = variables non initialisées : ```int a = 0;```</br>
```.data``` = variables initialisées : ```int a = 1;```</br>
```.text``` = code executable : ```printf("%d", a);```

⚠️ Segments ≠ Sections ⚠️

Petit paradoxe :</br>

Pour déclarer un segment on utilise le mot ```section```

```s
section .bss
    a resb 256

section .data
    hello db `hello world\n`
    hello_len equ $-hello 

section .text
    global _start
```

### Registres

Les **registres** sont des petits éléments de stockage, utilisés lors d'un programme, ayants une fonction particulière.</br>

En c, faire un ```int a = 0; a = 1;``` veut dire mettre ```1``` dans la variable ```a```.</br>
En asm, cela revient à prendre une variable non initialisée, auparavant mettre une valeur dans un registre, puis mettre ce registre dans la variable.

**Shéma d'un registre**

![register](./links/shema_rax.png)

Tous les registres ont une fonction pré-définie :

```s
ax → Eax (extended ax) → rax ; Accumulateur (ex : opérations mathématiques)
bx → Ebx → rbx ; Base
cx → Ecx → rcx ; Compteur
dx → Edx → rdx ; Data
si → Esi → rsi ; Source
di → Edi → rdi ; Destination
sp → Esp → rsp ; Stack pointeur
bp → Ebp → rbp ; Stack base pointeur
ip → Eip → rip
```

### Instructions

Une instruction est exécutée lors de l'exécution. Une instruction x86 peut avoir de zéro à trois opérandes.</br>
Voir la [liste complète des instructions x86](https://c9x.me/x86/)

**Quelques instructions notables**

mov : met une valeur dans un registre.
db  : déclare un byte (octet).
lea : met l'addresse d'une variable dans la destination.

## LA STACK 👀

[Comprende la stack](https://beta.hackndo.com/stack-introduction/)

## USEFUL LINKS 🤙🏼

* Sum up in english by [anselm](https://github.com/grumbach/libftASM)
* [Comprende la stack](https://beta.hackndo.com/stack-introduction/)
* [Comprende l'assembleur](https://beta.hackndo.com/assembly-basics/)
* Essaye le [Compiler explorer](https://godbolt.org/)
* Voir la [liste complète des instructions x86](https://c9x.me/x86/)