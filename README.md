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

Les **registres** sont des petits élements de stockage, utilisés lors d'un programme, ayants une fonction particulière.</br>

En c, faire un ```int a = 0; a = 1;``` veut dire mettre ```1``` dans la variable ```a```.
En asm, cela revient a prendre une variable non initialisée, auparavant mettre une valeur dans un registre, puis mettre ce registre dans la variable.

**Shéma d'un registre**

![register](./links/shema_rax.png)

Tous les registres ont une fonction pré-définie :

```s
# registres d'accumulation (ex : opérations mathématiques)
ax → Eax (extended ax) → rax 
bx → Ebx → rbx
cx → Ecx → rcx
dx → Edx → rdx

# registres pour les chaines de caractères sources (rsi) et destination (rdi)
si → Esi → rsi
di → Edi → rdi

# registres pour manipuler la stack 
sp → Esp → rsp
bp → Ebp → rbp

# Autre
ip → Eip → rip
```

### Instructions

mov : met une valeur dans un registre.
db  : déclare un byte (octet).
lea : met l'addresse d'une variable dans la destination.

## LA STACK 🍔



## USEFUL LINKS 🤙🏼

* [anselm](https://github.com/grumbach/libftASM)
