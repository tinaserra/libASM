# libASM
<<<<<<< HEAD

Writing a lib in x86 assembly (intel flavour)
=======
Writing a lib in x64 assembly (intel flavour)
>>>>>>> 8c3e8945d60196a191a61664163be1c4478a4266

## INTRODUCTION 🤓

Sujet -> [EN](https://github.com/tinaserra/libASM/blob/master/links/libasm_en.pdf) | [FR](https://github.com/tinaserra/libASM/blob/master/links/libasm_fr.pdf)

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
    global _start ; l'EP ici
```

### Registres

### Instructions

## USEFUL LINKS 🤙🏼
<<<<<<< HEAD

* [Raycasting tutorial video](https://courses.pikuma.com/courses/take/raycasting/lessons/7485598-introduction-and-learning-outcomes)
=======
* [anselm](https://github.com/grumbach/libftASM)
>>>>>>> 8c3e8945d60196a191a61664163be1c4478a4266
