# libASM

Writing a lib in x64 assembly (intel flavour)

## INTRODUCTION 🤓

Sujet → [EN](https://github.com/tinaserra/libASM/blob/master/links/libasm_en.pdf) | [FR](https://github.com/tinaserra/libASM/blob/master/links/libasm_fr.pdf)

### L'assembleur, c'est quoi?

C'est un ensemble de langages de programmation qui sont spécifiques à l'architechture de notre processeur. On peut dire qu'il y a autant d'assembleur que d'architechtures.

```js
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

#### Shéma d'un registre

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

#### Quelques instructions notables

```s
instruction destination, source, last
```

|Instruction|Black Sheep Wall|
| :--- | :--- |
|```NOP```|L'instruction NOP à un octet est couramment utilisée pour aligner la mémoire pour accélérer le saut car il est plus rapide de sauter en utilisant des puissances de 2|
|```push```|Met une **valeur** contenue dans un registre sur la stack et décrémente automatiquement ```rsp``` de **sizeof (valeur)**|
|```pop```|Éjecte **valeur** de la stack dans un registre et incrémente automatiquement ```rsp``` de **sizeof (valeur)**|
|```syscall```|Fais de la puissante magie avec le kernel|
|```call```|Met ```rip``` sur la stack et va a ```destination```|
|```leave```|Libère le stack frame actuel. Déplace ```rbp``` vers ```rsp``` et fait apparaître ```rbp``` de la stack|
|```ret```|Renvoie le ```rip``` enregistré par ```call``` dans ```rip```|
|```mov```|Déplace la valeur de ```source``` dans ```destination```|
|```lea```|Charge l'adresse effective de ```source``` dans ```destination```. ```source``` est une adresse mémoire (partie offset) spécifiée avec l'un des modes d'adressage des processeurs, ```destination``` est un registre à usage général|
|```jump```|Charge le ```destination``` dans ```rip```, ```destination``` spécifie l'adresse de l'instruction à laquelle le saut est effectué. ```destination``` peut être une valeur immédiate, un registre à usage général ou un emplacement mémoire|
|```and```|Effectue l'opération suivante: ```destination = destination & source``` et définit quelques indicateurs|
|```test```|Essentiellement une instruction ```&``` qui ne modifie pas ```destination```|
|```rep```|Répète les opérations de chaîne: répète une instruction de chaîne le nombre de fois spécifié dans le registre de comptage ```rcx```. ```rep``` (répéter), ```repe``` (répéter tant que ==), ```repne``` (répéter tant que !=), ```repz``` (répéter jusqu'à zéro ), et ```repnz``` (répéter tant que != 0)|

## LA STACK 👀

[Comprende la stack](https://beta.hackndo.com/stack-introduction/)

## USEFUL LINKS 🤙🏼

* Sum up in english by [anselm](https://github.com/grumbach/libftASM)
* [Comprende la stack](https://beta.hackndo.com/stack-introduction/)
* [Comprende l'assembleur](https://beta.hackndo.com/assembly-basics/)
* Essaye le [Compiler explorer](https://godbolt.org/)
* Voir la [liste complète des instructions x86](https://c9x.me/x86/)